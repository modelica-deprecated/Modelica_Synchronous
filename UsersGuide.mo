within Modelica_Synchronous;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;
  package GettingStarted "Getting started"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
In this section, a first introduction to the Modelica_Synchronous
library is given at hand of several examples.
<br>
(needs still to be provided).
</p>
</html>"));
  end GettingStarted;

  class Clocks "Clocks"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
A central element of the Modelica_Synchronous library is a <b>clock</b>.
Below, the most important information for clocks is summarized.
For more details, see the Modelica Language Specification,
Chapter 16 (for Modelica Language Version &ge; 3.3).
</p>

<p>
A <b>Clock</b> type is a base data type (introduced in Modelica 3.3, additionally to Real, Integer, Boolean, String) that defines when a particular partition consisting of a set of equations is active. Starting with Modelica Language Version 3.3, every variable and every equation is either continuous-time or is associated exactly to one clock. This feature is visualized in the figure below where c(ti) is a clock that is active at particular time instants ti and r(ti) is a variable that is associated to this clock. A clocked variable has only a value when the corresponding clock is active:
</p>

<p>
<img src=\"modelica://Modelica_Synchronous/Resources/Images/Clocks/clockSignals.png\">
</p>

<p>
Similarly to RealInput, RealOutput etc., clock input and output connectors, called ClockInput and ClockOutput, are defined in sublibrary
<a href=\"modelica://Modelica_Synchronous.ClockSignals.Interfaces\">ClockSignal.Interfaces</a>
in order to propagate clocks via connections. A clock signal can be generated with
one of the blocks of sublibrary
<a href=\"modelica://Modelica_Synchronous.ClockSignals.Clocks\">ClockSignals.Clocks</a>:
</p>

<p>
<img src=\"modelica://Modelica_Synchronous/Resources/Images/Clocks/clocks.png\">
</p>

<p>
The output signals of the blocks in the above figure are clock signals,
by default visualized with dotted grey lines.
</p>

<p>
With the blocks of sublibrary
<a href=\"modelica://Modelica_Synchronous.ClockSignals.Sampler\">ClockSignals.Sampler</a>
a clock signal can be sub-sampled, super-sampled, or shift-sampled to generate
a new clock signal. For example, with the following model, a periodic clock signal of 0.1 s
is sub-sampled with a factor 3 and therefore a clock signal with a period of 0.3 s
is generated:
</p>

<p>
<img src=\"modelica://Modelica_Synchronous/Resources/Images/Clocks/subSampledClockExample.png\"><br>
<img src=\"modelica://Modelica_Synchronous/Resources/Images/Clocks/subSampledClockResult.png\">
</p>

<p>
As usual in synchronous languages, a clock is represented by a <b>true</b> value
when the clock is active. The relationship between such derived
clocks is <b>exact</b>, so it is guaranteed that at every 3rd tick of clock
\"periodicRealClock.y\", the clock \"subSample.y\" is active.
</p>

<p>
If a clock is associated to a clocked continuous-time partition, then an <b>integrator</b>
has to be defined that is used to integrate the partition from the previous
to the current clock tick. This is performed by setting parameter <b>useSolver</b>
= <b>true</b> and defining the integration method as String with
parameter <b>solver</b>. Both parameters are in tab <b>Advanced</b>
of one of the clock signal generating blocks.
The possible integration methods are tool dependent. It is expected that
at least the solvers \"External\" (= use the integrator selected in the
simulation environment) and \"ExplicitEuler\" (= explicit Euler method)
are supported by every tool. For an example, see
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
</p>

<p>
A clocked partition is a set of equations that depend
on each other and where the boundary variables are marked
with sample and hold operators.
If a clocked partition contains no operator <b>der</b>, <b>delay</b>,
<b>spatialDistribution</b>, no event related operators (with exception of <b>noEvent</b>(..)),
and no <b>when</b>-clause with a Boolean condition, it is a <b>clocked discrete-time</b>
partition, that is, it is a standard sampled data system that is described by difference equations.
If a clocked partition is <b>not</b> a <b>clocked discrete-time</b> partition and
it contains neither operator <b>previous</b> nor operator
<b>interval</b>, it is a
<b>clocked discretized continuous-time</b> partition.
Such a partition has to be solved with a <b>solver</b> method.
It is an error, if none of the two properties hold, e.g., if operators
<b>previous</b> and <b>der</b> are both used in the same partition.
In a clocked discrete-time partition all event generating mechanisms
do no longer apply. Especially neither relations, nor one of the built-in event
triggering operators will trigger an event.
</p>
</html>"));
  end Clocks;

  class Literature "Literature"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
<i>This library is based on the following references:</i>
</p>

<dl>
<dt>Astr&ouml;m K.J., Wittenmark B. (1997):</dt>
<dd> <b>Computer Controlled Systems: Theory and Design</b>.
     Prentice Hall. 3rd edition.<br>&nbsp;</dd>

<dt>Elmqvist H., Otter M., and Mattsson S.E. (2012):</dt>
<dd><b>Fundamentals of Synchronous Control in Modelica.</b>
    Proceedings of 9th International Modelica Conference, Munich,
    Germany, Sep. 3-5.<br>&nbsp;</dd>

<dt>Otter M., Thiele B., and Elmqvist H. (2012):</dt>
<dd> <b>A Library for Synchronous Control Systems in Modelica.</b>
     Proceedings of 9th International Modelica Conference, Munich,
     Germany, September 3-5.<br>&nbsp;</dd>

<dt>Walther N. (2002):</dt>
<dd> <b>Praxisgerechte Modelica-Bibliothek f&uuml;r Abtastregler</b>.
     Diplomarbeit, HTWK Leipzig, Fachbereich Elektro- und
     Informationstechnik, supervised by Prof. M&uuml;ller (HTWK)
     and Prof. Martin Otter (DLR), 12 Nov. 2002.<br>&nbsp;</dd>
</dl>

<p>
<i>
The synchronous Modelica language elements allow for the first
time to utilize a continuous-time, nonlinear, inverse model in
a Modelica sampled-data system, by automatically discretizing
this model and providing it as a clocked partition. This allows
a convenient definition of certain nonlinear control systems,
see example
<a href=\"modelica://Modelica_Synchronous.Examples.Systems.ControlledMixingUnit\">Examples.Systems.ControlledMixingUnit</a>.
Several practical details to use nonlinear inverse plant models in
a control system are discussed in the following reference:</i>
</p>

<dl>
<dt>Looye G., Th&uuml;mmel M., Kurze M., Otter M., and Bals J. (2005):</dt>
<dd> <b>Nonlinear Inverse Models for Control</b>.
     Proceedings of 4th International Modelica Conference, ed. G. Schmitz,
     Hamburg, March 7-8.
     <a href=\"https://www.modelica.org/events/Conference2005/online_proceedings/Session3/Session3c3.pdf\">Download</a>.
     <br>&nbsp;</dd>
</dl>

<p>
<i>
The synchronous Modelica language elements used in this library
are based on the clock calculus and inference system proposed by (Colaco and
Pouzet 2003) and implemented in Lucid Synchrone version 2 and 3 (Pouzet 2006).
However, the Modelica approach also uses multi-rate periodic clocks based on
rational arithmetic introduced by (Forget et. al. 2008), as an extension of
the Lucid Synchrone semantics. These approaches belong to the class of
synchronous languages (Benveniste et. al. 2002):</i>
</p>

<dl>
<dt>Benveniste A., Caspi P., Edwards S.A., Halbwachs N., Le Guernic P., and Simone R. (2003):</dt>
<dd> <b>The Synchronous Languages Twelve Years Later</b>.
     Proceedings of the IEEE, Vol., 91, No. 1.
     <a href=\"http://www.irisa.fr/distribcom/benveniste/pub/synch_ProcIEEE_2002.pdf\">Download</a>.
     <br>&nbsp;</dd>

<dt>Colaco J.-L., and Pouzet M. (2003):</dt>
<dd><b>Clocks as First Class Abstract Types.</b>
    In Third International Conference on
    Embedded Software (EMSOFT'03), Philadelphia, Pennsylvania, USA, October 2003.
     <a href=\"http://www.di.ens.fr/~pouzet/lucid-synchrone/papers/emsoft03.ps.gz\">Download</a>.
    <br>&nbsp;</dd>

<dt>Forget J., F. Boniol, D. Lesens, C. Pagetti (2008):</dt>
<dd> <b>A Multi-Periodic Synchronous Data-Flow Language.</b>
     In 11th IEEE High Assurance Systems Engineering Symposium (HASE'08),
     Dec. 3-5 2008, Nanjing, China, pp. 251-260.
     <a href=\"http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=4708883&contentType=Conference+Publications\">Download</a>.
     <br>&nbsp;</dd>

<dt>Pouzet M. (2006):</dt>
<dd> <b>Lucid Synchrone, Version 3.0, Tutorial and Reference Manual</b>.
     <a href=\"http://www.di.ens.fr/~pouzet/lucid-synchrone/\">Download</a>.
    <br>&nbsp;</dd>
</dl>
</html>"));
  end Literature;

  package ReleaseNotes "Release notes"
    class Version_0_92_Build_2 "Version 0.92 Build 2 (Sept. 9, 2015)"
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>
Changes with respect to version 0.92 Build 1:
</p>

<ul>
<li> RealSignals.Sampler: Removed wrong double declaration of u and y
    (was present due to extends and due to explicit declaration)</li>
</ul>
</html>"));
    end Version_0_92_Build_2;
    extends Modelica.Icons.Information;

    class Version_0_92 "Version 0.92 (Sept. 19, 2012)"
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>
Changes with respect to version 0.91:
</p>

<ul>
<li> The library uses the latest Modelica Standard Libary (MSL) version 3.2.1 (but still works with version 3.2). </li>
<li> Added a couple of convenience source blocks for Real, Integer, and Boolean signals that are similar to the blocks
     found in the MSL, but have as output a clocked signal.</li>
<li> Added a couple of source blocks that are parametrized in terms of clock ticks rather than simulation time.</li>
<li> All new blocks are utilized in at least one test.</li>
</ul>

</html>"));
    end Version_0_92;

    class Version_0_91 "Version 0.91 (Sept. 20, 2012)"
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>
First version of the library provided on the Modelica web page.
Changes with respect to version 0.9:
</p>

<ul>
<li> The library has been slightly restructured. </li>
<li> Documentation has been significantly enhanced
     (nearly all elements of the library are documented now).</li>
<li> Simple examples have been added for many
     blocks of the library in the new package
     <a href=\"modelica://Modelica_Synchronous.Examples.Elementary\">Examples.Elementary</a>.
     These blocks have been used to generate the figures in the documentation of
     many blocks. Furthermore, they are used for testing these blocks.</li>
</ul>

<p>
The library has been tested with Dymola 2013 FD01:
</p>

<ul>
<li> \"Check\" with \"Pedantic = true\" is successful (so the library should be completly compatible
     to the Modelica 3.3 specification).</li>
<li> \"Check with Simulation\" is successful.</li>
<li> The tests have a class coverage of 100 %
     (that is every class of the library is utilized in at least
     one test).</li>
<li> The results of the test models have been either manually checked,
     or compared with results of the Modelica_LinearSystems.Controller or
     the Modelica.Blocks.Discrete library.</li>
</ul>

<p>
The library has also been tested with the MapleSim Standalone Modelica parser
(so also another Modelica tool deduces that the library is fully conformant to
Modelica).
</p>
</html>"));
    end Version_0_91;

    class Version_0_9 "Version 0.9 (Aug. 28, 2012)"
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>
This library version has been used
by the participants of a tutorial at the 9th
Modelica Conference 2012.
</p>
</html>"));
    end Version_0_9;
    annotation (Documentation(info="<html>
<p>
This section summarizes the changes that have been performed
on the Modelica_Synchronous library.
</p>
</html>"));
  end ReleaseNotes;

class ModelicaLicense2 "Modelica License 2"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<head>
<title>The Modelica License 2</title>
<style type=\"text/css\">
*       { font-size: 10pt; font-family: Arial,sans-serif; }
code    { font-size:  9pt; font-family: Courier,monospace;}
h6      { font-size: 10pt; font-weight: bold; color: green; }
h5      { font-size: 11pt; font-weight: bold; color: green; }
h4      { font-size: 13pt; font-weight: bold; color: green; }
address {                  font-weight: normal}
td      { solid #000; vertical-align:top; }
th      { solid #000; vertical-align:top; font-weight: bold; }
table   { solid #000; border-collapse: collapse;}
</style>
</head>

<p>All files in this directory (Modelica_Synchronous) and in all
subdirectories, especially all files that build package \"Modelica_Synchronous\"
are licensed by <b>DLR</b> under the
<b>Modelica License 2</b>.</p>

<p style=\"margin-left: 40px;\"><b>Licensor:</b><br>
German Aerospace Center (DLR)<br>
Robotics and Mechatronics Center<br>
Institute of System Dynamics and Control<br>
Postfach 1116<br>
D-82230 Wessling<br>
Germany<br>
email: Martin.Otter@dlr.de
</p>

<p style=\"margin-left: 40px;\"><b>Copyright notices of the files:</b><br>
Copyright &copy; 2012-2015, DLR Institute of System Dynamics and Control.<br>
<br>
</p>

<p>
<a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a><br>
<a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a><br>
</p>

<hr>

<h4><a name=\"The_Modelica_License_2-outline\"></a>The Modelica License 2</h4>

<p>
<b>Preamble.</b> The goal of this license is that Modelica related
model libraries, software, images, documents, data files etc. can be
used freely in the original or a modified form, in open source and in
commercial environments (as long as the license conditions below are
fulfilled, in particular sections 2c) and 2d). The Original Work is
provided free of charge and the use is completely at your own risk.
Developers of free Modelica packages are encouraged to utilize this
license for their work.</p>

<p>
The Modelica License applies to any Original Work that contains the
following licensing notice adjacent to the copyright notice(s) for
this Original Work:</p>

<p><b>Licensed by the Modelica Association under the Modelica License 2</b></p>

<p><b>1. Definitions.</b></p>
<ol type=\"a\">
  <li>&ldquo;License&rdquo; is this Modelica License.</li>

  <li>&ldquo;Original Work&rdquo; is any work of authorship, including
  software, images, documents, data files, that contains the above
  licensing notice or that is packed together with a licensing notice
  referencing it.</li>

  <li>&ldquo;Licensor&rdquo; is the provider of the Original Work who has
  placed this licensing notice adjacent to the copyright notice(s) for
  the Original Work. The Original Work is either directly provided by
  the owner of the Original Work, or by a licensee of the owner.</li>

  <li>&ldquo;Derivative Work&rdquo; is any modification of the Original
  Work which represents, as a whole, an original work of authorship.
  For the matter of clarity and as examples:

  <ol  type=\"A\">
    <li>Derivative Work shall not include work that remains separable from
    the Original Work, as well as merely extracting a part of the
    Original Work without modifying it.</li>

    <li>Derivative Work shall not include (a) fixing of errors and/or (b)
    adding vendor specific Modelica annotations and/or (c) using a
    subset of the classes of a Modelica package, and/or (d) using a
    different representation, e.g., a binary representation.</li>

    <li>Derivative Work shall include classes that are copied from the
    Original Work where declarations, equations or the documentation
    are modified.</li>

    <li>Derivative Work shall include executables to simulate the models
    that are generated by a Modelica translator based on the Original
    Work (of a Modelica package).</li>
  </ol>

  <li>&ldquo;Modified Work&rdquo; is any modification of the Original Work
  with the following exceptions: (a) fixing of errors and/or (b)
  adding vendor specific Modelica annotations and/or (c) using a
  subset of the classes of a Modelica package, and/or (d) using a
  different representation, e.g., a binary representation.</li>

  <li>&quot;Source Code&quot; means the preferred form of the Original
  Work for making modifications to it and all available documentation
  describing how to modify the Original Work.</li>

  <li>&ldquo;You&rdquo; means an individual or a legal entity exercising
  rights under, and complying with all of the terms of, this License.</li>

  <li>&ldquo;Modelica package&rdquo; means any Modelica library that is
  defined with the &ldquo;<code><b>package</b>&nbsp;&lt;Name&gt;&nbsp;...&nbsp;<b>end</b>&nbsp;&lt;Name&gt;;</code>&rdquo; Modelica language element.</li>

</ol>

<p>
<b>2. Grant of Copyright License.</b> Licensor grants You a
worldwide, royalty-free, non-exclusive, sublicensable license, for
the duration of the copyright, to do the following:</p>

<ol type=\"a\">
  <li><p>
  To reproduce the Original Work in copies, either alone or as part of
  a collection.</p></li>
  <li><p>
  To create Derivative Works according to Section 1d) of this License.</p></li>
  <li><p>
  To distribute or communicate to the public copies of the <u>Original
  Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No
  fee, neither as a copyright-license fee, nor as a selling fee for
  the copy as such may be charged under this License. Furthermore, a
  verbatim copy of this License must be included in any copy of the
  Original Work or a Derivative Work under this License.<br>
  For the matter of clarity, it is permitted A) to distribute or
  communicate such copies as part of a (possible commercial)
  collection where other parts are provided under different licenses
  and a license fee is charged for the other parts only and B) to
  charge for mere printing and shipping costs.</p></li>
  <li><p>
  To distribute or communicate to the public copies of a <u>Derivative
  Work</u>, alternatively to Section 2c), under <u>any other license</u>
  of your choice, especially also under a license for
  commercial/proprietary software, as long as You comply with Sections
  3, 4 and 8 below. <br>      For the matter of clarity, no
  restrictions regarding fees, either as to a copyright-license fee or
  as to a selling fee for the copy as such apply.</p></li>
  <li><p>
  To perform the Original Work publicly.</p></li>
  <li><p>
  To display the Original Work publicly.</p></li>
</ol>

<p>
<b>3. Acceptance.</b> Any use of the Original Work or a
Derivative Work, or any action according to either Section 2a) to 2f)
above constitutes Your acceptance of this License.</p>

<p>
<b>4. Designation of Derivative Works and of Modified Works.
</b>The identifying designation of Derivative Work and of Modified
Work must be different to the corresponding identifying designation
of the Original Work. This means especially that the (root-level)
name of a Modelica package under this license must be changed if the
package is modified (besides fixing of errors, adding vendor specific
Modelica annotations, using a subset of the classes of a Modelica
package, or using another representation, e.g. a binary
representation).</p>

<p>
<b>5. Grant of Patent License.</b>
Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license,
under patent claims owned by the Licensor or licensed to the Licensor by
the owners of the Original Work that are embodied in the Original Work
as furnished by the Licensor, for the duration of the patents,
to make, use, sell, offer for sale, have made, and import the Original Work
and Derivative Works under the conditions as given in Section 2.
For the matter of clarity, the license regarding Derivative Works covers
patent claims to the extent as they are embodied in the Original Work only.</p>

<p>
<b>6. Provision of Source Code.</b> Licensor agrees to provide
You with a copy of the Source Code of the Original Work but reserves
the right to decide freely on the manner of how the Original Work is
provided.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary
representation of the Original Work. In that case, You may (a) either
reproduce the Source Code from the binary representation if this is
possible (e.g., by performing a copy of an encrypted Modelica
package, if encryption allows the copy operation) or (b) request the
Source Code from the Licensor who will provide it to You.</p>

<p>
<b>7. Exclusions from License Grant.</b> Neither the names of
Licensor, nor the names of any contributors to the Original Work, nor
any of their trademarks or service marks, may be used to endorse or
promote products derived from this Original Work without express
prior permission of the Licensor. Except as otherwise expressly
stated in this License and in particular in Sections 2 and 5, nothing
in this License grants any license to Licensor&rsquo;s trademarks,
copyrights, patents, trade secrets or any other intellectual
property, and no patent license is granted to make, use, sell, offer
for sale, have made, or import embodiments of any patent claims.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of
Licensor even if such trademarks are included in the Original Work,
except as expressly stated in this License. Nothing in this License
shall be interpreted to prohibit Licensor from licensing under terms
different from this License any Original Work that Licensor otherwise
would have a right to license.</p>

<p>
<b>8. Attribution Rights.</b> You must retain in the Source
Code of the Original Work and of any Derivative Works that You
create, all author, copyright, patent, or trademark notices, as well
as any descriptive text identified therein as an &quot;Attribution
Notice&quot;. The same applies to the licensing notice of this
License in the Original Work. For the matter of clarity, &ldquo;author
notice&rdquo; means the notice that identifies the original
author(s). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative
Works that You create to carry a prominent Attribution Notice
reasonably calculated to inform recipients that You have modified the
Original Work. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in
Source Code, the Attribution Notices shall be appropriately
displayed, e.g., in the documentation of the Derivative Work.</p>

<p><b>9. Disclaimer
of Warranty. <br></b><u><b>The Original Work is provided under this
License on an &quot;as is&quot; basis and without warranty, either
express or implied, including, without limitation, the warranties of
non-infringement, merchantability or fitness for a particular
purpose. The entire risk as to the quality of the Original Work is
with You.</b></u> This disclaimer of warranty constitutes an
essential part of this License. No license to the Original Work is
granted by this License except under this disclaimer.</p>

<p>
<b>10. Limitation of Liability.</b> Under no circumstances and
under no legal theory, whether in tort (including negligence),
contract, or otherwise, shall the Licensor, the owner or a licensee
of the Original Work be liable to anyone for any direct, indirect,
general, special, incidental, or consequential damages of any
character arising as a result of this License or the use of the
Original Work including, without limitation, damages for loss of
goodwill, work stoppage, computer failure or malfunction, or any and
all other commercial damages or losses. This limitation of liability
shall not apply to the extent applicable law prohibits such
limitation.</p>

<p>
<b>11. Termination.</b> This License conditions your rights to
undertake the activities listed in Section 2 and 5, including your
right to create Derivative Works based upon the Original Work, and
doing so without observing these terms and conditions is prohibited
by copyright law and international treaty. Nothing in this License is
intended to affect copyright exceptions and limitations. This License
shall terminate immediately and You may no longer exercise any of the
rights granted to You by this License upon your failure to observe
the conditions of this license.</p>

<p>
<b>12. Termination for Patent Action.</b> This License shall
terminate automatically and You may no longer exercise any of the
rights granted to You by this License as of the date You commence an
action, including a cross-claim or counterclaim, against Licensor,
any owners of the Original Work or any licensee alleging that the
Original Work infringes a patent. This termination provision shall
not apply for an action alleging patent infringement through
combinations of the Original Work under combination with other
software or hardware.</p>

<p>
<b>13. Jurisdiction.</b> Any action or suit relating to this
License may be brought only in the courts of a jurisdiction wherein
the Licensor resides and under the laws of that jurisdiction
excluding its conflict-of-law provisions. The application of the
United Nations Convention on Contracts for the International Sale of
Goods is expressly excluded. Any use of the Original Work outside the
scope of this License or after its termination shall be subject to
the requirements and penalties of copyright or patent law in the
appropriate jurisdiction. This section shall survive the termination
of this License.</p>

<p>
<b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the
terms of this License or seeking damages relating thereto, the
prevailing party shall be entitled to recover its costs and expenses,
including, without limitation, reasonable attorneys' fees and costs
incurred in connection with such action, including any appeal of such
action. This section shall survive the termination of this License.</p>

<p>
<b>15. Miscellaneous.</b>
</p>
<ol type=\"a\">
  <li>If any
  provision of this License is held to be unenforceable, such
  provision shall be reformed only to the extent necessary to make it
  enforceable.</li>

  <li>No verbal
  ancillary agreements have been made. Changes and additions to this
  License must appear in writing to be valid. This also applies to
  changing the clause pertaining to written form.</li>

  <li>You may use the
  Original Work in all ways not otherwise restricted or conditioned by
  this License or by law, and Licensor promises not to interfere with
  or be responsible for such uses by You.</li>
</ol>

<hr>

<h5><a name=\"Frequently_Asked_Questions-outline\"></a>
Frequently Asked Questions</h5>
<p>This
section contains questions/answer to users and/or distributors of
Modelica packages and/or documents under Modelica License 2. Note,
the answers to the questions below are not a legal interpretation of
the Modelica License 2. In case of a conflict, the language of the
license shall prevail.</p>

<h6>Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</h6>

<p><b>What are the main
differences to the previous version of the Modelica License?</b></p>
<ol>
  <li><p>
  Modelica License 1 is unclear whether the licensed Modelica package
  can be distributed under a different license. Version 2 explicitly
  allows that &ldquo;Derivative Work&rdquo; can be distributed under
  any license of Your choice, see examples in Section 1d) as to what
  qualifies as Derivative Work (so, version 2 is clearer).</p>
  <li><p>
  If You modify a Modelica package under Modelica License 2 (besides
  fixing of errors, adding vendor specific Modelica annotations, using
  a subset of the classes of a Modelica package, or using another
  representation, e.g., a binary representation), you must rename the
  root-level name of the package for your distribution. In version 1
  you could keep the name (so, version 2 is more restrictive). The
  reason of this restriction is to reduce the risk that Modelica
  packages are available that have identical names, but different
  functionality.</p>
  <li><p>
  Modelica License 1 states that &ldquo;It is not allowed to charge a
  fee for the original version or a modified version of the software,
  besides a reasonable fee for distribution and support&rdquo;.
  Version 2 has a similar intention for all Original Work under
  <u>Modelica License 2</u> (to remain free of charge and open source)
  but states this more clearly as &ldquo;No fee, neither as a
  copyright-license fee, nor as a selling fee for the copy as such may
  be charged&rdquo;. Contrary to version 1, Modelica License 2 has no
  restrictions on fees for Derivative Work that is provided under a
  different license (so, version 2 is clearer and has fewer
  restrictions).</p>
  <li><p>
  Modelica License 2 introduces several useful provisions for the
  licensee (articles 5, 6, 12), and for the licensor (articles 7, 12,
  13, 14) that have no counter part in version 1.</p>
  <li><p>
  Modelica License 2 can be applied to all type of work, including
  documents, images and data files, contrary to version 1 that was
  dedicated for software only (so, version 2 is more general).</p>
</ol>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) as part of my commercial
Modelica modeling and simulation environment?</b></p>
<p>Yes,
according to Section 2c). However, you are not allowed to charge a
fee for this part of your environment. Of course, you can charge for
your part of the environment.
</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different
license?</b></p>
<p>No.
The license of an unmodified Modelica package cannot be changed
according to Sections 2c) and 2d). This means that you cannot <u>sell</u>
copies of it, any distribution has to be free of charge.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first encrypt the package?</b></p>
<p>No.
Merely encrypting a package does not qualify for Derivative Work and
therefore the encrypted package has to stay under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first add classes to the package?</b></p>
<p>No.
The package itself remains unmodified, i.e., it is Original Work, and
therefore the license for this part must remain under Modelica
License 2. The newly added classes can be, however, under a different
license.
</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it </b><u><b>unmodified</b></u><b> in a Modelica package
under a </b><u><b>commercial/proprietary license</b></u><b>?</b></p>
<p>No,
according to article 2c). However, you can include model, block,
function, package, record and connector classes in your Modelica
package under <u>Modelica License 2</u>. This means that your
Modelica package could be under a commercial/proprietary license, but
one or more classes of it are under Modelica License 2.<br>Note, a
&ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;))
can be copied and included unmodified under a commercial/proprietary
license (for details, see the next question).</p>

<p><b>Can
I copy a type class or </b><u><b>part</b></u><b> of a model, block,
function, record, connector class, out of a Modelica package (under
Modelica License 2) and include it modified or unmodified in a
Modelica package under a </b><u><b>commercial/proprietary</b></u><b>
license</b></p>
<p>Yes,
according to article 2d), since this will in the end usually qualify
as Derivative Work. The reasoning is the following: A type class or
part of another class (e.g., an equation, a declaration, part of a
class description) cannot be utilized &ldquo;by its own&rdquo;. In
order to make this &ldquo;usable&rdquo;, you have to add additional
code in order that the class can be utilized. This is therefore
usually Derivative Work and Derivative Work can be provided under a
different license. Note, this only holds, if the additional code
introduced is sufficient to qualify for Derivative Work. Merely, just
copying a class and changing, say, one character in the documentation
of this class would be no Derivative Work and therefore the copied
code would have to stay under Modelica License 2.</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it in </b><u><b>modified </b></u><b>form in a
</b><u><b>commercial/proprietary</b></u><b> Modelica package?</b></p>
<p>Yes.
If the modification can be seen as a &ldquo;Derivative Work&rdquo;,
you can place it under your commercial/proprietary license. If the
modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g.,
bug fixes, vendor specific annotations), it must remain under
Modelica License 2. This means that your Modelica package could be
under a commercial/proprietary license, but one or more parts of it
are under Modelica License 2.</p>

<p><b>Can I distribute a
&ldquo;save total model&rdquo; under my commercial/proprietary
license, even if classes under Modelica License 2 are included?</b></p>
<p>Your
classes of the &ldquo;save total model&rdquo; can be distributed
under your commercial/proprietary license, but the classes under
Modelica License 2 must remain under Modelica License 2. This means
you can distribute a &ldquo;save total model&rdquo;, but some parts
might be under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) in encrypted form?</b></p>
<p>Yes.
Note, if the encryption does not allow &ldquo;copying&rdquo; of
classes (in to unencrypted Modelica source code), you have to send
the Modelica source code of this package to your customer, if he/she
wishes it, according to article&nbsp;6.</p>

<p><b>Can I distribute an
executable under my commercial/proprietary license, if the model from
which the executable is generated uses models from a Modelica package
under Modelica License 2?</b></p>
<p>Yes,
according to article 2d), since this is seen as Derivative Work. The
reasoning is the following: An executable allows the simulation of a
concrete model, whereas models from a Modelica package (without
pre-processing, translation, tool run-time library) are not able to
be simulated without tool support. By the processing of the tool and
by its run-time libraries, significant new functionality is added (a
model can be simulated whereas previously it could not be simulated)
and functionality available in the package is removed (e.g., to build
up a new model by dragging components of the package is no longer
possible with the executable).</p>

<p><b>Is my modification to
a Modelica package (under Modelica License 2) a Derivative Work?</b></p>
<p>It
is not possible to give a general answer to it. To be regarded as &quot;an
original work of authorship&quot;, a derivative work must be
different enough from the original or must contain a substantial
amount of new material. Making minor changes or additions of little
substance to a preexisting work will not qualify the work as a new
version for such purposes.
</p>

<h6>Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</h6>

<p>This
section is devoted especially for the following applications:</p>
<ol type=\"a\">
  <li><p>
  A Modelica tool extracts information out of a Modelica package and
  presents the result in form of a &ldquo;manual&rdquo; for this
  package in, e.g., html, doc, or pdf format.</p>
  <li><p>
  The Modelica language specification is a document defining the
  Modelica language. It will be licensed under Modelica License 2.</p>
  <li><p>
  Someone writes a book about the Modelica language and/or Modelica
  packages and uses information which is available in the Modelica
  language specification and/or the corresponding Modelica package.</p>
</ol>

<p><b>Can I sell a manual
that was basically derived by extracting information automatically
from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference
guide&rdquo; of the Modelica Standard Library):</b></p>
<p>Yes.
Extracting information from a Modelica package, and providing it in a
human readable, suitable format, like html, doc or pdf format, where
the content is significantly modified (e.g. tables with interface
information are constructed from the declarations of the public
variables) qualifies as Derivative Work and there are no restrictions
to charge a fee for Derivative Work under alternative 2d).</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it </b><u><b>unmodified</b></u><b> in my document
(e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes.
In case you distribute your document, the copied parts are still
under Modelica License 2 and you are not allowed to charge a license
fee for this part. You can, of course, charge a fee for the rest of
your document.</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it in </b><u><b>modified</b></u><b> form in my
document?</b></p>
<p>Yes,
the creation of Derivative Works is allowed. In case the content is
significantly modified this qualifies as Derivative Work and there
are no restrictions to charge a fee for Derivative Work under
alternative 2d).</p>

<p><b>Can I sell a printed
version of a Modelica document (under Modelica License 2), e.g., the
Modelica Language Specification?</b></p>
<p>No,
if you are not the copyright-holder, since article 2c) does not allow
a selling fee for a (in this case physical) copy. However, mere
printing and shipping costs may be recovered.</p>
</html>"));
end ModelicaLicense2;

  class Requirements "Requirements"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
This library is basically a graphical user interface to conveniently
operate with the Modelica 3.3 language elements of Chapter 16
\"Synchronous Language Elements\" of the Modelica Language Specification 3.3.
Every tool that supports these language
elements, as well as basic language elements of Modelica 3.1, should be
able to support this library.
</p>
</html>"));
  end Requirements;

  class Contact "Contact"
    extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<dl>
<dt><b>Main Authors:</b></dt>
<dd>Martin Otter and Bernhard Thiele<br>
    German Aerospace Center (DLR)<br>
    Robotics and Mechatronics Center<br>
    Institute of System Dynamics and Control<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A>, <a href=\"mailto:Bernhard.Thiele@dlr.de\">Bernhard.Thiele@dlr.de</A><br></dd>
</dl>
<p><b>Acknowledgements:</b></p>
<ul>
<li> The design of the library has been performed in close cooperation and discussion
     with Hilding Elmqvist from Dassault Syst&egrave;mes Lund.</li>

<li> Sven Erik Mattsson from Dassault Syst&egrave;mes Lund developed the first
     Dymola prototype supporting the synchronous features of Modelica 3.3.
     Without this prototype,
     it would not have been possible to develop the Modelica_Synchronous library.</li>
</ul>
</html>"));
  end Contact;
  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>
Library <b>Modelica_Synchronous</b> is a Modelica package
to precisely define and synchronize sampled data systems with different sampling rates. This package contains the <b>user's guide</b> for
the library and has the following content:
</p>
<ol>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.GettingStarted\">Getting started</a>
    contains an introduction to the most important features and how
    to use them at hand of examples.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.Literature\">Literature</a>
    provides references that have been used to design and implement this
    library.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the differences between different versions of this library.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.ModelicaLicense2\">Modelica License 2</a>
    is the legal license text under which this library is submitted.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.Requirements\">Requirements</a>
    sketches the requirements on a Modelica tool, in order that this library
    can be utilized.</li>
<li><a href=\"modelica://Modelica_Synchronous.UsersGuide.Contact\">Contact</a>
    provides information about the authors of the library as well as
    acknowledgments.</li>
</ol>
</html>"));
end UsersGuide;
