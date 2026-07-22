# Enhanced makefile for Sphinx documentation (manual env activation expected)

SPHINXOPTS  ?=
SPHINXBUILD ?= sphinx-build
SOURCEDIR   ?= docs
BUILDDIR    ?= docs/_build
PORT        ?= 8000

# Default target shows available Sphinx targets.
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

html:
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

serve: html
	@echo "Serving $(BUILDDIR)/html at http://localhost:$(PORT)"
	@cd "$(BUILDDIR)/html" && python -m http.server $(PORT)

livehtml:
	@command -v sphinx-autobuild >/dev/null 2>&1 || { \
		echo "sphinx-autobuild is not installed."; \
		echo "Install with: pip install sphinx-autobuild"; \
		exit 1; \
	}
	@sphinx-autobuild "$(SOURCEDIR)" "$(BUILDDIR)/html" $(SPHINXOPTS)

.PHONY: help html clean serve livehtml Makefile

# Catch-all: route unknown targets to Sphinx make-mode.
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
