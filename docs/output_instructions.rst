Output Instructions
===================

The output_file_IEA.nc includes 40 variables for the inflow, at the rotor and in the wake. This is the first part of the name of the variable.

**General comments:**

- Each variable is set to false and includes NaNs. 
- If you modified a variable with simulation values, please set it to true. 
- If not all heights are covered by the simulation, leave the rest at NaN. 
- If your output did not include a variable, leave it at false and NaN.
- If the resolution is coarser (finer) than 2m, please interpolate (extrapolate) to 2m.




**Inflow variables:**

- All variables start with **inflow_**.
- The dimensions of the variables include:
    - time = 11  number of output time steps, covering 10 min, 1 min per time step
    - y = 233  number of gp in y direction (2m spacing covering 4D)
    - z_BL = 1001  number of gp in z direction (2m spacing covering 2000m), lowest grid point at 0m
- The second part of the name is the variable itself.
- Following inflow variables are included:

.. list-table::
   :widths: 10 70 10
   :header-rows: 1

   * - name
     - meaning 
     - units
   * - u
     - | streamwise velocity component 
       | (in case precursor is rotated, it is not the zonal wind)
     - :math:`\mathrm{m\,s^{-1}}`
   * - v
     - | spanwise velocity component 
       | (in case precursor is rotated, it is not the meridional wind)
     - :math:`\mathrm{m\,s^{-1}}`
   * - w
     - vertical velocity component
     - :math:`\mathrm{m\,s^{-1}}`
   * - th
     - potential temperature
     - :math:`\mathrm{K}`
   * - TKESGS
     - subgrid-scale turbulent kinetic energy
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uu
     - Reynolds stress u'u'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - vv
     - Reynolds stress v'v'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - ww
     - Reynolds stress w'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uv
     - Reynolds stress u'v'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - vw
     - Reynolds stress v'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uw
     - Reynolds stress u'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - wth
     - w'theta'
     - :math:`\mathrm{K\,m\,s^{-1}}`
   * - momentum
     - | inflow momentum flux at the surface 
       | normalized by density
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - heat flux
     - inflow heat flux at the surface 
     - :math:`\mathrm{K\,m\,s^{-1}}`

The last part of the name defines if the values should be instantaneous or time averaged. For the momentum and heat flux it is 0, meaning here only a time series of one single value is required.

**Rotor variables:**

- All variables start with **rotor_**.
- The second part of the name is the variable itself

- All of the following variables are of the dimensions (nwt, seg, rad, type).

    - nwt refers to the number of wind turbine (0=upwind, 1=downwind)
    - seg defines the segment (4deg for one segment of a circle, segment 0 starts at 12o'clock when looking downwind onto the rotor and proceed clockwise)
    - rad defines the number or radial points on one blade (first at 2m, no value at hub, up to 58m (D/2) for 116m rotor diameter)
    - type defines the output type with 0=10min time averaged, 1=10min min, 2=10min max, 3=standard deviation

- Following rotor variables are included:

.. list-table::
   :widths: 10 70 10
   :header-rows: 1

   * - name
     - meaning 
     - units
   * - alpha
     - angle of attack
     - degree
   * - cl
     - lift coefficient
     - /
   * - cd
     - drag coefficient
     - /
   * - Fn
     - chord-normal force per unit length
     - :math:`\mathrm{N\,m^{-1}}`
   * - Ft
     - chord-tangential force per unit length
     - :math:`\mathrm{N\,m^{-1}}`

In addition we ask for the rotor thrust T (N) and torque Q (N m). Here both fields are of the format (nwt, type).


**Wake variables:**

- All variables start with **wake_**.
- The dimensions of the variables include:
    - time = 11  number of output time steps, covering 10 min, 1 min per time step
    - y = 233  number of gp in y direction (2m spacing covering 4D)
    - z_WT = 151  number of gp in z direction (2m spacing covering 300m), lowest grid point at 0m
    - pos = 28  number of wake planes (8 planes from 0.5-4D of upwind turbine, 20 planes from 0.5-10D of downwind turbine, distance between upwind and downwind turbine is 508m in full wake position)

- Following wake variables are included:


.. list-table::
   :widths: 10 70 10
   :header-rows: 1

   * - name
     - meaning 
     - units
   * - u
     - streamwise velocity component 
     - :math:`\mathrm{m\,s^{-1}}`
   * - v
     - spanwise velocity component 
     - :math:`\mathrm{m\,s^{-1}}`
   * - w
     - vertical velocity component
     - :math:`\mathrm{m\,s^{-1}}`
   * - th
     - potential temperature
     - :math:`\mathrm{K}`
   * - TKESGS
     - subgrid-scale turbulent kinetic energy
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uu
     - Reynolds stress u'u'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - vv
     - Reynolds stress v'v'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - ww
     - Reynolds stress w'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uv
     - Reynolds stress u'v'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - vw
     - Reynolds stress v'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - uw
     - Reynolds stress u'w'
     - :math:`\mathrm{m^2\,s^{-2}}`
   * - wth
     - w'theta'
     - :math:`\mathrm{K\,m\,s^{-1}}`
   
- The last part of the name defines if the values should be instantaneous or time averaged. 




-----------------------------------------------

In the following, all 40 variables are listed:

  inflow_u_inst(time, y, z_BL) float32 [m/s]
      inflow instantaneous u velocity component at -2D
      included=false, all NaN
  inflow_v_inst(time, y, z_BL) float32 [m/s]
      inflow instantaneous v velocity component at -2D
      included=false, all NaN
  inflow_w_inst(time, y, z_BL) float32 [m/s]
      inflow instantaneous w velocity component at -2D
      included=false, all NaN
  inflow_th_inst(time, y, z_BL) float32 [K]
      inflow instantaneous potential temperature component at -2D
      included=false, all NaN
  inflow_u_timeav(y, z_BL) float32 [m/s]
      inflow u time averaged velocity component at -2D
      included=false, all NaN
  inflow_v_timeav(y, z_BL) float32 [m/s]
      inflow v time averaged velocity component at -2D
      included=false, all NaN
  inflow_w_timeav(y, z_BL) float32 [m/s]
      inflow w time averaged velocity component at -2D
      included=false, all NaN
  inflow_th_timeav(y, z_BL) float32 [K]
      inflow potential temperature time averaged component at -2D
      included=false, all NaN
  inflow_TKESGS_timeav(y, z_BL) float32 [m2/s2]
      inflow SGS TKE time averaged component at -2D
      included=false, all NaN
  inflow_uu_timeav(y, z_BL) float32 [m2/s2]
      inflow u'u' time averaged component at -2D
      included=false, all NaN
  inflow_vv_timeav(y, z_BL) float32 [m2/s2]
      inflow v'v' time averaged component at -2D
      included=false, all NaN
  inflow_ww_timeav(y, z_BL) float32 [m2/s2]
      inflow w'w' time averaged component at -2D
      included=false, all NaN
  inflow_uv_timeav(y, z_BL) float32 [m2/s2]
      inflow u'v' time averaged component at -2D
      included=false, all NaN
  inflow_vw_timeav(y, z_BL) float32 [m2/s2]
      inflow v'w' time averaged component at -2D
      included=false, all NaN
  inflow_uw_timeav(y, z_BL) float32 [m2/s2]
      inflow u'w' time averaged component at -2D
      included=false, all NaN
  inflow_wth_timeav(y, z_BL) float32 [K m/s]
      inflow w'theta' time averaged component at -2D
      included=false, all NaN
  inflow_momentum_0(time) float32 [m2/s2]
      inflow momentum flux normalized by density in m^2/s^2
      included=false, all NaN
  inflow_heatflux_0(time) float32 [K m/s]
      inflow heat flux in K m/s
      included=false, all NaN
  rotor_alpha(nwt, seg, rad, type) float32 [deg]
      angle of attack in degrees
      included=false, all NaN
  rotor_cl(nwt, seg, rad, type) float32 [-]
      lift coefficient
      included=false, all NaN
  rotor_cd(nwt, seg, rad, type) float32 [-]
      drag coefficient
      included=false, all NaN
  rotor_Fn(nwt, seg, rad, type) float32 [N/m]
      chord-normal force per unit length in N/m
      included=false, all NaN
  rotor_Ft(nwt, seg, rad, type) float32 [N/m]
      chord-tangential force per unit length in N/m
      included=false, all NaN
  rotor_T(nwt, type) float32 [N]
      Thrust - one value per wind turbine in N
      included=false, all NaN
  rotor_Q(nwt, type) float32 [N m]
      Torque - one value per wind turbine in N m
      included=false, all NaN
  wake_u_inst(time, y, z_WT, pos) float32 [m/s]
      wake instantaneous u velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_v_inst(time, y, z_WT, pos) float32 [m/s]
      wake instantaneous v velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_w_inst(time, y, z_WT, pos) float32 [m/s]
      wake instantaneous w velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_th_inst(time, y, z_WT, pos) float32 [K]
      wake instantaneous potential temperature component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_u_timeav(y, z_WT, pos) float32 [m/s]
      wake u time averaged velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_v_timeav(y, z_WT, pos) float32 [m/s]
      wake v time averaged velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_w_timeav(y, z_WT, pos) float32 [m/s]
      wake w time averaged velocity component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_th_timeav(y, z_WT, pos) float32 [K]
      wake potential temperature time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_uu_timeav(y, z_WT, pos) float32 [m2/s2]
      wake u'u' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_vv_timeav(y, z_WT, pos) float32 [m2/s2]
      wake v'v' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_ww_timeav(y, z_WT, pos) float32 [m2/s2]
      wake w'w' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_uv_timeav(y, z_WT, pos) float32 [m2/s2]
      wake u'v' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_vw_timeav(y, z_WT, pos) float32 [m2/s2]
      wake v'w' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_uw_timeav(y, z_WT, pos) float32 [m2/s2]
      wake u'w' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
  wake_wth_timeav(y, z_WT, pos) float32 [K m/s]
      wake w'theta' time averaged component at wake planes 0.5 to 4D behind upwind turbine and 0.5 to 10D behind downwind turbine in 0.5D steps
      included=false, all NaN
0 of 40 variables flagged included
