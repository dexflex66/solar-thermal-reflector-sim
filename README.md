# Solar Thermal Reflector Simulation

MATLAB model of a dual parabolic reflector with a diffraction grating for solar concentration analysis.

Models the optical behaviour of a two-stage reflector system: a primary parabolic collector focuses incoming solar radiation onto a secondary reflector fitted with a diffraction grating, which redistributes spectral bands for improved thermal or photovoltaic efficiency. Built to explore whether cheap optical components could substitute for expensive multi-junction PV cells in a concentrated solar setup.

The modelling shows that chromatic dispersion from the grating works against broadband solar capture, which is why this approach lost out commercially when silicon module costs dropped. The sim makes that failure mode visible and quantifiable.

## Run

Open `main.m` in MATLAB R2021a or later and run. No toolboxes required beyond base MATLAB.