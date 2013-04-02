within Modelica_Synchronous;
package BooleanSignals "Library of clocked blocks for Boolean signals"
  extends Modelica.Icons.Package;
  package Sampler "Library of sampler and hold blocks for Boolean signals"
    extends Modelica.Icons.Package;

    block Sample
      "Sample the continuous-time, Boolean input signal and provide it as clocked output signal (clock is infered)"
      extends Modelica_Synchronous.BooleanSignals.Interfaces.PartialSISOSampler;

    equation
      y = sample(u);

      annotation (
       defaultComponentName="sample1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Text(
              extent={{-200,50},{200,115}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Sample\">RealSignals.Sampler.Sample</a>).
</p>
<p>
Analog to the corresponding Real signal block examples there exist two elementary examples, <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.Sample1\">Sample1</a> and
<a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.Sample2\">Sample2</a>, for this Boolean block.
</p>
</html>"));
    end Sample;

    block SampleClocked
      "Sample the continuous-time, Boolean input signal and provide it as clocked output signal. The clock is provided as input signal"
      extends Modelica_Synchronous.BooleanSignals.Interfaces.SamplerIcon;
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 clock
        "Output signal y is associated with this clock input"                           annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of continuous-time, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = sample(u,clock);

      annotation (
       defaultComponentName="sample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Line(
              points={{0,-100},{0,18}},
              color={175,175,175},
              smooth=Smooth.None,
              pattern=LinePattern.Dot,
              thickness=0.5),
            Text(
              extent={{-200,50},{200,115}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">RealSignals.Sampler.SampleClocked</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.SampleClocked\">example</a> for this Boolean block.
</p>
</html>"));
    end SampleClocked;

    block SampleVectorizedAndClocked
      "Sample the continuous-time, Boolean input signal vector and provide it as clocked output signal vector. The clock is provided as input signal"
      extends Modelica_Synchronous.BooleanSignals.Interfaces.SamplerIcon;
      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.BooleanInput
                                           u[n]
        "Connector of continuous-time, Boolean input signal vector"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0), iconTransformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y[n]
        "Connector of clocked, Boolean output signal vector"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 clock
        "Output signal vector y is associated with this clock input"                           annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
    equation
      y = sample(u,clock);

      annotation (
       defaultComponentName="sample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Line(
              points={{0,-100},{0,18}},
              color={175,175,175},
              smooth=Smooth.None,
              pattern=LinePattern.Dot,
              thickness=0.5),
            Text(
              extent={{-200,50},{200,115}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-160,-30},{20,-80}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="n=%n")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked\">RealSignals.Sampler.SampleVectorizedAndClocked</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.SampleVectorizedAndClocked\">example</a> for this Boolean block.
</p>
</html>"));
    end SampleVectorizedAndClocked;

    block Hold
      "Hold the clocked, Boolean input signal and provide it as continuous-time output signal (zero order hold)"
      parameter Boolean y_start = false
        "Value of output y before the first tick of the clock associated to input u";

      Modelica.Blocks.Interfaces.BooleanInput
                                           u(final start=y_start)
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of continuous-time, Boolean output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
        y = hold(u);

      annotation (
        defaultComponentName="hold1",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-80,80},{80,-80}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
                                   Line(points={{-80,-60},{-40,-60},{-40,0},{0,0},{0,
                  0},{0,0},{0,80},{40,80},{40,40},{80,40},{80,0},{80,0},{80,0},{100,
                  0}},               color={255,0,255}),
                                                       Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={255,0,255},
              smooth=Smooth.None),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-200,-80},{200,-145}},
              lineColor={0,0,0},
              textString="%y_start"),
            Text(
              extent={{-200,165},{200,100}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Hold\">RealSignals.Sampler.Hold</a>).
</p>

<p>
Analog to the corresponding Real signal block example there exists an elementary
<a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.Hold\">example</a> for this Boolean block.
</p>


</html>
"),     Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end Hold;

    block SubSample
      "Sub-sample the clocked Boolean input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if sub-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Sub-sampling factor >= 1 (ignored if inferFactor=true)"
                                                                annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal (clock of y is slower as clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      if inferFactor then
         y = subSample(u);
      else
         y = subSample(u,factor);
      end if;

      annotation (
       defaultComponentName="subSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
            graphics={
            Rectangle(
              extent={{-94,82},{86,-96}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Line(
              points={{-100,0},{-80,0},{-80,-60},{60,-60},{60,0},{100,0}},
              pattern=LinePattern.Dot,
              smooth=Smooth.None,
              color={255,0,255}),
            Text(
              extent={{-200,165},{200,100}},
              lineColor={0,0,255},
              textString="%name"),
            Text(visible=not inferFactor,
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%factor"),
            Ellipse(
              extent={{-95,-45},{-65,-75}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,15},{75,-15}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-46,-20},{-26,-40}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{4,71},{24,51}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{57,3},{63,-3}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-36,-60},{-36,-30},{14,-30},{14,60},{60,60},{60,0}},
              color={215,215,215},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Polygon(
              points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                  {25,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              origin={-51,26},
              rotation=-90)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SubSample\">RealSignals.Sampler.SubSample</a>).
/p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.SubSample\">example</a> for this Boolean block.
</p>
</html>"));
    end SubSample;

    block SuperSample
      "Super-sample the clocked Boolean input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if super-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Super-sampling factor >= 1 (ignored if inferFactor=true)"
                                                    annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal (clock of y is faster as clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      if inferFactor then
         y = superSample(u);
      else
         y = superSample(u,factor);
      end if;

      annotation (
       defaultComponentName="superSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-88,86},{90,-72}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
                                   Line(points={{-80,-60},{-40,-60},{-40,-60},
                  {0,-60},{0,-60},{0,-60},{0,80},{40,80},{40,80},{80,80},{80,
                  0},{80,0},{80,0},{100,0}},
                                     color={255,0,255},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={255,0,255},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-200,175},{200,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(visible=not inferFactor,
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%factor"),
            Ellipse(
              extent={{-95,-45},{-65,-75}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-15,96},{15,66}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,83},{3,77}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{65,16},{95,-14}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{77,3},{83,-3}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-48,-46},{-18,-76}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{34,96},{64,66}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                  {25,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              origin={-49,26},
              rotation=90)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SuperSample\">RealSignals.Sampler.SuperSample</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.SuperSample\">example</a> for this Boolean block.
</p>
</html>"));
    end SuperSample;

    block ShiftSample
      "Shift the clocked Boolean input signal by a fraction of the last interval and and provide it as clocked output signal"

      parameter Integer shiftCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1
        "Denominator of shifting formula (ignored if inferShift=true)"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));

      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal (clock of y is faster als clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = shiftSample(u,shiftCounter,resolution);

      annotation (
       defaultComponentName="shiftSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
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
                                     color={255,0,255},
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
                                     color={255,0,255},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={255,0,255},
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
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.ShiftSample\">RealSignals.Sampler.ShiftSample</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.ShiftSample\">example</a> for this Boolean block.
</p>
</html>"));
    end ShiftSample;

    block BackSample
      "Shift clock of Boolean input signal backwards in time (and access the most recent value of the input at this new clock)"
      parameter Integer backCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Boolean y_start=false
        "Value of output y before the first clock tick of the input u";

      Modelica.Blocks.Interfaces.BooleanInput
                                           u(start=y_start)
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal (clock of y is faster als clock of u)"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = backSample(u,backCounter,resolution);

      annotation (
       defaultComponentName="backSample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-90,84},{88,-94}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
                                   Line(points={{20,-50},{60,-50},{60,50}},
                                     color={255,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-200,175},{200,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-200,-135},{200,-200}},
              lineColor={0,0,0},
              textString="%backCounter/%resolution"),
                                   Line(points={{-80,-50},{-40,-50},{-40,50}},
                                     color={255,0,255},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-40},{-70,-60}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-16,0},{4,20},{4,10},{34,10},{34,-10},{4,-10},{4,-20},{-16,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95}),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-200,-74},{200,-139}},
              lineColor={0,0,0},
              textString="y_start=%y_start")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.BackSample\">RealSignals.Sampler.BackSample</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.BackSample\">example</a> for this Boolean block.
</p>
</html>"));
    end BackSample;

    block AssignClock "Assigns a clock to a clocked Boolean signal"

      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Boolean output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 clock annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
    equation
      when clock then
        y = u;
      end when;

      annotation (
       defaultComponentName="assignClock1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Text(
              extent={{-200,100},{200,160}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-90,90},{88,-88}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
                                   Line(points={{-80,-60},{-40,-60},{-40,0},{
                  0,0},{0,0},{0,0},{0,80},{40,80},{40,40},{80,40},{80,0},{80,
                  0},{80,0},{100,0}},color={255,0,255},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={255,0,255},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(visible=useClock,
              points={{0,-100},{0,70}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              smooth=Smooth.None,
              thickness=0.5)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClock\">RealSignals.Sampler.AssignClock</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.AssignClock\">example</a> for this Boolean block.
</p>
</html>"));
    end AssignClock;

    block AssignClockVectorized
      "Assigns a clock to a clocked Boolean signal vector"

      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.BooleanInput
                                           u[n]
        "Connector of clocked, Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y[n]
        "Connector of clocked, Boolean output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 clock annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
    equation
      when clock then
        y = u;
      end when;

      annotation (
       defaultComponentName="assignClock1",
       Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Text(
              extent={{-196,128},{204,188}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{0,-32},{180,-82}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="n=%n"),  Line(points={{-80,-60},{-40,-60},{-40,0},{
                  0,0},{0,0},{0,0},{0,80},{40,80},{40,40},{80,40},{80,0},{80,
                  0},{80,0},{100,0}},color={255,0,255},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={255,0,255},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(visible=useClock,
              points={{0,-100},{0,70}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              smooth=Smooth.None,
              thickness=0.5)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized\">RealSignals.Sampler.AssignClockVectorized</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.AssignClockVectorized\">example</a> for this Boolean block.
</p>
</html>"));
    end AssignClockVectorized;

    package Utilities "Utility components that are usually not directly used"
       extends Modelica.Icons.Package;

      block UpSample
        "Upsample the clocked Boolean input signal and provide it as clocked output signal"

        parameter Boolean inferFactor=true
          "= true, if upsampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
        parameter Integer factor(min=1)=1
          "Upsampling factor >= 1 (if inferFactor=false)" annotation(Evaluate=true, Dialog(enable=not inferFactor));
        Modelica.Blocks.Interfaces.BooleanInput
                                             u
          "Connector of clocked, Boolean input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanOutput
                                              y
          "Connector of clocked, Boolean output signal (clock of y is faster as clock of u)"
          annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      protected
        Boolean dummy annotation(HideResult=true);
        Boolean b(start=false);
        Boolean b_super(start=false);
        Boolean u_super;
      equation
        when Clock() then // clock of u
           dummy = u;
           b = not previous(b);
        end when;

        when Clock() then // clock of y
           b_super = superSample(b);
           if inferFactor then
              u_super = superSample(u);
           else
              u_super = superSample(u,factor);
           end if;
           y = if b_super <> previous(b_super) then u_super else false;
        end when;

        annotation (
         defaultComponentName="upSample1",
         Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.06),
                           graphics={
              Rectangle(
                extent={{-92,90},{88,-90}},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None),
              Line(
                points={{-78,-60},{40,-60},{40,0},{40,0}},
                color={215,215,215},
                pattern=LinePattern.Dot,
                smooth=Smooth.None), Line(points={{-80,-60},{-40,-60},{-40,-60},{-40,0},
                    {-40,0},{0,0},{40,0},{40,80},{40,80},{40,80},{80,80},{80,0},{80,0},
                    {100,0}},          color={255,0,255},
                pattern=LinePattern.Dot),                Line(
                points={{-80,-60},{-80,0},{-100,0}},
                color={255,0,255},
                smooth=Smooth.None,
                pattern=LinePattern.Dot),
              Text(
                extent={{-200,175},{200,110}},
                lineColor={0,0,255},
                textString="%name"),
              Ellipse(
                extent={{-95,-45},{-65,-75}},
                lineColor={255,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-83,-57},{-77,-63}},
                lineColor={255,0,255},
                fillColor={255,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{25,96},{55,66}},
                lineColor={255,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{37,83},{43,77}},
                lineColor={255,0,255},
                fillColor={255,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-55,16},{-25,-14}},
                lineColor={255,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-6,16},{24,-14}},
                lineColor={255,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{64,16},{94,-14}},
                lineColor={255,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(visible=not inferFactor,
                extent={{-200,-80},{200,-145}},
                lineColor={0,0,0},
                textString="%factor"),
              Line(
                points={{80,80},{120,80}},
                color={215,215,215},
                smooth=Smooth.None,
                pattern=LinePattern.Dot),
              Polygon(
                points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                    {25,0}},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid,
                lineColor={95,95,95},
                origin={-71,52},
                rotation=90)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.06),
                           graphics),
          Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample\">RealSignals.Sampler.Utilities.UpSample</a>).
</p>
<p>
Analog to the corresponding Real signal block example there exists an elementary <a href=\"modelica://Modelica_Synchronous.Examples.Elementary.BooleanSignals.UpSample\">example</a> for this Boolean block.
</p>
</html>"));
      end UpSample;

        block AssignClockToTriggerHold
        "Generate a Boolean continuous-time trigger signal from a clocked Boolean input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "Initial value of output signal";
          Modelica.Blocks.Interfaces.BooleanInput
                                               u
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Boolean output signal"     annotation (Placement(
                transformation(extent={{100,-10},{120,10}}, rotation=0),
                iconTransformation(extent={{100,-10},{120,10}})));
      protected
          Boolean y2(start=y_start);
          Boolean y3(start=y_start, fixed=true);
          Boolean uu annotation(HideResult=true);
        equation
          when Clock() then
             uu = u "Dummy assignment to relate clock of u with y2";
             y2 = not previous(y2);
          end when;
          y3 = hold(y2);
          y = change(y3);
          annotation (
            defaultComponentName="clockToTrigger",
            Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
                Polygon(
                  points={{-80,88},{-88,66},{-72,66},{-80,88}},
                  lineColor={255,0,255},
                  fillColor={255,0,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{-80,66},{-80,-82}}, color={255,0,255}),
                Line(points={{-90,-70},{72,-70}}, color={255,0,255}),
                Polygon(
                  points={{90,-70},{68,-62},{68,-78},{90,-70}},
                  lineColor={255,0,255},
                  fillColor={255,0,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{71,7},{85,-7}},
                  lineColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                            {235,235,235}),
                  fillColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                            {235,235,235}),
                  fillPattern=FillPattern.Solid),
              Line(points={{-60,-70},{-60,70}}, color={0,0,0}),
              Line(points={{-20,-70},{-20,70}}, color={0,0,0}),
              Line(points={{20,-70},{20,70}}, color={0,0,0}),
              Line(points={{60,-70},{60,70}}, color={0,0,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToTriggerHold\">RealSignals.Sampler.Utilities.AssignClockToTriggerHold</a>).
</p>
</html>"));
        end AssignClockToTriggerHold;

        block AssignClockToSquareWaveHold
        "Generate a Boolean continuous-time square signal from a clocked Real input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "Initial value of output signal";
          Modelica.Blocks.Interfaces.BooleanInput
                                               u
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Boolean output signal"     annotation (Placement(
                transformation(extent={{100,-10},{120,10}}, rotation=0),
                iconTransformation(extent={{100,-10},{120,10}})));
      protected
          Boolean y2(start=y_start);
        equation
          // dummy condition to relate clock of u with y2
          y2 = if u == false then not previous(y2) else not previous(y2);
          y = hold(y2);
          annotation (
            defaultComponentName="clockToSquareWave",
            Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
                Polygon(
                  points={{-80,88},{-88,66},{-72,66},{-80,88}},
                  lineColor={255,0,255},
                  fillColor={255,0,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{-80,66},{-80,-82}}, color={255,0,255}),
                Line(points={{-90,-70},{72,-70}}, color={255,0,255}),
                Polygon(
                  points={{90,-70},{68,-62},{68,-78},{90,-70}},
                  lineColor={255,0,255},
                  fillColor={255,0,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{71,7},{85,-7}},
                  lineColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                            {235,235,235}),
                  fillColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0} else
                            {235,235,235}),
                  fillPattern=FillPattern.Solid),
                                       Line(points={{-80,-70},{-40,-70},{-40,44},
                    {0,44},{0,-70},{40,-70},{40,44},{79,44}},
                                                           color={0,0,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
This block for Boolean signals works similarly as the corresponding block for Real signals (see
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold\">RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold</a>).
</p>
</html>"));
        end AssignClockToSquareWaveHold;

      annotation (Documentation(info="<html>
<p>
This package contains utility blocks that are usually not directly utilized
but are used as building blocks for \"higher level\" blocks.
</p>
</html>"));
    end Utilities;

    annotation (Documentation(info="<html>
<p>
This package contains blocks that mark boundaries of a clocked partition
and transform a <b>Boolean</b> signal from one partition to the next. Especially,
the following blocks are provided:<br>&nbsp;
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"3\">
<tr><th align=\"left\"><b>Boundary Type</b></th>
    <th align=\"left\"><b>Block Name</b></th>
    <th align=\"left\"><b>Description</b></th></tr>

<tr><td valign=\"top\" rowspan=\"3\">continuous-time &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.Sample\">Sample</a></td>
      <td>Sample a continuous-time signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.SampleClocked\">SampleClocked</a></td>
      <td>Sample and associate a clock to the sampled <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.SampleVectorizedAndClocked\">SampleVectorizedAndClocked</a></td>
      <td>Sample an input vector and associate a clock to the sampled <b>vector</b> signal.</td>
    </tr>

<tr><td valign=\"top\">clocked &rarr; continuous-time</td>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.Hold\">Hold</a></td>
      <td>Hold a clocked signal with zero-order hold.</td>
    </tr>

<tr><td valign=\"top\" rowspan=\"4\">clocked &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.SubSample\">SubSample</a></td>
      <td>Sub-sample a signal (output clock is slower as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.SuperSample\">SuperSample</a></td>
      <td>Super-sample a signal (output clock is faster as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.ShiftSample\">ShiftSample</a></td>
      <td>Shift a signal (output clock is delayed with respect to input clock).  </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.BackSample\">BackSample</a></td>
      <td>Shift a signal and start the output clock before the input clock with a start value.  </td>
    </tr>


<tr><td valign=\"top\" rowspan=\"2\">within clocked partition</td>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.AssignClock\">AssignClock</a></td>
      <td>Assign a clock to a clocked <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.AssignClockVectorized\">AssignClockVectorized</a></td>
      <td>Assign a clock to a clocked <b>vector</b> signal.</td>
    </tr>
</table>

<p>
Additionally, package
<a href=\"modelica://Modelica_Synchronous.BooleanSignals.Sampler.Utilities\">Utilities</a></td>
contains utility blocks that are used as building blocks for user-relevant blocks.
</p>
</html>"));
  end Sampler;

  package NonPeriodic
    "Library of blocks that operate on periodically and non-periodically clocked signals"
  extends Modelica.Icons.Package;

    block UnitDelay "Delays the clocked input signal for one sample period"
      extends Modelica_Synchronous.BooleanSignals.Interfaces.PartialClockedSISO(
          u(final start=y_start));
      parameter Boolean y_start=false
        "Value of output signal at first clock tick";
    equation
      y = previous(u);
      annotation (defaultComponentName="UnitDelay1",
           Icon(graphics={
            Line(points={{-30,0},{30,0}}, color={255,0,255}),
            Text(
              extent={{-90,10},{90,90}},
              textString="1",
              lineColor={255,0,255},
              pattern=LinePattern.Dot),
            Text(
              extent={{-90,-10},{90,-90}},
              textString="z",
              lineColor={255,0,255}),
            Text(
              extent={{-150,-140},{150,-100}},
              lineColor={0,0,0},
              textString="y_start=%y_start")}),
        Documentation(info="<html>
<p>
This block describes a unit delay:
</p>
<pre>
  // Time domain description
     y(ti) = previous(u(ti))

  // Discrete transfer function
             1
     y(z) = --- * u(z)
             z
</pre>

<p>
that is, the output signal y is the input signal u at the
previous clock tick. At the first clock tick, the output
y is set to parameter y_start.
</p>
</html>"));
    end UnitDelay;

    block FractionalDelay
      "Delays the clocked input signal for a fractional multiple of the sample period"
    extends Modelica_Synchronous.BooleanSignals.Interfaces.PartialClockedSISO;

      parameter Integer shift(min=0) = 0
        "Delay = interval() * shift/resolution";
      parameter Integer resolution(min=1) = 1
        "Time quantization resolution of sample interval";
    protected
      parameter Integer n = div(shift,resolution);
      Boolean u_buffer[n+1](each start=false)
        "The previous values of the inputs; u_last[1] = u, u_last[2] = previous(u_last[1]); u_last[3] = previous(u_last[2])";
      Boolean first(start=true) "Used to identify the first clock tick";
    equation
     first = false;
     u_buffer = if previous(first) then fill(u,n+1) else cat(1, {u}, previous(u_buffer[1:n]));
     y = shiftSample(u_buffer[n+1], shift, resolution);

      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics),
        Icon(graphics={
            Line(
              points={{-100,0},{-80,0},{-80,40},{-20,40},{-20,-40},{40,-40},{40,0},{
                  100,0}},
              color={215,215,215},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Line(
              points={{-100,0},{-50,0},{-50,40},{10,40},{10,-40},{70,-40},{70,-0.3125},
                  {100,0}},
              pattern=LinePattern.Dot,
              smooth=Smooth.None,
              color={255,0,255}),
            Text(
              extent={{4,-102},{4,-142}},
              lineColor={0,0,0},
              textString="%shift/%resolution"),
            Ellipse(
              extent={{-90,50},{-70,30}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-30,-30},{-10,-50}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,10},{50,-10}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,50},{-40,30}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{0,-30},{20,-50}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{60,10},{80,-10}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid)}));
    end FractionalDelay;

  end NonPeriodic;

  package Interfaces
    "Library of partial blocks for components with clocked Boolean signals"
    extends Modelica.Icons.InterfacesPackage;

    partial block SamplerIcon
      "Basic graphical layout of block used for sampling of Boolean signals"

      annotation (
        Icon(
          coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06),
          graphics={
            Rectangle(
              extent={{-99,40},{99,-40}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Line(points={{-100,0},{-45,0}}, color={255,85,255}),
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={255,85,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-35,0},{30,35}}, color={255,85,255}),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={255,85,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{45,0},{100,0}}, color={255,85,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end SamplerIcon;

    partial block PartialSISOSampler
      "Basic block used for sampling of Boolean signals"
    extends Modelica_Synchronous.BooleanSignals.Interfaces.SamplerIcon;
      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of continuous-time, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end PartialSISOSampler;

    partial block PartialClockedSISO
      "Block with clocked single input and clocked single output Boolean signals"
      extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;

      Modelica.Blocks.Interfaces.BooleanInput
                                           u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput
                                            y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));

      annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-100},{100,100}}), graphics));
    end PartialClockedSISO;
    annotation (Documentation(info="<html>
<p>
This package contains partial blocks that are used to
construct blocks operating on clocked Boolean signals.
</p>
</html>"));
  end Interfaces;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that operate on clocked Boolean signals.
Especially blocks are provided to transform from continuous-time Boolean signals to
clocked Boolean signals (with Sampler blocks) and vice versa
(with Hold blocks), as well as to transform a clocked Boolean signal from
one clock to a different clock in a time-synchronized way.
</p>
</html>"));
end BooleanSignals;
