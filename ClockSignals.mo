within Modelica_Synchronous;
package ClockSignals "Library of blocks for clocked signals"
  extends Modelica.Icons.Package;

  package Clocks "Library of blocks that generate clocks"
    extends Modelica.Icons.SourcesPackage;

    block PeriodicRealClock
      "Generates a periodic clock signal with a period defined by a Real number"
      parameter Modelica.SIunits.Time period
        "Period of clock (defined as Real number)" annotation(Evaluate=true);
      extends Modelica_Synchronous.ClockSignals.Interfaces.PartialPeriodicClock;
    equation
      if useSolver then
         y = Clock(Clock(period), solverMethod=solverMethod);
      else
         y = Clock(period);
      end if;

      annotation (
         defaultComponentName="periodicClock1",
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{100,100}}, initialScale=0.06),
                        graphics={
            Text(
              extent={{-200,-110},{200,-175}},
              lineColor={0,0,0},
              textString="%period s"),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=45,
              origin={-50,-120},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=90,
              origin={52,60},
              pattern=LinePattern.None,
              lineColor={0,0,0},
              fillColor={95,95,95}),
            Text(
              visible=useSolver,
              extent={{-300,-180},{300,-245}},
              lineColor={0,0,0},
              textString="%solverMethod")}),
        Diagram,
        Documentation(info="<html>
<p>
This component generates a periodic clock that starts ticking when
the simulation starts. The <b>period</b> is defined in seconds
by a <b>Real</b> number. If clocks are synchronized relatively to each other
then only one of the clocks can be defined with PeriodicRealClock.
</p>

<p>
For an introduction to clocks see
<a href=\"modelica://Modelica_Synchronous.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
If exact, integer based, time synchronization with absolute period definitions is
desired, use block
<a href=\"modelica://Modelica_Synchronous.Clocks.PeriodicExactClock\">PeriodicExactClock</a>
to generate a periodic clock signal.
</p>


<p>
If a clock is associated to a clocked continuous-time partition, then an <b>integrator</b>
has to be defined that is used to integrate the partition from the previous
to the current clock tick. This is performed by setting parameter <b>useSolver</b>
= <b>true</b> and defining the integration method as String with
parameter <b>solver</b>. Both parameters are in tab <b>Advanced</b>.
For an example, see
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
</p>
</html>"));
    end PeriodicRealClock;

    block PeriodicExactClock
      "Generates a periodic clock signal with a period defined by an Integer number with resolution"
      import R = Modelica_Synchronous.Types.Resolution;

      parameter Integer factor(min=0)
        "Sample factor with respect to resolution"                               annotation(Evaluate=true);
      parameter Modelica_Synchronous.Types.Resolution resolution=R.ms
        "Clock resolution" annotation(Evaluate=true, __Dymola_editText=false);
      extends Modelica_Synchronous.ClockSignals.Interfaces.PartialPeriodicClock;
    protected
      constant Integer conversionTable[8]={365*24*60*60, 24*60*60, 60*60, 60, 1, 1000, 1000*1000, 1000*1000*1000}
        "Table to convert from Resolution to Integer clock resolution";
      parameter Integer resolutionFactor = conversionTable[integer(resolution)] annotation(Evaluate=true);
      Clock c annotation(HideResult=true);
    equation
      if resolution < R.s then
         c = subSample(Clock(factor), resolutionFactor);
      else
         c = superSample(Clock(factor), resolutionFactor);
      end if;

      if useSolver then
         y = Clock(c, solverMethod=solverMethod);
      else
         y = c;
      end if;

      annotation (
           defaultComponentName="periodicClock1",
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{100,100}}, initialScale=0.06),
                        graphics={
            Text(
              extent={{-200,-110},{200,-175}},
              lineColor={0,0,0},
              textString="%factor %resolution"),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=90,
              origin={52,60},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=45,
              origin={-50,-120},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Text(
              visible=useSolver,
              extent={{-300,-180},{300,-245}},
              lineColor={0,0,0},
              textString="%solverMethod")}),
        Diagram,
        Documentation(info="<html>
<p>
This component generates a periodic clock that starts ticking when
the simulation starts. The <b>period</b> is defined as the product
of a resolution, defined with enumeration
<a href=\"modelica://Modelica_Synchronous.Types.Resolution\">Resolution</a>,
and Integer parameter <b>factor</b>. Internally, the period is
represented as a rational number. All clocks with rational number definitions
are exactly time synchronized to each other.
</p>

<p>
Example:
</p>

<pre>
  import M = Modelica_Synchronous;
  M.Clocks.PeriodicExactClock periodicClock(factor=10,
                                            resolution=M.Types.Resolution.ms);
  // Clock ticks every 1/100 seconds
</pre>

<p>
For an introduction to clocks see
<a href=\"modelica://Modelica_Synchronous.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
</p>

<p>
If a clock is associated to a clocked continuous-time partition, then an <b>integrator</b>
has to be defined that is used to integrate the partition from the previous
to the current clock tick. This is performed by setting parameter <b>useSolver</b>
= <b>true</b> and defining the integration method as String with
parameter <b>solver</b>. Both parameters are in tab <b>Advanced</b>.
For an example, see
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
</p>
</html>"));
    end PeriodicExactClock;

    block EventClock
      "Generates a clock signal when the Boolean input changes from false to true"
      extends Modelica_Synchronous.ClockSignals.Interfaces.PartialClock;
      Modelica.Blocks.Interfaces.BooleanInput u
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    equation
      if useSolver then
         y = Clock(Clock(u), solverMethod=solverMethod);
      else
         y = Clock(u);
      end if;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{100,100}}, initialScale=0.06),
                        graphics={
            Text(
              visible=useSolver,
              extent={{-300,-110},{300,-175}},
              lineColor={0,0,0},
              textString="%solverMethod")}),
        Diagram,
        Documentation(info="<html>
<p>
This component generates a clock signal triggered by a continuous-time
Boolean input signal u: Whenever the Boolean input signal <b>u</b>
changes from <b>false</b> to <b>true</b>, then the output
clock signal <b>y</b> ticks.
</p>

<p>
For an introduction to clocks see
<a href=\"modelica://Modelica_Synchronous.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
</p>

<p>
If a clock is associated to a clocked continuous-time partition, then an <b>integrator</b>
has to be defined that is used to integrate the partition from the previous
to the current clock tick. This is performed by setting parameter <b>useSolver</b>
= <b>true</b> and defining the integration method as String with
parameter <b>solver</b>. Both parameters are in tab <b>Advanced</b>.
For an example, see
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
</p>
</html>"));
    end EventClock;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that generate clock signals. For an introduction
to clocks see
<a href=\"modelica://Modelica_Synchronous.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
</p>
</html>"));
  end Clocks;

  package Sampler
    "Library of blocks that sub-, super-, shift-sample clock signals"
    extends Modelica.Icons.Package;

    block SubSample "Sub-sample the input clock and provide it as output clock"
      parameter Integer factor(min=1) "Sub-sampling factor (>= 1)" annotation(Evaluate=true);

      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput u
        "Connector of a clock as input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput y
        "Connector of a clock as output signal (clock y is slower as clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = subSample(u,factor);

      annotation (
       defaultComponentName="subSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-80,80},{80,-80}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Text(
              extent={{-200,145},{200,80}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%factor"),
            Line(
              points={{-100,0},{-80,0},{-80,-60},{60,-60},{60,0},{100,0}},
              pattern=LinePattern.Dot,
              smooth=Smooth.None,
              color={95,95,95}),                       Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={95,95,95},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-95,-45},{-65,-75}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,15},{75,-15}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-46,26},{-26,6}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{4,71},{24,51}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{57,3},{63,-3}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-36,-60},{-36,16},{14,16},{14,60},{60,60},{60,0}},
              color={175,175,175},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Polygon(
              points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                  {25,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              origin={-75,55},
              rotation=-90)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block sub-samples the input clock u and provides it as
output clock y.
</p>

<p>
To be more precise:
The clock y is factor-times slower than the clock u. The first activation of clock y coincides with the first activation of clock u. The sub-sampling factor is defined by Integer parameter <b>factor</b>.
</p>

<h4>Example</h4>

<p>
The following
<a href=\"Modelica_Synchronous.Examples.Elementary.ClockSignals.SubSample\">example</a>
generates a periodic clock of 20 ms period, and
then sub-samples the resulting clock signal with a factor of 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/SubSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/SubSample_Result.png\"></td>
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
As can be seen, subSample.y picks every third-value of periodicClock.y due to the
sub-sampling, and the sub-sampling factor = 3 is displayed in the icon of the
subSample block. Note the down-arrow in the icon of the subSample block indicates that
clock subSample.y is slower as clock subSample.u.
</p>
</html>"));
    end SubSample;

    block SuperSample
      "Super-sample the input clock and provide it as output clock"
      parameter Integer factor(min=1) "Super-sampling factor (>= 1)" annotation(Evaluate=true);

      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput u
        "Connector of a clock as input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput y
        "Connector of a clock as output signal (clock y is faster as clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = superSample(u,factor);

      annotation (
       defaultComponentName="superSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-90,88},{88,-72}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Text(
              extent={{-200,175},{200,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%factor"),
                                   Line(points={{-80,-60},{-40,-60},{-40,-60},{0,-60},
                  {0,-60},{0,-60},{0,80},{40,80},{40,80},{80,80},{80,0},{80,0},{80,0},
                  {100,0}},          color={95,95,95},
              pattern=LinePattern.Dot,
              thickness=0.5),                          Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={95,95,95},
              smooth=Smooth.None,
              pattern=LinePattern.Dot,
              thickness=0.5),
            Ellipse(
              extent={{-95,-45},{-65,-75}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={175,175,175},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-15,96},{15,66}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,83},{3,77}},
              lineColor={175,175,175},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{65,16},{95,-14}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{77,3},{83,-3}},
              lineColor={175,175,175},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-48,-46},{-18,-76}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{34,96},{64,66}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                  {25,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              origin={-43,18},
              rotation=90)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block super-samples the clock input signal u and provides it as
clock output signal y.
</p>

<p>
To be more precise:
Clock y is factor-times faster than clock u. The first activation of clock y coincides with the first activation of clock u. The super-sampling factor is defined by Integer parameter <b>factor</b>.
</p>

<h4>Example</h4>

<p>
The following
<a href=\"Modelica_Synchronous.Examples.Elementary.ClockSignals.SuperSample\">example</a>
generates a periodic clock of 20 ms period, and
then super-samples the resulting clock with a factor of 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/SuperSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/SuperSample_Result.png\"></td>
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
As can be seen, superSample introduces factor-1 additional clock ticks for the
output clock y. The super-sampling factor = 3 is displayed in the icon of the
superSample block. Note the up-arrow in the icon of the superSample block indicates that
clock superSample.y is faster as clock superSample.u.
</p>
</html>"));
    end SuperSample;

    block ShiftSample
      "Shift the input clock by a fraction of the last interval and provide it as output clock"
      parameter Integer shiftCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));

      Interfaces.ClockInput                u "Connector of clock input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Interfaces.ClockOutput                y
        "Connector of clock output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = shiftSample(u,shiftCounter,resolution);

      annotation (
       defaultComponentName="shiftSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-94,86},{84,-92}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
                                   Line(points={{20,-50},{60,-50},{60,50}},
                                     color={95,95,95},
              pattern=LinePattern.Dot),
            Text(
              extent={{-200,175},{200,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%shiftCounter/%resolution"),
                                   Line(points={{-80,-50},{-40,-50},{-40,50}},
                                     color={95,95,95},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{34,0},{14,20},{14,10},{-16,10},{-16,-10},{14,-10},{14,-20},{34,
                  0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95}),
            Ellipse(
              extent={{-90,-40},{-70,-60}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block shifts the first activation of clock output y by
fraction shiftCounter/resolution of the period (or for a non-periodic signal by a fraction of the last interval).
Here, <b>shiftCounter</b> and <b>resolution</b> are positive Integer parameters.
</p>

<p>
To be more precise:
The block constructs (conceptually) a clock &ldquo;cBase&rdquo;
</p>

<pre>
   <b>Clock</b> cBase = <b>subSample</b>(<b>superSample</b>(u, resolution), shiftCounter)
</pre>

<p>
and clock y starts at the second clock tick of cBase.
</p>


<h4>Example</h4>

<p>
The following
<a href=\"Modelica_Synchronous.Examples.Elementary.ClockSignals.ShiftSample\">example</a>
generates a periodic clock of 20 ms period, and
then shifts it with shiftCounter = 4 and resolution = 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/ShiftSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/ClockSignals/ShiftSample_Result.png\"></td>
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
The first activation of clock output y of block shiftSample1 is shifted in time (4/3*20ms). The parameter values <b>shiftCounter</b> = 4 and <b>resolution</b> = 3 are visible at the bottom of the icon.
</p>

</html>"));
    end ShiftSample;
    annotation (Documentation(info="<html>
<p>
This package contains blocks that sub-sample, super-sample, and shift-sample
a clock signal.
</p>
</html>"));
  end Sampler;

  package Interfaces
    "Library of connectors and partial blocks with clock signals"
    extends Modelica.Icons.InterfacesPackage;

  connector ClockInput = input Clock "'input Clock' as connector"
    annotation (defaultComponentName="u",
         Icon(graphics={Polygon(
            points={{-34,6},{20,0},{-34,-8},{-34,6}},
            lineColor={175,175,175},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.Dot,
            lineThickness=0.5),
                        Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid)},
              coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=true, initialScale=0.2)),    Diagram(coordinateSystem(
          preserveAspectRatio=true, initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,255},
            textString="%name",
          fillPattern=FillPattern.Solid,
          fillColor={128,0,255})}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
</p>
</html>"));
  connector ClockOutput = output Clock "'output Clock' as connector"
                                    annotation (defaultComponentName="y",
    Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{-10,6},{10,0},{-10,-6},{-10,6}},
            lineColor={175,175,175},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineThickness=0.5,
            pattern=LinePattern.Dot),
                                 Polygon(
            points={{-100,99},{100,-1},{-100,-101},{-100,99}},
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{-100,50},{0,0},{-100,-50},{-100,50}},
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{30,110},{30,60}},
            lineColor={0,0,255},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one output signal of type Boolean.
</p>
</html>"));
    partial block PartialClock
      "Icon, connector, and solver method of a block that generates a clock"

      parameter Boolean useSolver = false
        "= true, if solverMethod shall be explicitely defined"
        annotation(Evaluate=true, Dialog(tab="Advanced"), choices(__Dymola_checkBox=true));
      parameter Modelica_Synchronous.Types.SolverMethod solverMethod="ExplicitEuler"
        "Integration method used for discretized continuous-time partitions" annotation(Dialog(tab="Advanced",enable=useSolver));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput y
                               annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                100,100}}),
                        graphics={
            Ellipse(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95}),
            Ellipse(
              extent={{9,-10},{-11,10}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-1,0},{52,50}},  color={95,95,95}),
            Text(
            extent={{-300,175},{300,110}},
            textString="%name",
            lineColor={0,0,255},
            fontSize=0),
            Rectangle(
              extent={{80,6},{100,-6}},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{-100,6},{-80,-6}},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=90,
              origin={52,-120},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=45,
              origin={80,6},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=135,
              origin={-6,80},
              lineColor={95,95,95},
              fillColor={95,95,95}),
            Rectangle(
              extent={{20,58},{40,46}},
              fillPattern=FillPattern.Solid,
              rotation=135,
              origin={122,-48},
              lineColor={95,95,95},
              fillColor={95,95,95})}),
        Diagram,
        Documentation(info="<HTML>

</HTML>
"));
    end PartialClock;

    partial block PartialPeriodicClock
      "Icon, connector, and solver method of a block that generates a periodic clock"
      extends Modelica_Synchronous.ClockSignals.Interfaces.PartialClock;

    end PartialPeriodicClock;

    partial block ClockedBlockIcon
      "Basic graphical layout of block where at least one input or output is a clocked variable"

      annotation (
        Icon(graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255},
              fontSize=0)}));
    end ClockedBlockIcon;
    annotation (Documentation(info="<html>
<p>
This package contains clock connectors, as well as partial blocks that are used to
construct clock blocks.
</p>
</html>"));
  end Interfaces;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that transform a clock signal, by
sub-, super-, and shift-sampling a clock. For an introduction
to clocks see
<a href=\"modelica://Modelica_Synchronous.UsersGuide.Clocks\">UsersGuide.Clocks</a>.
</p>
</html>"));
end ClockSignals;
