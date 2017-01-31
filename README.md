# Modelica_Synchronous

Free library to precisely define and synchronize sampled data systems with different sampling rates. It provides convenient to use blocks to utilize the new synchronous language elements introduced in Modelica 3.3.

## Library description

The `Modelica_Synchronous` library is an open source Modelica package under Modelica License 2 to precisely define and synchronize sampled data systems with different sampling rates. It provides a convenient to use block library to utilize the new synchronous language elements introduced in Modelica 3.3 and was presented at the 9th International Modelica Conference 2012 (“A Library for Synchronous Control Systems in Modelica”).

Features include:
 * Periodic clocks and event based clocks for synchronous execution of clocked partitions (introduced in the Modelica Language Specification 3.3). Therefore, the sample period for a partition needs to be defined only at one location.
 * Definition of multi-rate control systems with elements to sub-sample, super-sample and shift-sample partitions synchronously.
 * Optional simulation of quantization effects, computational delay or noise.
 * Automatic discretization of continuous-time equations for utilization in sampled data systems. This is especially useful to utilize continuous-time nonlinear, inverse models in a discrete-time control system.

It is planned to include this library in a future version of the Modelica Standard Library (after an evaluation period and once several Modelica tools support the synchronous language elements)

![screenshot](Modelica_Synchronous/Resources/Images/screenshot.png)

## Current release

[Modelica_Synchronous v0.92.1 (2016-03-11)](../../releases/tag/v0.92.1)

Please note that the library is known to work with Dymola only.

## Older Releases

Browse the [Releases](../../releases) page in order to get access to older releases of the `Modelica_Synchronous` library.

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

## Development and contribution
The devolopment is organised by [Martin Otter](http://www.robotic.dlr.de/Martin.Otter).

You may report any issues by using the [Issue Tracker](../../issues).
