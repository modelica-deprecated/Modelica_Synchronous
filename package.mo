within ;
package Modelica_Synchronous "Modelica_Synchronous (version 0.92 Build 2) - Basic synchronous input/output control blocks
that are triggered by clocks"
extends Modelica.Icons.Package;









  annotation (preferredView="info",
  uses(Modelica(version="3.2.2")),
    version="0.92",
    versionBuild=2,
    versionDate="2013-09-19",
    dateModified = "2015-09-09 18:16:00Z",
    revisionId="$Id::                                       $",
  Documentation(info="<html>
<p>
Library <b>Modelica_Synchronous</b> is a Modelica package
to precisely define and synchronize sampled data systems with different sampling rates.
The library has elements to define periodic clocks and event clocks that trigger elements to sample, sub-sample, super-sample, or shift-sample partitions synchronously. Optionally, quantization effects, computational delay or noise can be simulated. Continuous-time equations can be automatically discretized and utilized in a sampled data system. The sample rate of
a partition need to be defined only at one location. All Modelica libraries designed so far for sampled systems, such as Modelica.Blocks.Discrete or Modelica_LinearSystems2.Controller
are becoming obsolete and instead Modelica_Synchronous should be utilized.
</p>

<p>
In the following
<a href=\"modelica://Modelica_Synchronous.Examples.SimpleControlledDrive.ClockedWithDiscreteController\">example</a>
a simple sampled data system is shown, where the borders of the
discrete-time partition are marked by the sample and hold operators, a clocked PI
controller is used in the partition and the sample
rate is defined at one location with a clock:
</p>

<p>
<img src=\"modelica://Modelica_Synchronous/Resources/Images/SimpleSampledSystem.png\">
</p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica_Synchronous/Resources/Documentation/Modelica_Synchronous.pdf\">Modelica_Synchronous.pdf</a>
     is a slide set that provides an overview of the Library
     (the pdf file was generated from the
      <a href=\"modelica://Modelica_Synchronous/Resources/Documentation/Modelica_Synchronous.pptx\">PowerPoint presentation</a>).
      </li>
<li> <a href=\"modelica://Modelica_Synchronous.UsersGuide.GettingStarted\">Getting started</a>
     provides an overview of the Library
     inside the <a href=\"modelica://Modelica_Synchronous.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the changes of new versions of this package.</li>
<li> <a href=\"modelica://Modelica_Synchronous.UsersGuide.Contact\">Contact</a>
     gives author and acknowledgement information for this library.</li>
</ul>

<p>
<table border=\"0\" cellpadding=\"2\" cellspacing=\"2\">
<tr><td colspan=\"1\" rowspan=\"2\" style=\"vertical-align: middle;\">
    <img src=\"modelica://Modelica_Synchronous/Resources/Images/dlr_logo.png\">
    </td>
    <td style=\"vertical-align: top;\"><br><b>Licensed by DLR under the Modelica License 2</b></td>
</tr>
<tr><td style=\"vertical-align: top;\"><b>Copyright &copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
</tr>
</table>
</p>

<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty)
<a href=\"modelica://Modelica_Synchronous.UsersGuide.ModelicaLicense2\">here</a></u>
or at
<a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">
http://www.Modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>", revisions=""));
end Modelica_Synchronous;
