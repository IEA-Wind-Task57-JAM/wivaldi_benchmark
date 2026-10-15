Benchmark Phase 1
=============================================

Case Selection and Thresholds
-----------------------------
The benchmark cases are selected based on specific meteorological thresholds to isolate periods of interest that represent distinct atmospheric conditions. 

*   **Wind Speed Threshold:** 8 m/s < U < 10 m/s
*   **Wind Direction Sector:** 288.5° < Ψ < 262.5°
*   **Atmospheric Stability:** |dθ| < 0.75 K / 100m
*   **Turbine Availability:** OPUS1 and OPUS2 in normal operation
*   **Measurement Availability:** Mast + Nacelle lidar + Profiling lidar + MWR

Filtering is based on regular 10-minute averages in first place. Adjustment to most stationary periods on a minute-scale is done manually in a second step.

.. image:: images/2025-2026_filtering.png
  :width: 80%



The following meteorological conditions are observed at hub height (92 m) in the inflow for the selected periods:


.. list-table::
   :widths: 20 15 15 15 15 15 15 15
   :header-rows: 1

   * - Parameter
     - 19.12.2025, 15:25
     - 21.02.2026, 14:30
     - 21.02.2026, 16:10
     - 01.03.2026, 02:30
     - 04.05.2026, 18:12
     - 16.05.2026, 18:14
     - Average
   * - U / m/s
     - 9.3
     - 8.8
     - 9.7
     - 9.2
     - 9.3
     - 7.8
     - 9.0
   * - Ψ / °
     - 261.3
     - 262.3
     - 260.3
     - 261.7
     - 260.6
     - 261.3
     - 261.3
   * - Yaw / °
     - 259
     - 260
     - 257.5
     - 259
     - 259.5
     - 259.5
     - 259
   * - TI / %
     - 7.7
     - 7.8
     - 7.4
     - 9.6
     - 10.6
     - 8.1
     - 8.5
   * - α
     - 0.22
     - 0.35
     - 0.26
     - 0.21
     - 0.26
     - 0.24
     - 0.26
   * - dθ / K / 100 m
     - -0.22
     - 0.72
     - 0.56
     - 0.23
     - 0.23
     - 0.31
     - 0.30

Data Processing Methodology
---------------------------

To create a high-quality, continuous atmospheric dataset for the benchmark, data from multiple instruments are processed, interpolated, and merged into a single vertical profile. The primary instruments include an IEC-compliant meteorological mast, a Windcube-200S (ZX) lidar, a long-range WLS lidar, and an RPG-HATPRO-G5 microwave radiometer (MWR).

Diurnal Cycle
^^^^^^^^^^^^^^

Wind profile time-height plot up to 2000 m. On 21 February 2026 and 01 March 2026, the long-range lidar for vertical profiling is not available

.. image:: images/202512191525_wind_diurnal.png
  :width: 80%
.. image:: images/202604051812_wind_diurnal.png
  :width: 80%
.. image:: images/202605161814_wind_diurnal.png
  :width: 80%

Potential temperature diurnal time-height plots are available for all days:

.. image:: images/20251219_theta_diurnal.png
  :width: 80%
.. image:: images/20260221_theta_diurnal.png
  :width: 80%
.. image:: images/20260301_theta_diurnal.png
  :width: 80%
.. image:: images/20260405_theta_diurnal.png
  :width: 80%
.. image:: images/20260516_theta_diurnal.png
  :width: 80%

At the ground station of the microwave radiometer, we observe the following dirunal cycles:

.. image:: images/ground_met_diurnal.png
  :width: 80%


Vertical Grid and Temporal Averaging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
All measurement data is aggregated into 10-minute temporal intervals. To ensure consistency across different sensor heights, the raw data is linearly interpolated onto a standardized vertical grid ranging from 10 m to 1000 m above ground level, with a strict vertical resolution of 2 m. 

Wind Profile Combination (Mast and Lidars)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The wind speed and wind direction profiles are constructed using a tiered approach that prioritizes mast measurements, blending them with lidar data at higher altitudes.

*   **Lidar Merging:** The ZX and WLS lidar profiles are first combined. In regions where both lidars provide valid data, their values are averaged (using a circular mean for wind direction).
*   **Bias Correction:** The combined lidar profile is bias-corrected to match the meteorological mast. The offset is calculated at the highest overlapping valid mast measurement, and this scalar shift is applied to the entire lidar profile. For wind direction, this correction calculates the shortest angular difference.
*   **Splicing:** The final profile utilizes the mast data where available. For wind speed, lidar data fills the heights above the mast, and a power-law extrapolation (fitted to the lowest 200 m of the raw data) acts as a fallback if lidar data is missing. For wind direction, mast data is strictly used above 30 m, falling back to lidar data at other heights, with the topmost valid measurement forward-filled if high-altitude data is absent. 

This yields the following profiles up to 2000 m:

.. image:: images/202512191525_wspeed_pro.png
  :width: 80%
.. image:: images/202602211430_wspeed_pro.png
  :width: 80%
.. image:: images/202602211610_wspeed_pro.png
  :width: 80%
.. image:: images/202603010230_wspeed_pro.png
  :width: 80%
.. image:: images/202604051812_wspeed_pro.png
  :width: 80%
.. image:: images/202605161814_wspeed_pro.png
  :width: 80%

In the rotor layer, including turbulence as error bars, interpolated from mast sonics and cup anemometers:

.. image:: images/202512191525_wspeed_pro_rotor.png
  :width: 80%
.. image:: images/202602211430_wspeed_pro_rotor.png
  :width: 80%
.. image:: images/202602211610_wspeed_pro_rotor.png
  :width: 80%
.. image:: images/202603010230_wspeed_pro_rotor.png
  :width: 80%
.. image:: images/202604051812_wspeed_pro_rotor.png
  :width: 80%
.. image:: images/202605161814_wspeed_pro_rotor.png
  :width: 80%


Potential Temperature Combination (Mast and MWR)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
A continuous potential temperature profile is generated by combining the high-resolution mast data with the MWR measurements. The MWR data is interpolated to the exact height of the topmost valid mast temperature measurement, and an offset is applied to force agreement at this boundary. The bias-corrected MWR profile is spliced above the mast data, and the combined dataset is interpolated to the 2 m target grid



Combined profiles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For a single case-study simulation, we suggest an averaged profile of all cases. The spread and the averaged profile is shown here:

.. image:: images/profiles_combined.png
  :width: 80%


