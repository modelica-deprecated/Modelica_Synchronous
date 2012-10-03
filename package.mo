within ;
package Modelica_Synchronous "Modelica_Synchronous (version 0.91) - Basic synchronous input/output control blocks
that are triggered by clocks"
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
<a href=\"modelica://Modelica_Synchronous.Interfaces\">Interfaces</a>
in order to propagate clocks via connections. A clock signal can be generated with
one of the blocks of sublibrary
<a href=\"modelica://Modelica_Synchronous.Clocks\">Clocks</a>:
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
<a href=\"modelica://Modelica_Synchronous.ClockSignals\">ClockSignals</a>
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
This library is based on the following references:
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
</html>"));
    end Literature;

    package ReleaseNotes "Release notes"
      extends Modelica.Icons.Information;
      class Version_0_9 "Version 0.9 (Aug. 28, 2012)"
        extends Modelica.Icons.Information;
        annotation (Documentation(info="<html>
<p>
First public version of the library.
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
Copyright &copy; 2012, DLR Institute of System Dynamics and Control.<br>
<br>
</p>


<hr>
<h4><a name=\"ModelicaLicense2\"></a>The Modelica License 2</h4>

<p>
<b>Preamble.</b> The goal of this license is that Modelica related
model libraries, software, images, documents, data files etc. can be
used freely in the original or a modified form, in open source and in
commercial environments (as long as the license conditions below are
fulfilled, in particular sections 2c) and 2d). The Original Work is
provided free of charge and the use is completely at your own risk.
</p>

<p><b>1. Definitions.</b></p>
<ol>
 <li>&ldquo;License&rdquo; is this Modelica License.</li>

 <li>
 &ldquo;Original Work&rdquo; is any work of authorship, including
 software, images, documents, data files, that contains the above
 licensing notice or that is packed together with a licensing notice
 referencing it.</li>

 <li>
 &ldquo;Licensor&rdquo; is the provider of the Original Work who has
 placed this licensing notice adjacent to the copyright notice(s) for
 the Original Work. The Original Work is either directly provided by
 the owner of the Original Work, or by a licensee of the owner.</li>

 <li>
 &ldquo;Derivative Work&rdquo; is any modification of the Original
 Work which represents, as a whole, an original work of authorship.
 For the matter of clarity and as examples: </li>

 <ol>
  <li>
  Derivative Work shall not include work that remains separable from
  the Original Work, as well as merely extracting a part of the
  Original Work without modifying it.</li>

  <li>
  Derivative Work shall not include (a) fixing of errors and/or (b)
  adding vendor specific Modelica annotations and/or (c) using a
  subset of the classes of a Modelica package, and/or (d) using a
  different representation, e.g., a binary representation.</li>

  <li>
  Derivative Work shall include classes that are copied from the
  Original Work where declarations, equations or the documentation
  are modified.</li>

  <li>
  Derivative Work shall include executables to simulate the models
  that are generated by a Modelica translator based on the Original
  Work (of a Modelica package).</li>
 </ol>

 <li>
 &ldquo;Modified Work&rdquo; is any modification of the Original Work
 with the following exceptions: (a) fixing of errors and/or (b)
 adding vendor specific Modelica annotations and/or (c) using a
 subset of the classes of a Modelica package, and/or (d) using a
 different representation, e.g., a binary representation.</li>

 <li>
 &quot;Source Code&quot; means the preferred form of the Original
 Work for making modifications to it and all available documentation
 describing how to modify the Original Work.</li>

 <li>
 &ldquo;You&rdquo; means an individual or a legal entity exercising
 rights under, and complying with all of the terms of, this License.</li>

 <li>
 &ldquo;Modelica package&rdquo; means any Modelica library that is
 defined with the<br>&ldquo;<font face=\"Courier New, monospace\"><font size=2 style=\"font-size: 9pt\"><b>package</b></font></font><font face=\"Courier New, monospace\"><font size=2 style=\"font-size: 9pt\">
 &lt;Name&gt; ... </font></font><font face=\"Courier New, monospace\"><font size=2 style=\"font-size: 9pt\"><b>end</b></font></font><font face=\"Courier New, monospace\"><font size=2 style=\"font-size: 9pt\">
 &lt;Name&gt;;</font></font>&ldquo; Modelica language element.</li>
</ol>

<p>
<b>2. Grant of Copyright License.</b> Licensor grants You a
worldwide, royalty-free, non-exclusive, sublicensable license, for
the duration of the copyright, to do the following:</p>

<ol>
 <li><p>
 To reproduce the Original Work in copies, either alone or as part of
 a collection.</li></p>
 <li><p>
 To create Derivative Works according to Section 1d) of this License.</li></p>
 <li><p>
 To distribute or communicate to the public copies of the <u>Original
 Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No
 fee, neither as a copyright-license fee, nor as a selling fee for
 the copy as such may be charged under this License. Furthermore, a
 verbatim copy of this License must be included in any copy of the
 Original Work or a Derivative Work under this License.<br>      For
 the matter of clarity, it is permitted A) to distribute or
 communicate such copies as part of a (possible commercial)
 collection where other parts are provided under different licenses
 and a license fee is charged for the other parts only and B) to
 charge for mere printing and shipping costs.</li></p>
 <li><p>
 To distribute or communicate to the public copies of a <u>Derivative
 Work</u>, alternatively to Section 2c), under <u>any other license</u>
 of your choice, especially also under a license for
 commercial/proprietary software, as long as You comply with Sections
 3, 4 and 8 below. <br>      For the matter of clarity, no
 restrictions regarding fees, either as to a copyright-license fee or
 as to a selling fee for the copy as such apply.</li></p>
 <li><p>
 To perform the Original Work publicly.</li></p>
 <li><p>
 To display the Original Work publicly.</li></p>
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
with You.</b></u><b> </b>This disclaimer of warranty constitutes an
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
<ol>
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

<p>
<br>
</p>

<hr>

<h4><a name=\"2. Frequently Asked Questions|outline\"></a>
Frequently Asked Questions</h4>
<p>This
section contains questions/answer to users and/or distributors of
Modelica packages and/or documents under Modelica License 2. Note,
the answers to the questions below are not a legal interpretation of
the Modelica License 2. In case of a conflict, the language of the
license shall prevail.</p>

<p><br>
</p>

<p><font color=\"#008000\"><font size=3><b>Using
or Distributing a Modelica </b></font></font><font color=\"#008000\"><font size=3><u><b>Package</b></u></font></font><font color=\"#008000\"><font size=3><b>
under the Modelica License 2</b></font></font></p>

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
 besides a reasonable fee for distribution and support<span lang=\"en-GB\">&ldquo;.
 Version 2 has a </span>similar intention for all Original Work under
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

<p><br>
</p>
<p><font color=\"#008000\"><font size=3><b>Using
or Distributing a Modelica </b></font></font><font color=\"#008000\"><font size=3><u><b>Document</b></u></font></font><font color=\"#008000\"><font size=3><b>
under the Modelica License 2</b></font></font></p>

<p>This
section is devoted especially for the following applications:</p>
<ol>
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
     with Hilding Elmqvist from Dassault Systèmes Lund.</li>

<li> Sven Erik Mattsson from Dassault Systèmes Lund developed the first
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


extends Modelica.Icons.Package;


  package Examples
  "Library of examples to demonstrate the usage of package Modelica_Synchronous"
    extends Modelica.Icons.ExamplesPackage;

    package SimpleControlledDrive
    "Examples based on a simple controlled drive with different ways to define the sampling"
    extends Modelica.Icons.ExamplesPackage;

      model Continuous "Simple controlled drive with continuous controller"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{80,0},{100,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={110,-15})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-111,0},{-91,20}})));

        Modelica.Blocks.Continuous.PI PI(
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=0,
          T=0.1,
          k=110)
          annotation (Placement(transformation(extent={{-12,0},{8,20}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-43,0},{-23,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{53,0},{73,20}})));

      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{108,-5},{108,10},{100,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback.y, PI.u) annotation (Line(
            points={{-24,10},{-14,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{73,10},{80,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ramp.y, feedback.u1) annotation (Line(
            points={{-90,10},{-41,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, torque.tau) annotation (Line(
            points={{9,10},{51,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, feedback.u2) annotation (Line(
            points={{108,-21.8},{108,-26},{-33,-26},{-33,2}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-140,-100},
                  {140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-35,39},{15,33}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{54,39},{104,33}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-120,40},{-70,-20}}, lineColor={255,0,0}),
              Text(
                extent={{-119,39},{-71,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-46,40},{18,-34}}, lineColor={255,0,0}),
              Rectangle(extent={{40,40},{120,-34}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(
            StopTime=5));
      end Continuous;

      model ClockedWithDiscreteTextbookController
      "Simple controlled drive with discrete textbook controller (period is not used in the controller)"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{87,0},{107,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={117,-15})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-111,0},{-91,20}})));

        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-43,0},{-23,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{60,0},{80,20}})));

        Modelica_Synchronous.RealSignals.Periodic.PI
                                             PI(
          Td=1,
          x(fixed=true),
          kd=110)
          annotation (Placement(transformation(extent={{-14,0},{6,20}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked        sample2
          annotation (Placement(transformation(extent={{-68,4},{-56,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold         hold1
          annotation (Placement(transformation(extent={{26,4},{38,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                           sample1
          annotation (Placement(transformation(extent={{38,-38},{26,-26}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                               periodicClock(period=0.1)
        annotation (Placement(transformation(extent={{-106,-46},{-94,-34}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{115,-5},{115,10},{107,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{80,10},{87,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback.y, PI.u) annotation (Line(
            points={{-24,10},{-16,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ramp.y, sample2.u) annotation (Line(
            points={{-90,10},{-69.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback.u1) annotation (Line(
            points={{-55.4,10},{-41,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{7,10},{24.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{38.6,10},{58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.u, speed.w) annotation (Line(
            points={{39.2,-32},{115,-32},{115,-21.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.u2, sample1.y) annotation (Line(
            points={{-33,2},{-34,2},{-34,-32},{25.4,-32}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(periodicClock.y, sample2.clock) annotation (Line(
          points={{-93.4,-40},{-62,-40},{-62,2.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,
                -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-41,39},{9,33}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{54,39},{104,33}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-120,40},{-80,-20}}, lineColor={255,0,0}),
              Text(
                extent={{-125,39},{-77,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-46,40},{14,-48}}, lineColor={255,0,0}),
              Rectangle(extent={{50,40},{132,-48}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(
            StopTime=5));
      end ClockedWithDiscreteTextbookController;

      model ClockedWithDiscreteController
      "Simple controlled drive with discrete controller (period is used in the controller)"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{67,0},{87,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={94,-7})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-100,0},{-80,20}})));

        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-47,0},{-27,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{40,0},{60,20}})));

        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                            sample2
          annotation (Placement(transformation(extent={{-66,4},{-54,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold         hold1
          annotation (Placement(transformation(extent={{14,4},{26,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample         sample1
          annotation (Placement(transformation(extent={{26,-26},{14,-14}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                   PI(
          x(fixed=true),
          T=0.1,
          k=110)
          annotation (Placement(transformation(extent={{-18,0},{2,20}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                               periodicClock(period=0.1)
        annotation (Placement(transformation(extent={{-98,-36},{-86,-24}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{92,3},{92,10},{87,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{60,10},{67,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ramp.y, sample2.u) annotation (Line(
            points={{-79,10},{-67.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback.u1) annotation (Line(
            points={{-53.4,10},{-45,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{26.6,10},{38,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{92,-13.8},{92,-20},{27.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback.u2) annotation (Line(
            points={{13.4,-20},{-37,-20},{-37,2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, PI.u) annotation (Line(
            points={{-28,10},{-20,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{3,10},{12.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(periodicClock.y, sample2.clock) annotation (Line(
          points={{-85.4,-30},{-60,-30},{-60,2.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,
                -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-41,37},{9,31}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{40,37},{90,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-108,40},{-74,-8}},  lineColor={255,0,0}),
              Text(
                extent={{-113,37},{-65,31}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-50,40},{6,-40}},  lineColor={255,0,0}),
              Rectangle(extent={{32,40},{104,-40}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(
            StopTime=3));
      end ClockedWithDiscreteController;

      model ExactlyClockedWithDiscreteController
      "Simple controlled drive with discrete controller and exact periodic clocks (period is used in the controller)"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{87,0},{107,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={117,-15})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-111,0},{-91,20}})));

        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-43,0},{-23,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{60,0},{80,20}})));

        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                            sample2
          annotation (Placement(transformation(extent={{-68,4},{-56,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold         hold1
          annotation (Placement(transformation(extent={{26,4},{38,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample         sample1
          annotation (Placement(transformation(extent={{38,-36},{26,-24}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                   PI(
          x(fixed=true),
          T=0.1,
          k=110)
          annotation (Placement(transformation(extent={{-14,0},{6,20}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock
                                periodicClock(factor=100, resolution=
            Modelica_Synchronous.Types.Resolution.ms)
        annotation (Placement(transformation(extent={{-100,-46},{-88,-34}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{115,-5},{115,10},{107,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{80,10},{87,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ramp.y, sample2.u) annotation (Line(
            points={{-90,10},{-69.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback.u1) annotation (Line(
            points={{-55.4,10},{-41,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{38.6,10},{58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{115,-21.8},{115,-30},{39.2,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback.u2) annotation (Line(
            points={{25.4,-30},{-33,-30},{-33,2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, PI.u) annotation (Line(
            points={{-24,10},{-16,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{7,10},{24.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(periodicClock.y, sample2.clock) annotation (Line(
          points={{-87.4,-40},{-62,-40},{-62,2.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,
                -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-41,39},{9,33}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{54,39},{104,33}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-120,40},{-80,-20}}, lineColor={255,0,0}),
              Text(
                extent={{-125,39},{-77,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-46,40},{14,-48}}, lineColor={255,0,0}),
              Rectangle(extent={{50,40},{132,-48}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(StopTime=5));
      end ExactlyClockedWithDiscreteController;

      model ClockedWithDiscretizedContinuousController
      "Simple controlled drive with discretized continuous-time controller"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{69,0},{89,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={97,-9})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-101,0},{-81,20}})));

        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-47,0},{-27,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{42,0},{62,20}})));

        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                            sample2
          annotation (Placement(transformation(extent={{-66,4},{-54,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold         hold1
          annotation (Placement(transformation(extent={{20,4},{32,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample         sample1
          annotation (Placement(transformation(extent={{30,-26},{18,-14}})));
        Modelica.Blocks.Continuous.PI PI(
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=0,
          T=0.1,
          k=110)
          annotation (Placement(transformation(extent={{-20,0},{0,20}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                               periodicClock(
        period=0.1,
        useSolver=true,
        solverMethod="ImplicitEuler")
        annotation (Placement(transformation(extent={{-94,-32},{-82,-20}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{95,1},{95,10},{89,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{62,10},{69,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ramp.y, sample2.u) annotation (Line(
            points={{-80,10},{-67.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback.u1) annotation (Line(
            points={{-53.4,10},{-45,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{32.6,10},{40,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{95,-15.8},{95,-20},{31.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback.u2) annotation (Line(
            points={{17.4,-20},{-37,-20},{-37,2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, PI.u)  annotation (Line(
            points={{-28,10},{-22,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u)  annotation (Line(
            points={{1,10},{18.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(periodicClock.y, sample2.clock) annotation (Line(
          points={{-81.4,-26},{-60,-26},{-60,2.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,
                -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-41,37},{9,31}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{46,37},{96,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-106,40},{-72,-10}}, lineColor={255,0,0}),
              Text(
                extent={{-113,37},{-65,31}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-50,40},{14,-40}}, lineColor={255,0,0}),
              Rectangle(extent={{36,40},{108,-40}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(
            StopTime=5));
      end ClockedWithDiscretizedContinuousController;

      model ClockedWith_AD_DA_Effects
      "Simple controlled drive with discrete controller and simulated AD and DA effects"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{87,0},{107,20}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-10,-10},{6,6}},
              rotation=-90,
              origin={117,-15})));
        Modelica.Blocks.Sources.Ramp ramp(duration=2)
          annotation (Placement(transformation(extent={{-111,0},{-91,20}})));

        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-43,0},{-23,20}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{60,0},{80,20}})));

        Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects
                                                            sample2(
          limited=true,
          quantized=true,
          yMax=10,
          bits=16)
          annotation (Placement(transformation(extent={{-68,4},{-56,16}})));
        Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects
                                                              hold1(
          computationalDelay=true,
          resolution=10,
          shiftCounter=2,
          limited=true,
          quantized=true,
          yMax=9.5,
          yMin=-9.5,
          bits=16)
          annotation (Placement(transformation(extent={{26,4},{38,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects
                                                                sample1(noisy=
              true, noise(noiseMax=0.01))
          annotation (Placement(transformation(extent={{38,-36},{26,-24}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                   PI(
          x(fixed=true),
          T=0.1,
          k=110)
          annotation (Placement(transformation(extent={{-14,0},{6,20}})));
        Modelica_Synchronous.RealSignals.Sampler.AssignClock
                                                assignClock1
          annotation (Placement(transformation(extent={{8,-36},{-4,-24}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                               periodicClock(period=0.1)
        annotation (Placement(transformation(extent={{-54,-74},{-42,-62}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{115,-5},{115,10},{107,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{80,10},{87,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ramp.y, sample2.u) annotation (Line(
            points={{-90,10},{-69.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback.u1) annotation (Line(
            points={{-55.4,10},{-41,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{38.6,10},{58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{115,-21.8},{115,-30},{39.2,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, PI.u) annotation (Line(
            points={{-24,10},{-16,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{7,10},{24.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, assignClock1.u) annotation (Line(
            points={{25.4,-30},{9.2,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(assignClock1.y, feedback.u2) annotation (Line(
            points={{-4.6,-30},{-33,-30},{-33,2}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(periodicClock.y, assignClock1.clock) annotation (Line(
          points={{-41.4,-68},{-22,-68},{-22,-68},{2,-68},{2,-37.2}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,
                -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-41,39},{9,33}},
                lineColor={255,0,0},
                textString="feedback controller"),
              Text(
                extent={{54,39},{104,33}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-120,40},{-80,-20}}, lineColor={255,0,0}),
              Text(
                extent={{-125,39},{-77,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-46,40},{14,-48}}, lineColor={255,0,0}),
              Rectangle(extent={{50,40},{132,-48}}, lineColor={255,0,0})}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(
            StopTime=5));
      end ClockedWith_AD_DA_Effects;
    end SimpleControlledDrive;

    package CascadeControlledDrive
    "Examples based on a simple drive with cascade controller and different ways to define the sampling and super-sampling"
      extends Modelica.Icons.ExamplesPackage;

      model Continuous "Drive with continuous-time cascade controller"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{88,2},{104,18}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-7.5,-7.5},{4.5,4.5}},
              rotation=-90,
              origin={111.5,-11.5})));

        Modelica.Blocks.Continuous.PI PI(
          k=100,
          initType=Modelica.Blocks.Types.Init.InitialState,
          x_start=0,
          T=0.5)
          annotation (Placement(transformation(extent={{14,0},{34,20}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (Placement(transformation(extent={{-12,2},{4,18}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{64,2},{81,18}})));

        Modelica.Mechanics.Rotational.Sensors.AngleSensor angle annotation (
            Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=90,
              origin={128,-10})));
        Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP(
          q_end={Modelica.Constants.pi},
          qd_max={2},
          qdd_max={3})
          annotation (Placement(transformation(extent={{-134,0},{-114,20}})));
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent={{-82,2},{-66,18}})));
        Modelica.Blocks.Math.Gain gain(k=20)
          annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{110,-4},{110,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback2.y, PI.u)
                                  annotation (Line(
            points={{3.2,10},{12,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{81,10},{88,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angle.flange, load.flange_b) annotation (Line(
            points={{128,-4},{128,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(PI.y, torque.tau) annotation (Line(
            points={{35,10},{62.3,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, feedback2.u2) annotation (Line(
            points={{110,-16.6},{110,-30},{-4,-30},{-4,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(angle.phi, feedback1.u2) annotation (Line(
            points={{128,-16.6},{128,-46},{-74,-46},{-74,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(kinematicPTP.q[1], feedback1.u1) annotation (Line(
            points={{-113,18},{-100,18},{-100,10},{-80.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback1.y, gain.u) annotation (Line(
            points={{-66.8,10},{-58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, feedback2.u1) annotation (Line(
            points={{-35,10},{-10.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-140,
                  -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-12,38},{38,32}},
                lineColor={255,0,0},
                textString="fast controller"),
              Text(
                extent={{66,37},{116,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-138,40},{-110,-20}},lineColor={255,0,0}),
              Text(
                extent={{-142,38},{-103,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-92,40},{-28,-68}},lineColor={255,0,0}),
              Rectangle(extent={{-14,40},{38,-68}}, lineColor={255,0,0}),
              Rectangle(extent={{56,40},{134,-68}}, lineColor={255,0,0}),
              Text(
                extent={{-89,38},{-39,32}},
                lineColor={255,0,0},
                textString="slow controller")}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(StopTime=4));
      end Continuous;

      model SubClocked
      "Drive with clocked cascade controller where clocks are defined with sub-sampling and partitions with super-sampling"
       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{88,2},{104,18}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-7.5,-7.5},{4.5,4.5}},
              rotation=-90,
              origin={111.5,-11.5})));

        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                                      PI(
          k=100,
          T=0.5,
          x(fixed=true))
          annotation (Placement(transformation(extent={{14,0},{34,20}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (Placement(transformation(extent={{-12,2},{4,18}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{64,2},{81,18}})));

        Modelica.Mechanics.Rotational.Sensors.AngleSensor angle annotation (
            Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=90,
              origin={128,-10})));
        Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP(
          q_end={Modelica.Constants.pi},
          qd_max={2},
          qdd_max={3})
          annotation (Placement(transformation(extent={{-136,-8},{-116,12}})));
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent={{-82,2},{-66,18}})));
        Modelica.Blocks.Math.Gain gain(k=20)
          annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample1
          annotation (Placement(transformation(extent={{52,-26},{40,-14}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                           sample2
          annotation (Placement(transformation(extent={{-42,-46},{-54,-34}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold
                                         hold1
          annotation (Placement(transformation(extent={{42,4},{54,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample3
          annotation (Placement(transformation(extent={{-104,4},{-92,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSample
                                                super1(
            inferFactor=true)
          annotation (Placement(transformation(extent={{-28,4},{-16,16}})));
        Modelica_Synchronous.ClockSignals.Sampler.SubSample
                                               subSample1(factor=5)
          annotation (Placement(transformation(extent={{16,-76},{4,-64}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                                 periodicRealClock(period=0.02)
          annotation (Placement(transformation(extent={{78,-76},{66,-64}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{110,-4},{110,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback2.y, PI.u)
                                  annotation (Line(
            points={{3.2,10},{12,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{81,10},{88,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angle.flange, load.flange_b) annotation (Line(
            points={{128,-4},{128,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback1.y, gain.u) annotation (Line(
            points={{-66.8,10},{-58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{110,-16.6},{110,-20},{53.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(angle.phi, sample2.u) annotation (Line(
            points={{128,-16.6},{128,-40},{-40.8,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback2.u2) annotation (Line(
            points={{39.4,-20},{-4,-20},{-4,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback1.u2) annotation (Line(
            points={{-54.6,-40},{-74,-40},{-74,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{35,10},{40.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{54.6,10},{62.3,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample3.y, feedback1.u1) annotation (Line(
            points={{-91.4,10},{-80.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(kinematicPTP.q[1], sample3.u) annotation (Line(
            points={{-115,10},{-105.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, super1.u) annotation (Line(
            points={{-35,10},{-29.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(super1.y, feedback2.u1) annotation (Line(
            points={{-15.4,10},{-10.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(subSample1.y, sample3.clock) annotation (Line(
            points={{3.4,-70},{-98,-70},{-98,2.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(periodicRealClock.y, sample1.clock) annotation (Line(
            points={{65.4,-70},{46,-70},{46,-27.2}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(periodicRealClock.y, subSample1.u) annotation (Line(
            points={{65.4,-70},{17.2,-70}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-140,
                  -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-12,38},{38,32}},
                lineColor={255,0,0},
                textString="fast controller"),
              Text(
                extent={{66,37},{116,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-138,40},{-110,-20}},lineColor={255,0,0}),
              Text(
                extent={{-142,38},{-103,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-86,40},{-32,-52}},lineColor={255,0,0}),
              Rectangle(extent={{-14,40},{38,-52}}, lineColor={255,0,0}),
              Rectangle(extent={{56,40},{136,-52}}, lineColor={255,0,0}),
              Text(
                extent={{-83,38},{-33,32}},
                lineColor={255,0,0},
                textString="slow controller")}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(StopTime=4));
      end SubClocked;

      model SuperSampled
      "Drive with clocked cascade controller where fastest partition is defined with a clock and slower partition is defined with super-sampling"

       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{88,2},{104,18}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-7.5,-7.5},{4.5,4.5}},
              rotation=-90,
              origin={111.5,-11.5})));

        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                                      PI(
          k=100,
          T=0.5,
          x(fixed=true))
          annotation (Placement(transformation(extent={{14,0},{34,20}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (Placement(transformation(extent={{-12,2},{4,18}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{64,2},{81,18}})));

        Modelica.Mechanics.Rotational.Sensors.AngleSensor angle annotation (
            Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=90,
              origin={128,-10})));
        Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP(
          q_end={Modelica.Constants.pi},
          qd_max={2},
          qdd_max={3})
          annotation (Placement(transformation(extent={{-134,0},{-114,20}})));
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent={{-82,2},{-66,18}})));
        Modelica.Blocks.Math.Gain gain(k=20)
          annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample1
          annotation (Placement(transformation(extent={{52,-26},{40,-14}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                           sample2
          annotation (Placement(transformation(extent={{18,-46},{6,-34}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold
                                         hold1
          annotation (Placement(transformation(extent={{42,4},{54,16}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                                    sample3
          annotation (Placement(transformation(extent={{-100,4},{-88,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSample
                                                super1(factor=5, inferFactor=false)
          annotation (Placement(transformation(extent={{-28,4},{-16,16}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                                 periodicRealClock(period=0.02)
          annotation (Placement(transformation(extent={{76,-72},{64,-60}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{110,-4},{110,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback2.y, PI.u)
                                  annotation (Line(
            points={{3.2,10},{12,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{81,10},{88,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angle.flange, load.flange_b) annotation (Line(
            points={{128,-4},{128,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback1.y, gain.u) annotation (Line(
            points={{-66.8,10},{-58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{110,-16.6},{110,-20},{53.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(angle.phi, sample2.u) annotation (Line(
            points={{128,-16.6},{128,-40},{19.2,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback2.u2) annotation (Line(
            points={{39.4,-20},{-4,-20},{-4,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback1.u2) annotation (Line(
            points={{5.4,-40},{-74,-40},{-74,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{35,10},{40.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{54.6,10},{62.3,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample3.y, feedback1.u1) annotation (Line(
            points={{-87.4,10},{-80.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(kinematicPTP.q[1], sample3.u) annotation (Line(
            points={{-113,18},{-106,18},{-106,10},{-101.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, super1.u) annotation (Line(
            points={{-35,10},{-29.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(super1.y, feedback2.u1) annotation (Line(
            points={{-15.4,10},{-10.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicRealClock.y, sample1.clock) annotation (Line(
            points={{63.4,-66},{46,-66},{46,-27.2}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-140,
                  -100},{140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-12,38},{38,32}},
                lineColor={255,0,0},
                textString="fast controller"),
              Text(
                extent={{66,37},{116,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-138,40},{-110,-20}},lineColor={255,0,0}),
              Text(
                extent={{-142,38},{-103,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-86,40},{-32,-48}},lineColor={255,0,0}),
              Rectangle(extent={{-14,40},{38,-48}}, lineColor={255,0,0}),
              Rectangle(extent={{56,40},{134,-48}}, lineColor={255,0,0}),
              Text(
                extent={{-83,38},{-33,32}},
                lineColor={255,0,0},
                textString="slow controller")}),
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(StopTime=4));
      end SuperSampled;

      model AbsoluteClocks
      "Drive with clocked cascade controller where all partitions are defined with exact (integer) clock that need to be compatible to each other"

       extends Modelica.Icons.Example;

        Modelica.Mechanics.Rotational.Components.Inertia load(J=10,
          phi(fixed=true, start=0),
          w(fixed=true, start=0))
          annotation (Placement(transformation(extent={{88,2},{104,18}})));
        Modelica.Mechanics.Rotational.Sensors.SpeedSensor speed       annotation (
           Placement(transformation(
              extent={{-7.5,-7.5},{4.5,4.5}},
              rotation=-90,
              origin={111.5,-11.5})));

        Modelica_Synchronous.RealSignals.NonPeriodic.PI
                                      PI(
          k=100,
          T=0.5,
          x(fixed=true))
          annotation (Placement(transformation(extent={{14,0},{34,20}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (Placement(transformation(extent={{-12,2},{4,18}})));

        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{64,2},{81,18}})));

        Modelica.Mechanics.Rotational.Sensors.AngleSensor angle annotation (
            Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=90,
              origin={128,-10})));
        Modelica.Blocks.Sources.KinematicPTP2 kinematicPTP(
          q_end={Modelica.Constants.pi},
          qd_max={2},
          qdd_max={3})
          annotation (Placement(transformation(extent={{-134,0},{-114,20}})));
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent={{-82,2},{-66,18}})));
        Modelica.Blocks.Math.Gain gain(k=20)
          annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample1
          annotation (Placement(transformation(extent={{52,-26},{40,-14}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                           sample2
          annotation (Placement(transformation(extent={{-46,-46},{-58,-34}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold
                                         hold1
          annotation (Placement(transformation(extent={{42,4},{54,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample3
          annotation (Placement(transformation(extent={{-100,4},{-88,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSample
                                                super1(inferFactor=true)
          annotation (Placement(transformation(extent={{-28,4},{-16,16}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock
                                  slowClock(factor=100, resolution=
            Modelica_Synchronous.Types.Resolution.ms)   annotation (Placement(
              transformation(extent={{-128,-74},{-116,-62}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock
                                  fastClock(factor=20, resolution=
            Modelica_Synchronous.Types.Resolution.ms)
          annotation (Placement(transformation(extent={{22,-76},{34,-64}})));
      equation
        connect(speed.flange, load.flange_b)       annotation (Line(
            points={{110,-4},{110,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback2.y, PI.u)
                                  annotation (Line(
            points={{3.2,10},{12,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque.flange, load.flange_a) annotation (Line(
            points={{81,10},{88,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angle.flange, load.flange_b) annotation (Line(
            points={{128,-4},{128,10},{104,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(feedback1.y, gain.u) annotation (Line(
            points={{-66.8,10},{-58,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speed.w, sample1.u) annotation (Line(
            points={{110,-16.6},{110,-20},{53.2,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(angle.phi, sample2.u) annotation (Line(
            points={{128,-16.6},{128,-40},{-44.8,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback2.u2) annotation (Line(
            points={{39.4,-20},{-4,-20},{-4,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, feedback1.u2) annotation (Line(
            points={{-58.6,-40},{-74,-40},{-74,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(PI.y, hold1.u) annotation (Line(
            points={{35,10},{40.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, torque.tau) annotation (Line(
            points={{54.6,10},{62.3,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample3.y, feedback1.u1) annotation (Line(
            points={{-87.4,10},{-80.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(kinematicPTP.q[1], sample3.u) annotation (Line(
            points={{-113,18},{-106,18},{-106,10},{-101.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(gain.y, super1.u) annotation (Line(
            points={{-35,10},{-29.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(super1.y, feedback2.u1) annotation (Line(
            points={{-15.4,10},{-10.4,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(slowClock.y, sample3.clock) annotation (Line(
            points={{-115.4,-68},{-94,-68},{-94,2.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(fastClock.y, sample1.clock) annotation (Line(
            points={{34.6,-70},{46,-70},{46,-27.2}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,-100},
                  {140,100}},
              grid={2,2}), graphics={
              Text(
                extent={{-12,38},{38,32}},
                lineColor={255,0,0},
                textString="fast controller"),
              Text(
                extent={{66,37},{116,31}},
                lineColor={255,0,0},
                textString="plant"),
              Rectangle(extent={{-138,40},{-110,-20}},lineColor={255,0,0}),
              Text(
                extent={{-142,38},{-103,33}},
                lineColor={255,0,0},
                textString="reference"),
              Rectangle(extent={{-86,40},{-32,-48}},lineColor={255,0,0}),
              Rectangle(extent={{-14,40},{38,-48}}, lineColor={255,0,0}),
              Rectangle(extent={{56,40},{134,-48}}, lineColor={255,0,0}),
              Text(
                extent={{-83,38},{-33,32}},
                lineColor={255,0,0},
                textString="slow controller")}),
         Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2})),
          Documentation(info="<HTML>
</HTML>"),experiment(StopTime=4));
      end AbsoluteClocks;

    end CascadeControlledDrive;

    package Effects "Examples demonstrating specific effects"
        extends Modelica.Icons.ExamplesPackage;
      model SuperSampling "Different ways to super sample a signal"
      extends Modelica.Icons.Example;
        parameter Integer factor=4 "Super sampling factor";

        Modelica.Blocks.Sources.Sine sine(freqHz=2,
          offset=0.1,
          startTime=0.0)
          annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSample
                                                superSample1(inferFactor=false, factor=
              factor) annotation (Placement(transformation(extent={{24,34},{36,46}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                  sample1
          annotation (Placement(transformation(extent={{-24,4},{-12,16}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                                 periodicRealClock(period=0.02)
          annotation (Placement(transformation(extent={{-54,-34},{-42,-22}})));
        Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample
                                                       upSample1(
            inferFactor=false, factor=factor)
          annotation (Placement(transformation(extent={{22,4},{34,16}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated
          superSampleIpo1(inferFactor=false, factor=factor)
          annotation (Placement(transformation(extent={{24,-26},{36,-14}})));
        Modelica_Synchronous.RealSignals.Periodic.MovingAverage
                               movingAverage(n=factor)
          annotation (Placement(transformation(extent={{58,-30},{78,-10}})));
      equation
        connect(sine.y, sample1.u) annotation (Line(
            points={{-39,10},{-25.2,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicRealClock.y, sample1.clock) annotation (Line(
            points={{-41.4,-28},{-18,-28},{-18,2.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample1.y, superSample1.u) annotation (Line(
            points={{-11.4,10},{0,10},{0,40},{22.8,40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, upSample1.u)
                                       annotation (Line(
            points={{-11.4,10},{20.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, superSampleIpo1.u)
                                           annotation (Line(
            points={{-11.4,10},{0,10},{0,-20},{22.8,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(superSampleIpo1.y, movingAverage.u) annotation (Line(
            points={{36.6,-20},{56,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                            graphics),
          experiment(StopTime=0.5));
      end SuperSampling;
    end Effects;

    package Systems "Examples of complete systems"
      extends Modelica.Icons.ExamplesPackage;

      model ControlledMixingUnit
         extends Modelica.Icons.Example;
      import SI = Modelica.SIunits;

        parameter SI.Frequency freq = 1/300 "Critical frequency of filter";
        parameter Real c0(unit="mol/l") = 0.848 "Nominal concentration";
        parameter SI.Temperature T0 = 308.5 "Nominal temperature";
        parameter Real a1_inv =  0.2674;
        parameter Real a21_inv = 1.815;
        parameter Real a22_inv = 0.4682;
        parameter Real b_inv =   1.5476;
        parameter Real k0_inv =  1.05e14;
        parameter Real eps = 34.2894;

        parameter Real x10 = 0.42;
        parameter Real x10_inv = 0.6;
        parameter Real x20 = 0.01;
        parameter Real u0 = -0.0224;

        final parameter Real c_start(unit="mol/l") = c0*(1-x10);
        final parameter Real c_inv_start(unit="mol/l") = c0*(1-x10_inv);
        final parameter SI.Temperature T_start = T0*(1+x20);
        final parameter Real c_high_start(unit="mol/l") = c0*(1-0.72);
        final parameter Real T_c_start = T0*(1+u0);

        parameter Real pro=1.5
        "Deviations of plant to inverse plant parameters";
        final parameter Real a1=a1_inv*pro;
        final parameter Real a21=a21_inv*pro;
        final parameter Real a22=a22_inv*pro;
        final parameter Real b=b_inv*pro;
        final parameter Real k0=k0_inv*pro;

        Utilities.ComponentsMixingUnit.MixingUnit invMixingUnit(
          c0= c0,
          T0= T0,
          a1= a1_inv,
          a21=a21_inv,
          a22=a22_inv,
          b = b_inv,
          k0= k0_inv,
          eps=eps,
          c(start=c_start, fixed=true),
          T(start=T_start,
            fixed=true,
            stateSelect=StateSelect.always),
          T_c(start=T_c_start, fixed=true))
          annotation (Placement(transformation(extent={{-12,14},{-32,34}},
                rotation=0)));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{40,-18},{56,-2}})));
        Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
          annotation (Placement(transformation(extent={{-54,8},{-2,40}})));
        Utilities.ComponentsMixingUnit.MixingUnit   mixingUnit(
          c(start=c_start, fixed=true),
          T(start=T_start, fixed=true),
          c0= c0,
          T0= T0,
          a1= a1,
          a21=a21,
          a22=a22,
          b = b,
          k0= k0,
          eps=eps)
          annotation (Placement(transformation(extent={{88,-20},{108,0}},rotation=
                 0)));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{-24,-20},{-4,0}},
                rotation=0)));
        Modelica.Blocks.Sources.Step step(height=c_high_start - c_start, offset=
              c_start)
          annotation (Placement(transformation(extent={{-138,14},{-118,34}},
                rotation=0)));
        Modelica.Blocks.Math.Gain gain(k=20) annotation (Placement(transformation(
                extent={{4,-20},{24,0}},  rotation=0)));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                                           sample1
          annotation (Placement(transformation(extent={{54,-46},{42,-34}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold
                                         hold1
          annotation (Placement(transformation(extent={{64,-16},{76,-4}})));
        Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                           sample2
          annotation (Placement(transformation(extent={{-108,18},{-96,30}})));
        Modelica.Blocks.Continuous.Filter filter(
          order=3,
          f_cut=freq,
          init=Modelica.Blocks.Types.Init.NoInit,
          analogFilter=Modelica.Blocks.Types.AnalogFilter.CriticalDamping)
          annotation (Placement(transformation(extent={{-86,14},{-66,34}})));
        Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock
                                 periodicRealClock(
          period=1,
          solverMethod="ExplicitEuler",
          useSolver=true)
          annotation (Placement(transformation(extent={{-134,-16},{-122,-4}})));
      initial equation
        filter.x[1]=0.497522;
        invMixingUnit.c = mixingUnit.c;

      equation
        connect(feedback.y, gain.u) annotation (Line(points={{-5,-10},{-5,-10},
                {2,-10}},
              color={0,0,127}));
        connect(gain.y, add.u2) annotation (Line(
            points={{25,-10},{32,-10},{32,-14.8},{38.4,-14.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(inverseBlockConstraints.y2, invMixingUnit.T_c) annotation (Line(
            points={{-5.9,24},{-10,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(invMixingUnit.c, inverseBlockConstraints.u2) annotation (Line(
            points={{-34,30},{-38,30},{-38,24},{-48.8,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mixingUnit.T, sample1.u) annotation (Line(
            points={{110,-16},{116,-16},{116,-40},{55.2,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, feedback.u2) annotation (Line(
            points={{41.4,-40},{-14,-40},{-14,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, hold1.u) annotation (Line(
            points={{56.8,-10},{62.8,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, mixingUnit.T_c) annotation (Line(
            points={{76.6,-10},{86,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.u, step.y) annotation (Line(
            points={{-109.2,24},{-117,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(invMixingUnit.T, feedback.u1) annotation (Line(
            points={{-34,18},{-46,18},{-46,-10},{-22,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(inverseBlockConstraints.y1, add.u1) annotation (Line(
            points={{-0.7,24},{28,24},{28,-5.2},{38.4,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample2.y, filter.u) annotation (Line(
            points={{-95.4,24},{-88,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(filter.y, inverseBlockConstraints.u1) annotation (Line(
            points={{-65,24},{-56.6,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicRealClock.y, sample2.clock) annotation (Line(
            points={{-121.4,-10},{-102,-10},{-102,16.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                  -100},{120,100}}),      graphics),
          experiment(StopTime=300),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}})));
      end ControlledMixingUnit;

      model EngineThrottleControl
       extends Modelica.Icons.Example;

        Modelica.Blocks.Sources.Step crankshaftSpeedRef(
          startTime=5,
          offset=207.34,
          height=103.67)
          annotation (Placement(transformation(extent={{-90,-4},{-70,16}})));
        Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.SpeedControl
          speedControl
          annotation (Placement(transformation(extent={{-32,-15},{0,15}})));
        Modelica_Synchronous.RealSignals.Sampler.Sample
                       sample1
          annotation (Placement(transformation(extent={{-60,-1},{-46,13}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold
                     hold1(y_start=8.9)
          annotation (Placement(transformation(extent={{8,-6},{20,6}})));
        Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.CrankshaftPositionEvent
          triggeredSpeed
          annotation (Placement(transformation(extent={{18,-60},{-2,-40}})));
        Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.Engine2
          engine
          annotation (Placement(transformation(extent={{30,-14},{58,14}})));
        Modelica.Blocks.Sources.Step step(
          height=-5,
          offset=25,
          startTime=2)
          annotation (Placement(transformation(extent={{148,7},{134,21}})));
        Modelica.Blocks.Sources.Step step1(
          height=5,
          offset=0,
          startTime=8)
          annotation (Placement(transformation(extent={{148,-20},{134,-6}})));
        Modelica.Blocks.Math.Add add(k1=-1, k2=-1)
          annotation (Placement(transformation(extent={{122,-6},{110,6}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque2(
                                          useSupport=false)
                                  annotation (Placement(transformation(extent={{90,-10},
                  {70,10}}, rotation=0)));
        Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={64,-32})));
      equation
        connect(crankshaftSpeedRef.y, sample1.u) annotation (Line(
            points={{-69,6},{-65.2,6},{-65.2,6},{-61.4,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample1.y, speedControl.N_des) annotation (Line(
            points={{-45.3,6},{-35.2,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(speedControl.Theta, hold1.u) annotation (Line(
            points={{1.6,0},{6.8,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hold1.y, engine.Theta)    annotation (Line(
            points={{20.6,0},{28,0},{28,1.77636e-015},{27.2,1.77636e-015}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(torque2.flange, engine.flange_b)    annotation (Line(
            points={{70,0},{65.28,0},{65.28,1.77636e-015},{58.56,1.77636e-015}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(add.y, torque2.tau) annotation (Line(
            points={{109.4,0},{92,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(step1.y, add.u2) annotation (Line(
            points={{133.3,-13},{128,-13},{128,-3.6},{123.2,-3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(step.y, add.u1) annotation (Line(
            points={{133.3,14},{128,14},{128,3.6},{123.2,3.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(triggeredSpeed.N_clocked, speedControl.N) annotation (Line(
            points={{-3,-50},{-60,-50},{-60,-9},{-35.2,-9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(engine.flange_b, angleSensor.flange) annotation (Line(
            points={{58.56,1.77636e-015},{64,1.77636e-015},{64,-22}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(angleSensor.phi, triggeredSpeed.angle) annotation (Line(
            points={{64,-43},{64,-50},{20,-50}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{160,100}}),
                            graphics={Rectangle(extent={{104,26},{154,-32}},
                  lineColor={0,0,255}), Text(
                extent={{110,-26},{152,-30}},
                lineColor={0,0,255},
                textString="Load torque")}),
                                       Icon(coordinateSystem(preserveAspectRatio=true,
                        extent={{-100,-100},{100,100}}),
                                            graphics),
        experiment(StopTime=1.1));
      end EngineThrottleControl;

      package Utilities
        extends Modelica.Icons.Package;
        package ComponentsThrottleControl
          extends Modelica.Icons.Package;
          block ThrottleBody "Basic throttle body equations"
            extends Modelica.Blocks.Interfaces.BlockIcon;

          parameter Real P_0 = 1 "Atmospheric pressure, bar";
        protected
            Real m_ai(start=0, fixed=true) "mass, g";
            Real f_Theta "auxiliary variable";
            Real g_Pm "auxiliary variable";
        public
            Modelica.Blocks.Interfaces.RealInput Theta
            "throttle angle, degrees"
              annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
            Modelica.Blocks.Interfaces.RealInput Pm
            "Intake manifold presure, bar"
              annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
            Modelica.Blocks.Interfaces.RealOutput m_ai_dot
            "Mass flow rate of air into manifold (g/s)"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

        protected
            Real tmp1;
            Real tmp2;
            Real pratio;
            Real gpratio;
          equation

          der(m_ai) = f_Theta * g_Pm;
          f_Theta = 2.821 - 0.05231*Theta + 0.10299*Theta^2 - 0.00063*Theta^3; // different to paper 0.0063*Theta^3
          // Note: If the flow direction changes, i.e. Pm>P_0 the logic will fail since sqrt(-x)
          tmp1 = Pm / P_0;
          tmp2 = P_0 / Pm;
          pratio = min(tmp1, tmp2);
          gpratio = if pratio >= 0.5 then 2*sqrt(pratio - pratio^2) else 1;
          g_Pm = sign(P_0 - Pm) * gpratio;
          /*
g_Pm = if Pm <= P_0/2 then 1.0 else 2/P_0*sqrt(Pm*P_0 - Pm^2);
*/
          m_ai_dot = der(m_ai);
            annotation (Diagram(graphics));
          end ThrottleBody;

          block IntakeManifold "Dynamics of the intake manifold"
          extends Modelica.Blocks.Interfaces.BlockIcon;
            parameter Real RTVmRatio = 0.41328
            "RT/V_m TODO: What are sensible individual values of R,T, and V_m! (took same value like SIMULINK example for comparison reasons)";
            parameter Real P_0 = 0.543
            "Initial value for P_m, (bar) (took same value like SIMULINK example for comparison reasons)";
            Modelica.Blocks.Interfaces.RealInput m_ai_dot
            "Mass flow rate of air into manifold (g/s) "
              annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
            Modelica.Blocks.Interfaces.RealInput N "Engine speed (rad/sec)"
              annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
            Modelica.Blocks.Interfaces.RealOutput m_ao_dot
            "Mass flow rate of air out of manifold (g/s)"
              annotation (Placement(transformation(extent={{100,50},{120,70}})));
            Modelica.Blocks.Interfaces.RealOutput P_m(start=P_0, fixed=true)
            "Intake manifold presure, (bar)"
              annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
          equation
            der(P_m) = RTVmRatio*(m_ai_dot - m_ao_dot); // TODO adapt so that der(m_ai) and der(m_ao) is used!
            m_ao_dot = -0.366 + 0.08979*N*P_m - 0.0337*N*P_m^2 + 0.0001*N^2*P_m;

            annotation (Diagram(graphics));
          end IntakeManifold;

          block TorqueGeneration
          extends Modelica.Blocks.Interfaces.BlockIcon;
            parameter Real AFR = 14.6
            "air-fuel ratio (took same value like SIMULINK example for comparison reasons)";
            parameter Real sigma = 15.0
            "spark advance, BTDC (took same value like SIMULINK example for comparison reasons)";
            Modelica.Blocks.Interfaces.RealInput m_a
            "Mass of air charge in cylinder (delayed of 180deg crankshaft rotation) (g) "
              annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
            Modelica.Blocks.Interfaces.RealInput N "Engine speed (rad/sec)"
              annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
            Modelica.Blocks.Interfaces.RealOutput T_torque_e
            "Torque generated by engine"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
          equation

           T_torque_e = -181.3 + 379.36*m_a + 21.91*AFR - 0.85*AFR^2 + 0.26*sigma
           - 0.0028*sigma^2 + 0.027*N - 0.000107*N^2 + 0.00048*N*sigma
           + 2.55*sigma*m_a - 0.05*sigma^2*m_a;

            annotation (Diagram(graphics));
          end TorqueGeneration;

          block SpeedControl
          "Discrete control of crankshaft speed by throttle actuation"
            parameter Real k_p = 0.0614 "Proportional gain";
            parameter Real k_I = 0.0723 "Integral gain";
            Modelica.Blocks.Interfaces.RealInput N_des "Desired speed, (rad/s)"
                                                                                annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
            Modelica.Blocks.Interfaces.RealInput N "Measured speed, (rad/s)"
                                                                            annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
            Modelica.Blocks.Interfaces.RealOutput Theta(start=8.9)
            "throttle angle, degrees"                                                        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        protected
            Real x_d(start=8.973, fixed=true);
          /*
initial equation
  N_des = pre(N_des);
  N = pre(N);
*/
          equation
            when Clock() then
               x_d = previous(x_d) + k_I*interval()*(previous(N_des) - previous(N));
               Theta = k_p*(N_des - N) + x_d;
            end when;
            annotation (Diagram(graphics), Icon(graphics={
                  Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-4,-36},{74,20},{74,-2},{-4,-58},{-4,-36}},
                    lineColor={95,95,95},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{8,-34},{28,-44},{20,-50},{0,-40},{8,-34}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{20,-50},{28,-44},{32,-52},{24,-58},{20,-50}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{24,-58},{32,-52},{32,-74},{24,-80},{24,-58}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{0,-40},{20,-50},{24,-58},{24,-80},{22,-80},{22,-58},{20,
                        -54},{0,-44},{0,-40}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-14,44},{-18,36},{-10,42},{-8,48},{-14,44}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-18,36},{-10,42},{-10,18},{-18,12},{-18,36}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-20,14},{-20,36},{-16,44},{4,34},{4,30},{-16,40},{-18,36},
                        {-18,12},{-20,14}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-8,50},{12,40},{4,34},{-16,44},{-8,50}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-150,90},{150,60}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Polygon(
                    points={{28,-18},{48,-28},{40,-34},{20,-24},{28,-18}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{40,-34},{48,-28},{52,-36},{44,-42},{40,-34}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{44,-42},{52,-36},{52,-58},{44,-64},{44,-42}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{20,-24},{40,-34},{44,-42},{44,-64},{42,-64},{42,-42},{40,
                        -38},{20,-28},{20,-24}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{48,-4},{68,-14},{60,-20},{40,-10},{48,-4}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{60,-20},{68,-14},{72,-22},{64,-28},{60,-20}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{64,-28},{72,-22},{72,-44},{64,-50},{64,-28}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{40,-10},{60,-20},{64,-28},{64,-50},{62,-50},{62,-28},{60,
                        -24},{40,-14},{40,-10}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{68,10},{88,0},{80,-6},{60,4},{68,10}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{80,-6},{88,0},{92,-8},{84,-14},{80,-6}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{84,-14},{92,-8},{92,-30},{84,-36},{84,-14}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{60,4},{80,-6},{84,-14},{84,-36},{82,-36},{82,-14},{80,
                        -10},{60,0},{60,4}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-34,30},{-38,22},{-30,28},{-28,34},{-34,30}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-38,22},{-30,28},{-30,4},{-38,-2},{-38,22}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-40,0},{-40,22},{-36,30},{-16,20},{-16,16},{-36,26},{-38,
                        22},{-38,-2},{-40,0}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-28,36},{-8,26},{-16,20},{-36,30},{-28,36}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-54,16},{-58,8},{-50,14},{-48,20},{-54,16}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-58,8},{-50,14},{-50,-10},{-58,-16},{-58,8}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-60,-14},{-60,8},{-56,16},{-36,6},{-36,2},{-56,12},{-58,
                        8},{-58,-16},{-60,-14}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-48,22},{-28,12},{-36,6},{-56,16},{-48,22}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-74,0},{-78,-8},{-70,-2},{-68,4},{-74,0}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-78,-8},{-70,-2},{-70,-26},{-78,-32},{-78,-8}},
                    lineColor={0,0,255},
                    fillColor={255,255,127},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-80,-30},{-80,-8},{-76,0},{-56,-10},{-56,-14},{-76,-4},{
                        -78,-8},{-78,-32},{-80,-30}},
                    lineColor={0,0,255},
                    fillColor={191,191,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-68,6},{-48,-4},{-56,-10},{-76,0},{-68,6}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-64,-4},{-4,-36},{-4,-58},{-64,-26},{-64,-4}},
                    lineColor={95,95,95},
                    fillColor={75,75,75},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-64,-4},{-4,-36},{74,20},{14,52},{-64,-4}},
                    lineColor={95,95,95},
                    fillColor={160,160,164},
                    fillPattern=FillPattern.Solid)}));
          end SpeedControl;

          block CrankshaftPositionEvent
          "Every 180deg crankshaft rotation an event is generated"
            extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Blocks.Interfaces.RealInput angle(unit="rad")
            "Engine angle"
                annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput
                                   edge180Clock
              annotation (Placement(transformation(extent={{100,50},{120,70}})));
        protected
            Modelica.SIunits.AngularVelocity N;
            Real offset(start=0, fixed=true);
            Real hold_offset = hold(offset);
            Boolean edge180Event;
        public
            Modelica.Blocks.Interfaces.RealOutput N_clocked
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
          equation
            N = der(angle);
            edge180Event = angle >= hold_offset+Modelica.Constants.pi;
            edge180Clock = Clock(edge180Event);
            when edge180Clock then
               offset = sample(angle);
               N_clocked = sample(N);
            end when;
            annotation (Diagram(graphics));
          end CrankshaftPositionEvent;

          block CylinderAirCharge
          "Integrates the air mass flow into a cylinder. After the charge for one cylinder is complete, resets the mass to 0"
          extends Modelica.Blocks.Interfaces.BlockIcon;

            Modelica.Blocks.Interfaces.RealOutput m_a
            "Mass of an cylinder air charge (g)"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
            Modelica.Blocks.Interfaces.RealInput m_ao_dot
            "Mass flow rate of air out of manifold (g/s)"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

            Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                  clock annotation (Placement(transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={0,-120})));
        protected
            Real m_a_total(start=0, fixed=true)
            "Total amount of air that was sucked in";
            Real m_a_last "Amount of air sucked in until last clock event";
          equation
            der(m_a_total) = m_ao_dot;
            m_a = m_a_total - hold(m_a_last);
            when clock then
              m_a_last = sample(m_a_total);
            end when;

            annotation (Diagram(graphics));
          end CylinderAirCharge;

          block InductionToPowerDelay
          "Accounts for the induction-to-power stroke lag"
          extends Modelica.Blocks.Interfaces.BlockIcon;
            Modelica.Blocks.Interfaces.RealInput m_a
            "Mass of cylinder air charge (g)"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput m_a_delayed
            "180deg delayed mass of cylinder air charge (g)"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        protected
            Real m_a_sampled(start=0.152, fixed=true);
            Real m_a_delayedSampled(start=0.152, fixed=true);
        public
            Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                  clock annotation (Placement(transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={0,-120})));
          equation
            when clock then
              m_a_sampled = sample(m_a);
              m_a_delayedSampled = previous(m_a_sampled);
            end when;
            m_a_delayed = hold(m_a_delayedSampled);
            annotation (Diagram(graphics));
          end InductionToPowerDelay;

          model Engine2 "Internal combustion engine"

        public
            Modelica.Blocks.Interfaces.RealInput Theta
            "throttle angle, degrees"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.ThrottleBody
              throttleBody
              annotation (Placement(transformation(extent={{-78,20},{-58,40}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.IntakeManifold
              intakeManifold
              annotation (Placement(transformation(extent={{-78,-20},{-58,0}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.TorqueGeneration
              torqueGeneration
              annotation (Placement(transformation(extent={{18,28},{38,48}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.CrankshaftPositionEvent
              crankshaftPositionEvent
              annotation (Placement(transformation(extent={{70,-74},{50,-54}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.InductionToPowerDelay
              inductionToPowerDelay
              annotation (Placement(transformation(extent={{-22,-20},{-2,0}})));
            Modelica_Synchronous.Examples.Systems.Utilities.ComponentsThrottleControl.CylinderAirCharge
              cylinderAirCharge
              annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
            Modelica.Mechanics.Rotational.Sources.Torque
                                      torque(useSupport=false)
                                     annotation (Placement(transformation(extent={{40,-8},
                      {56,8}},          rotation=0)));
            Modelica.Mechanics.Rotational.Components.Inertia
                                          inertia1(J=0.14, w(fixed=true, start=209),
              phi(fixed=true, start=0))
              annotation (Placement(transformation(extent={{64,-8},{80,8}},
                    rotation=0)));
            Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
               Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={88,-18})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
              annotation (Placement(transformation(extent={{94,-10},{114,10}})));
            Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
               Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=-90,
                  origin={100,-46})));
          equation
            connect(Theta, throttleBody.Theta) annotation (Line(
                points={{-120,0},{-92,0},{-92,36},{-80,36}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(throttleBody.m_ai_dot, intakeManifold.m_ai_dot) annotation (Line(
                points={{-57,30},{-52,30},{-52,10},{-86,10},{-86,-4},{-80,-4}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(intakeManifold.P_m, throttleBody.Pm) annotation (Line(
                points={{-57,-16},{-52,-16},{-52,-26},{-88,-26},{-88,24},{-80,24}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(inductionToPowerDelay.m_a_delayed, torqueGeneration.m_a)
              annotation (Line(
                points={{-1,-10},{6,-10},{6,44},{16,44}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(cylinderAirCharge.m_a, inductionToPowerDelay.m_a) annotation (
                Line(
                points={{-29,-10},{-24,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(intakeManifold.m_ao_dot, cylinderAirCharge.m_ao_dot) annotation (
                Line(
                points={{-57,-4},{-56,-4},{-56,-10},{-52,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(cylinderAirCharge.clock, crankshaftPositionEvent.edge180Clock)
              annotation (Line(
                points={{-40,-22},{-40,-58},{49,-58}},
                color={128,0,255},
                smooth=Smooth.None));
            connect(inductionToPowerDelay.clock, crankshaftPositionEvent.edge180Clock)
              annotation (Line(
                points={{-12,-22},{-12,-58},{49,-58}},
                color={128,0,255},
                smooth=Smooth.None));
            connect(torque.tau, torqueGeneration.T_torque_e) annotation (Line(
                points={{38.4,0},{32,0},{32,20},{48,20},{48,38},{39,38}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(torque.flange, inertia1.flange_a) annotation (Line(
                points={{56,0},{64,0}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(inertia1.flange_b, speedSensor.flange) annotation (Line(
                points={{80,0},{84,0},{84,-8},{88,-8}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(inertia1.flange_b, flange_b) annotation (Line(
                points={{80,0},{104,0}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(torqueGeneration.N, speedSensor.w) annotation (Line(
                points={{16,32},{10,32},{10,-36},{88,-36},{88,-29}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(intakeManifold.N, speedSensor.w) annotation (Line(
                points={{-80,-16},{-86,-16},{-86,-78},{88,-78},{88,-29}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(angleSensor.flange, inertia1.flange_b) annotation (Line(
                points={{100,-36},{100,0},{80,0}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(angleSensor.phi, crankshaftPositionEvent.angle) annotation (
               Line(
                points={{100,-57},{100,-64},{72,-64}},
                color={0,0,127},
                smooth=Smooth.None));
            annotation (Icon(graphics={
                  Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-56,62},{36,76},{46,52},{-46,38},{-56,62}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{58,8},{-34,-6},{-34,-46},{58,-32},{58,8}},
                    lineColor={0,0,0},
                    pattern=LinePattern.None,
                    fillColor={135,135,135},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-58,-38},{-34,-46},{-34,-6},{-16,28},{-36,54},{-46,38},{-56,62},
                        {-76,48},{-58,2},{-58,-38}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-16,28},{76,42},{58,8},{-34,-6},{-16,28}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-36,54},{-16,28},{76,42},{56,68},{-36,54}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{-18,54},{2,34}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{40,62},{60,42}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{12,58},{32,38}},
                    lineColor={0,0,255},
                    pattern=LinePattern.None,
                    fillColor={95,95,95},
                    fillPattern=FillPattern.Solid),
                  Line(points={{-46,38},{-36,54},{40,66}}, color={0,0,0}),
                  Text(
                    extent={{-100,-50},{100,-90}},
                    lineColor={0,0,255},
                    fillColor={255,255,0},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}), Diagram(graphics));
          end Engine2;
        end ComponentsThrottleControl;

        package ComponentsMixingUnit
          extends Modelica.Icons.Package;
          model MixingUnit
          "Mixing unit demo from Foellinger, Nichtlineare Regelungen II, p. 280"
          import SI = Modelica.SIunits;
            Modelica.Blocks.Interfaces.RealInput T_c(unit="K")
            "Cooling temperature"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                    rotation=0)));
            Modelica.Blocks.Interfaces.RealOutput c(unit="mol/l")
            "Concentration"
              annotation (Placement(transformation(extent={{100,40},{140,80}},
                    rotation=0)));
            Modelica.Blocks.Interfaces.RealOutput T(unit="K")
            "Temperature in mixing unit"
              annotation (Placement(transformation(extent={{100,-80},{140,-40}},
                    rotation=0)));
            parameter Real c0(unit="mol/l") = 0.848 "Nominal concentration";
            parameter SI.Temperature T0 = 308.5 "Nominal temperature";
            parameter Real a1 = 0.2674;
            parameter Real a21 = 1.815;
            parameter Real a22 = 0.4682;
            parameter Real b = 1.5476;
            parameter Real k0 = 1.05e14;
            parameter Real eps = 34.2894;
            Real gamma "Reaction speed";
        protected
            parameter SI.Time tau0 = 60;
            parameter Real wk0 = k0/c0;
            parameter Real weps = eps*T0;
            parameter Real wa11 = a1/tau0;
            parameter Real wa12 = c0/tau0;
            parameter Real wa13 = c0*a1/tau0;
            parameter Real wa21 = a21/tau0;
            parameter Real wa22 = a22*T0/tau0;
            parameter Real wa23 = T0*(a21 - b)/tau0;
            parameter Real wb = b/tau0;
          equation
            gamma = c*wk0*exp( -weps/T);
            der(c) = -wa11*c - wa12*gamma + wa13;
            der(T) = -wa21*T + wa22*gamma + wa23 + wb*T_c;
            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                      -100,-100},{100,100}}),
                                graphics),
                                 Icon(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics={
                  Rectangle(
                    extent={{-100,40},{100,-100}},
                    lineColor={255,255,255},
                    fillColor={0,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(points={{-100,100},{-100,-100},{100,-100},{100,100}}, color={0,
                        0,0}),
                  Text(
                    extent={{-144,148},{148,100}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textString="%name"),
                  Text(
                    extent={{118,-86},{160,-124}},
                    lineColor={0,0,0},
                    textString="T"),
                  Text(
                    extent={{116,114},{158,76}},
                    lineColor={0,0,0},
                    textString="c"),
                  Text(
                    extent={{-194,72},{-108,34}},
                    lineColor={0,0,0},
                    textString="T_c"),
                  Line(points={{0,-50},{0,-100}}, color={0,0,0}),
                  Ellipse(
                    extent={{-42,-38},{0,-66}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{0,-38},{42,-66}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(points={{0,80},{0,16}}, color={0,0,0}),
                  Line(points={{20,80},{20,16}}, color={0,0,0}),
                  Line(points={{-86,-72},{-86,-114}}, color={0,0,0}),
                  Line(points={{-66,-72},{-66,-114}}, color={0,0,0})}));
          end MixingUnit;

          model MixingUnitWithContinuousControl
             extends Modelica.Icons.Example;
          import SI = Modelica.SIunits;

            parameter SI.Frequency freq = 1/300 "Critical frequency of filter";
            parameter Real c0(unit="mol/l") = 0.848 "Nominal concentration";
            parameter SI.Temperature T0 = 308.5 "Nominal temperature";
            parameter Real a1_inv =  0.2674;
            parameter Real a21_inv = 1.815;
            parameter Real a22_inv = 0.4682;
            parameter Real b_inv =   1.5476;
            parameter Real k0_inv =  1.05e14;
            parameter Real eps = 34.2894;

            parameter Real x10 = 0.42;
            parameter Real x10_inv = 0.6;
            parameter Real x20 = 0.01;
            parameter Real u0 = -0.0224;

            final parameter Real c_start(unit="mol/l") = c0*(1-x10);
            final parameter Real c_inv_start(unit="mol/l") = c0*(1-x10_inv);
            final parameter SI.Temperature T_start = T0*(1+x20);
            final parameter Real c_high_start(unit="mol/l") = c0*(1-0.72);
            final parameter Real T_c_start = T0*(1+u0);

            parameter Real pro=1.1
            "Deviations of plant to inverse plant parameters";
            final parameter Real a1=a1_inv*pro;
            final parameter Real a21=a21_inv*pro;
            final parameter Real a22=a22_inv*pro;
            final parameter Real b=b_inv*pro;
            final parameter Real k0=k0_inv*pro;

            Utilities.ComponentsMixingUnit.MixingUnit invMixingUnit(
              c0= c0,
              T0= T0,
              a1= a1_inv,
              a21=a21_inv,
              a22=a22_inv,
              b = b_inv,
              k0= k0_inv,
              eps=eps,
              c(start=c_start, fixed=true),
              T(start=T_start,
                fixed=true,
                stateSelect=StateSelect.always),
              T_c(start=T_c_start, fixed=true))
              annotation (Placement(transformation(extent={{-14,14},{-34,34}},
                    rotation=0)));
            Modelica.Blocks.Math.Add add
              annotation (Placement(transformation(extent={{40,-18},{56,-2}})));
            Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
              annotation (Placement(transformation(extent={{-54,8},{-2,40}})));
            Modelica.Blocks.Continuous.CriticalDamping filter(f=freq, n=3,
              normalized=false)
              annotation (Placement(transformation(extent={{-86,14},{-66,34}},
                    rotation=0)));
            Utilities.ComponentsMixingUnit.MixingUnit   mixingUnit(
              c(start=c_start, fixed=true),
              T(start=T_start, fixed=true),
              c0= c0,
              T0= T0,
              a1= a1,
              a21=a21,
              a22=a22,
              b = b,
              k0= k0,
              eps=eps)
              annotation (Placement(transformation(extent={{70,-20},{90,0}}, rotation=
                     0)));
            Modelica.Blocks.Math.Feedback feedback
              annotation (Placement(transformation(extent={{-24,-20},{-4,0}},
                    rotation=0)));
            Modelica.Blocks.Sources.Step step(height=c_high_start - c_start, offset=
                  c_start)
              annotation (Placement(transformation(extent={{-118,14},{-98,34}},
                    rotation=0)));
            Modelica.Blocks.Math.Gain gain(k=20) annotation (Placement(transformation(
                    extent={{4,-20},{24,0}},  rotation=0)));
          equation
            connect(step.y, filter.u)  annotation (Line(points={{-97,24},{-97,24},{
                    -88,24}},
                  color={0,0,127}));
            connect(mixingUnit.T, feedback.u2) annotation (Line(points={{92,-16},{
                    98,-16},{98,-36},{-14,-36},{-14,-18}},
                                                        color={0,0,127}));
            connect(feedback.y, gain.u) annotation (Line(points={{-5,-10},{-5,-10},
                    {2,-10}},
                  color={0,0,127}));
            connect(add.y, mixingUnit.T_c) annotation (Line(
                points={{56.8,-10},{68,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(gain.y, add.u2) annotation (Line(
                points={{25,-10},{32,-10},{32,-14.8},{38.4,-14.8}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(inverseBlockConstraints.y2, invMixingUnit.T_c) annotation (Line(
                points={{-5.9,24},{-12,24}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(inverseBlockConstraints.y1, add.u1) annotation (Line(
                points={{-0.7,24},{32,24},{32,-5.2},{38.4,-5.2}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(filter.y, inverseBlockConstraints.u1) annotation (Line(
                points={{-65,24},{-56.6,24}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(invMixingUnit.T, feedback.u1) annotation (Line(
                points={{-36,18},{-42,18},{-42,-10},{-22,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(invMixingUnit.c, inverseBlockConstraints.u2) annotation (Line(
                points={{-36,30},{-38,30},{-38,24},{-48.8,24}},
                color={0,0,127},
                smooth=Smooth.None));
            annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-120,
                      -100},{100,100}}),      graphics),
              experiment(StopTime=500),
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}})));
          end MixingUnitWithContinuousControl;

          model FilterOrder
            MixingUnit mixingUnit
              annotation (Placement(transformation(extent={{-20,-2},{0,18}})));
            Modelica.Blocks.Math.InverseBlockConstraints
              inverseBlockConstraints
              annotation (Placement(transformation(extent={{24,-8},{-42,30}})));
            Modelica.Blocks.Interfaces.RealInput c_ref
              annotation (Placement(transformation(extent={{70,-4},{40,26}})));
          equation
            connect(inverseBlockConstraints.u1, c_ref) annotation (Line(
                points={{27.3,11},{55,11}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(mixingUnit.T_c, inverseBlockConstraints.y2) annotation (
                Line(
                points={{-22,8},{-30,8},{-30,11},{-37.05,11}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(mixingUnit.c, inverseBlockConstraints.u2) annotation (Line(
                points={{2,14},{10,14},{10,11},{17.4,11}},
                color={0,0,127},
                smooth=Smooth.None));
            annotation (Diagram(graphics));
          end FilterOrder;
        end ComponentsMixingUnit;
      end Utilities;
    end Systems;

    package ForDocumentation
    "Examples that are used for the documentation of the blocks"
      extends Modelica.Icons.ExamplesPackage;

      package RealSignals
      "Examples that are used for the documentation of the Modelica_Synchronous.RealSignals sub-library"
        extends Modelica.Icons.ExamplesPackage;
        model Sample1 "Example of a Sample block"
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.Sample sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.RealSignals.Sampler.AssignClock assignClock
            annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-42,-2},{-30,10}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sample.y, assignClock.u) annotation (Line(
              points={{-33.4,30},{-23.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(periodicClock.y, assignClock.clock) annotation (Line(
              points={{-29.4,4},{-16,4},{-16,22.8}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Sample\">Modelica_Synchronous.RealSignals.Sampler.Sample</a>.
</p>
</html>"));
        end Sample1;

        model Sample2
        "Example of a Sample block with discontinuous input signals"
         extends Modelica.Icons.Example;
          Modelica_Synchronous.RealSignals.Sampler.Sample sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.RealSignals.Sampler.AssignClock assignClock
            annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-42,-2},{-30,10}})));
        Modelica.Blocks.Sources.Step step(startTime=0.1)
          annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
        equation
          connect(sample.y, assignClock.u) annotation (Line(
              points={{-33.4,30},{-23.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(periodicClock.y, assignClock.clock) annotation (Line(
              points={{-29.4,4},{-16,4},{-16,22.8}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              thickness=0.5,
              smooth=Smooth.None));
        connect(step.y, sample.u) annotation (Line(
            points={{-59,30},{-47.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Sample\">Modelica_Synchronous.RealSignals.Sampler.Sample</a>.
</p>
</html>"));
        end Sample2;

        model Sample3
        "Example of a Sample block with direct feed-through in the continuous-time and the clocked partition"
          import Modelica_Synchronous;
         extends Modelica.Icons.Example;
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample1
            annotation (Placement(transformation(extent={{-52,24},{-40,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-76,-6},{-64,6}})));
        Modelica.Blocks.Sources.Step step(startTime=0.04)
          annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica.Blocks.Math.Gain gain(k=1.2)
            annotation (Placement(transformation(extent={{-8,20},{12,40}})));
          Modelica_Synchronous.RealSignals.Sampler.Hold hold
            annotation (Placement(transformation(extent={{20,24},{32,36}})));
          Modelica.Blocks.Math.Feedback feedback
            annotation (Placement(transformation(extent={{-36,20},{-16,40}})));
          Modelica_Synchronous.RealSignals.Sampler.Sample sample2
            annotation (Placement(transformation(extent={{6,-6},{-6,6}})));
        equation
          connect(step.y, sample1.u)
                                  annotation (Line(
            points={{-59,30},{-53.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          connect(gain.y, hold.u) annotation (Line(
              points={{13,30},{18.8,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(feedback.y, gain.u) annotation (Line(
              points={{-17,30},{-10,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sample2.y, feedback.u2) annotation (Line(
              points={{-6.6,0},{-26,0},{-26,22}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(periodicClock.y, sample1.clock) annotation (Line(
              points={{-63.4,0},{-46,0},{-46,22.8}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              thickness=0.5,
              smooth=Smooth.None));
          connect(sample1.y, feedback.u1) annotation (Line(
              points={{-39.4,30},{-34,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(hold.y, sample2.u) annotation (Line(
              points={{32.6,30},{38,30},{38,0},{7.2,0}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Sample\">Modelica_Synchronous.RealSignals.Sampler.Sample</a>.
</p>
</html>"));
        end Sample3;

        model SampleClocked "Example of a SampleClocked block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">Modelica_Synchronous.RealSignals.Sampler.SampleClocked</a>.
</p>
</html>"));
        end SampleClocked;

        model SampleVectorizedAndClocked
        "Example of a SampleVectorizedAndClocked block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine2(
          freqHz=2,
          offset=0.1,
          startTime=0)
            annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked
                                                          sample(n=2)
            annotation (Placement(transformation(extent={{-14,24},{-2,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-28,-6},{-16,6}})));
          Modelica.Blocks.Sources.Sine sine1(startTime=0, freqHz=3)
            annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
        equation
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-15.4,0},{-8,0},{-8,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sine1.y, sample.u[1]) annotation (Line(
            points={{-59,8},{-38,8},{-38,29.4},{-15.2,29.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sine2.y, sample.u[2]) annotation (Line(
            points={{-59,40},{-38,40},{-38,30.6},{-15.2,30.6}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked\">Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked</a>.
</p>
</html>"));
        end SampleVectorizedAndClocked;

        model SampleWithADeffects "Example of a SampleWithADeffects block"
          import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            startTime=0,
            amplitude=0.95)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects
                                                          sample(
            noisy=true,
            limited=true,
            quantized=true,
            yMax=0.8,
            redeclare
            Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.UniformNoise
              noise(noiseMax=0.2))
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.RealSignals.Sampler.AssignClock assignClock
            annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              resolution=Modelica_Synchronous.Types.Resolution.ms, factor=20)
            annotation (Placement(transformation(extent={{-42,-2},{-30,10}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sample.y, assignClock.u) annotation (Line(
              points={{-33.4,30},{-23.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(periodicClock.y, assignClock.clock) annotation (Line(
              points={{-29.4,4},{-16,4},{-16,22.8}},
              color={175,175,175},
              pattern=LinePattern.Dot,
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.2),
            Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects\">Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects</a>.
</p>
</html>"));
        end SampleWithADeffects;

        model Hold "Example of a Hold block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-52,24},{-40,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
        Modelica_Synchronous.RealSignals.Sampler.Hold hold(y_start=-1.0)
          annotation (Placement(transformation(extent={{-8,24},{4,36}})));
        Modelica_Synchronous.RealSignals.Sampler.ShiftSample shiftSample(
            shiftCounter=2)
          annotation (Placement(transformation(extent={{-30,24},{-18,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-53.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-46,0},{-46,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, shiftSample.u) annotation (Line(
            points={{-39.4,30},{-31.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(shiftSample.y, hold.u) annotation (Line(
            points={{-17.4,30},{-9.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Hold\">Modelica_Synchronous.RealSignals.Sampler.Hold</a>.
</p>
</html>"));
        end Hold;

        model HoldWithDAeffects1 "Example of a HoldWithDAeffects block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            startTime=0,
          amplitude=2)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-52,24},{-40,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
        Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects
                                                      hold(
          computationalDelay=true,
          shiftCounter=1,
          resolution=2,
          y_start=0.5,
          limited=true,
          yMax=1.9)
          annotation (Placement(transformation(extent={{-8,24},{4,36}})));
        Modelica_Synchronous.RealSignals.Sampler.ShiftSample shiftSample(
            shiftCounter=2)
          annotation (Placement(transformation(extent={{-30,24},{-18,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-53.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-46,0},{-46,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, shiftSample.u) annotation (Line(
            points={{-39.4,30},{-31.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          connect(shiftSample.y, hold.u) annotation (Line(
              points={{-17.4,30},{-9.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects\">Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects</a>.
</p>
</html>"));
        end HoldWithDAeffects1;

        model HoldWithDAeffects2
        "Example of a HoldWithDAeffects block (with a computational delay of one sample period)"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            startTime=0,
          amplitude=2)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-52,24},{-40,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
        Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects
                                                      hold(
          computationalDelay=true,
          shiftCounter=1,
          y_start=0.5,
          limited=true,
          yMax=1.9,
          resolution=1)
          annotation (Placement(transformation(extent={{-8,24},{4,36}})));
        Modelica_Synchronous.RealSignals.Sampler.ShiftSample shiftSample(
            shiftCounter=2)
          annotation (Placement(transformation(extent={{-30,24},{-18,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-53.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-46,0},{-46,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, shiftSample.u) annotation (Line(
            points={{-39.4,30},{-31.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          connect(shiftSample.y, hold.u) annotation (Line(
              points={{-17.4,30},{-9.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects\">Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects</a>.
</p>
</html>"));
        end HoldWithDAeffects2;

        model SubSample "Example of a SubSample block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
        Modelica_Synchronous.RealSignals.Sampler.SubSample subSample(
            inferFactor=false, factor=3)
          annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, subSample.u) annotation (Line(
            points={{-33.4,30},{-23.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.2),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SubSample\">Modelica_Synchronous.RealSignals.Sampler.SubSample</a>.
</p>
</html>"));
        end SubSample;

        model SuperSample "Example of a SuperSample block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSample superSample(inferFactor=false,
              factor=3)
          annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
          connect(sample.y, superSample.u)
                                       annotation (Line(
            points={{-33.4,30},{-23.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.08),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SuperSample\">Modelica_Synchronous.RealSignals.Sampler.SuperSample</a>.
</p>
</html>"));
        end SuperSample;

        model SuperSampleInterpolated
        "Example of a SuperSampleInterpolated block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
        Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated superSampleIpo(
            inferFactor=false, factor=3)
          annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, superSampleIpo.u)
                                       annotation (Line(
            points={{-33.4,30},{-23.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.06),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated\">Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated</a>.
</p>
</html>"));
        end SuperSampleInterpolated;

        model ShiftSample "Example of a ShiftSample block"
          import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
          Modelica_Synchronous.RealSignals.Sampler.ShiftSample shiftSample1(
              shiftCounter=4, resolution=3)
            annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
          connect(sample.y, shiftSample1.u) annotation (Line(
              points={{-33.4,30},{-23.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.ShiftSample\">Modelica_Synchronous.RealSignals.Sampler.ShiftSample</a>.
</p>
</html>"));
        end ShiftSample;

        model BackSample "Example of a BackSample block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-46,24},{-34,36}})));
          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
          Modelica_Synchronous.RealSignals.Sampler.ShiftSample shiftSample1(
              shiftCounter=4, resolution=3)
            annotation (Placement(transformation(extent={{-26,24},{-14,36}})));
        Modelica_Synchronous.RealSignals.Sampler.BackSample backSample1(
          backCounter=4,
          resolution=3,
          y_start=0.5)
          annotation (Placement(transformation(extent={{-4,24},{8,36}})));
        equation
          connect(sine.y, sample.u) annotation (Line(
              points={{-59,30},{-47.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-49.4,0},{-40,0},{-40,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
          connect(sample.y, shiftSample1.u) annotation (Line(
              points={{-33.4,30},{-27.2,30}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(shiftSample1.y, backSample1.u) annotation (Line(
            points={{-13.4,30},{-5.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.BackSample\">Modelica_Synchronous.RealSignals.Sampler.BackSample</a>.
</p>
</html>"));
        end BackSample;

        model AssignClock "Example of a AssignClock block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-42,0},{-30,12}})));
        Modelica_Synchronous.RealSignals.Sampler.AssignClock assignClock1
          annotation (Placement(transformation(extent={{-26,22},{-14,34}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.UnitDelay unitDelay1
          annotation (Placement(transformation(extent={{-38,48},{-58,68}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{-58,18},{-38,38}})));
        Modelica.Blocks.Sources.Constant const(k=1)
          annotation (Placement(transformation(extent={{-92,12},{-72,32}})));
        equation
        connect(periodicClock.y, assignClock1.clock) annotation (Line(
            points={{-29.4,6},{-20,6},{-20,20.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(add.u2, const.y) annotation (Line(
            points={{-60,22},{-71,22}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(assignClock1.y, unitDelay1.u) annotation (Line(
            points={{-13.4,28},{-2,28},{-2,58},{-36,58}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(unitDelay1.y, add.u1) annotation (Line(
            points={{-59,58},{-68,58},{-68,34},{-60,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, assignClock1.u) annotation (Line(
            points={{-37,28},{-27.2,28}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.AssignClock\">Modelica_Synchronous.RealSignals.Sampler.AssignClock</a>.
</p>
</html>"));
        end AssignClock;

        model AssignClockVectorized "Example of a AssignClockVectorized block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-54,-50},{-42,-38}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.UnitDelay unitDelay1
          annotation (Placement(transformation(extent={{-38,58},{-58,78}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{-58,28},{-38,48}})));
        Modelica.Blocks.Sources.Constant const(k=1)
          annotation (Placement(transformation(extent={{-92,22},{-72,42}})));
        Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized
          assignClock1(n=2)
          annotation (Placement(transformation(extent={{-24,18},{-12,30}})));
        Modelica.Blocks.Math.Add add1
          annotation (Placement(transformation(extent={{-58,2},{-38,22}})));
        Modelica.Blocks.Sources.Constant const1(k=2)
          annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
        Modelica_Synchronous.RealSignals.NonPeriodic.UnitDelay unitDelay2
          annotation (Placement(transformation(extent={{-38,-28},{-58,-8}})));
        equation
        connect(add.u2, const.y) annotation (Line(
            points={{-60,32},{-71,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(unitDelay1.y, add.u1) annotation (Line(
            points={{-59,68},{-68,68},{-68,44},{-60,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicClock.y, assignClock1.clock) annotation (Line(
            points={{-41.4,-44},{-18,-44},{-18,16.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(const1.y, add1.u1) annotation (Line(
            points={{-71,0},{-68,0},{-68,18},{-60,18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(unitDelay2.y, add1.u2) annotation (Line(
            points={{-59,-18},{-66,-18},{-66,6},{-60,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, assignClock1.u[1]) annotation (Line(
            points={{-37,38},{-32,38},{-32,23.4},{-25.2,23.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.y, assignClock1.u[2]) annotation (Line(
            points={{-37,12},{-32,12},{-32,24.6},{-25.2,24.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(assignClock1.y[2], unitDelay2.u) annotation (Line(
            points={{-11.4,24.3},{-6,24.3},{-6,-18},{-36,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(assignClock1.y[1], unitDelay1.u) annotation (Line(
            points={{-11.4,23.7},{-6,23.7},{-6,68},{-36,68}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized\">Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized</a>.
</p>
</html>"));
        end AssignClockVectorized;

        model UpSample "Example of a UpSample block"
          import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-48,24},{-36,36}})));
        Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample upSample1
          annotation (Placement(transformation(extent={{-26,34},{-14,46}})));
        Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample upSample2(
            inferFactor=false, factor=3)
          annotation (Placement(transformation(extent={{-26,14},{-14,26}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{0,20},{20,40}})));
        equation
        connect(sine.y, sample.u) annotation (Line(
            points={{-59,30},{-49.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-42,0},{-42,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, upSample1.u) annotation (Line(
            points={{-35.4,30},{-32,30},{-32,40},{-27.2,40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(upSample2.u, sample.y) annotation (Line(
            points={{-27.2,20},{-32,20},{-32,30},{-35.4,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(upSample2.y, add.u2) annotation (Line(
            points={{-13.4,20},{-8,20},{-8,24},{-2,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(upSample1.y, add.u1) annotation (Line(
            points={{-13.4,40},{-8,40},{-8,36},{-2,36}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample\">Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample</a>.
</p>
</html>"));
        end UpSample;

        model AssignClockToTriggerHold
        "Example of an AssignClockToTriggerHold block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-48,24},{-36,36}})));
        Modelica.Blocks.Discrete.TriggeredSampler triggeredSampler
          annotation (Placement(transformation(extent={{10,40},{30,60}})));
        Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToTriggerHold
          clockToTrigger
          annotation (Placement(transformation(extent={{-20,20},{0,40}})));
        equation
        connect(sine.y, sample.u) annotation (Line(
            points={{-59,30},{-49.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-42,0},{-42,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(triggeredSampler.u, sine.y) annotation (Line(
            points={{8,50},{-54,50},{-54,30},{-59,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sample.y, clockToTrigger.u) annotation (Line(
            points={{-35.4,30},{-22,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(triggeredSampler.trigger, clockToTrigger.y) annotation (Line(
            points={{20,38.2},{20,30},{1,30}},
            color={255,0,255},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToTriggerHold\">Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToTriggerHold</a>.
</p>
</html>"));
        end AssignClockToTriggerHold;

        model AssignClockToSquareWaveHold
        "Example of an AssignClockToSquareWaveHold block"
        import Modelica_Synchronous;
           extends Modelica.Icons.Example;

          Modelica_Synchronous.ClockSignals.Clocks.PeriodicExactClock periodicClock(
              factor=20, resolution=Modelica_Synchronous.Types.Resolution.ms)
            annotation (Placement(transformation(extent={{-68,-6},{-56,6}})));
          Modelica.Blocks.Sources.Sine sine(freqHz=2,
            offset=0.1,
            startTime=0)
            annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
          Modelica_Synchronous.RealSignals.Sampler.SampleClocked
                                                          sample
            annotation (Placement(transformation(extent={{-48,24},{-36,36}})));
        Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold
          clockToSquareWave
          annotation (Placement(transformation(extent={{-24,20},{-4,40}})));
        equation
        connect(sine.y, sample.u) annotation (Line(
            points={{-59,30},{-49.2,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(periodicClock.y, sample.clock) annotation (Line(
            points={{-55.4,0},{-42,0},{-42,22.8}},
            color={175,175,175},
            pattern=LinePattern.Dot,
            thickness=0.5,
            smooth=Smooth.None));
        connect(sample.y, clockToSquareWave.u) annotation (Line(
            points={{-35.4,30},{-26,30}},
            color={0,0,127},
            smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),   graphics), experiment(StopTime=0.09),
          Documentation(info="<html>
<p>
Example used to generate a figure for the documentation of block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold\">Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold</a>.
</p>
</html>"));
        end AssignClockToSquareWaveHold;
      annotation (Documentation(info="<html>
<p>
This package contains models that have been used to produce
the figures in the documentation of the 
<a href=\"modelica://Modelica_Synchronous.RealSignals\">Modelica_Synchronous.RealSignals</a>
sub-library.
</p>
</html>"));
      end RealSignals;
    annotation (Documentation(info="<html>
<p>
This package contains models that have been used to produce
the figures in the documentation of the various blocks of
the Modelica_Synchronous library. As a result, all the examples
shown in the block documentations can be easily inspected and
simulated.
</p>
</html>"));
    end ForDocumentation;
  end Examples;


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

      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 u
        "Connector of a clock as input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput
                                                  y
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

</html>"));
    end SubSample;

    block SuperSample
      "Super-sample the input clock and provide it as output clock"
      parameter Integer factor(min=1) "Super-sampling factor (>= 1)" annotation(Evaluate=true);

      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 u
        "Connector of a clock as input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput
                                                  y
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

</html>"));
    end SuperSample;

    block ShiftSample "Shift (delay) clock for some clock ticks"
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
<p><i>The first activation of the clock of y = shiftSample(..) is shifted in time shiftCounter/resolution*interval(u) later than the first activation of the clock of u.</i></p>
</html>"));
    end ShiftSample;
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
      parameter Modelica_Synchronous.Types.SolverMethod solverMethod="External"
        "Integration method used for discretized continuous-time partitions" annotation(Dialog(tab="Advanced",enable=useSolver));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockOutput
                                                  y
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


package RealSignals "Library of clocked blocks for Real signals"
  extends Modelica.Icons.Package;
  package Sampler "Library of sampler and hold blocks for Real signals"
    block Sample
      "Sample the continuous-time, Real input signal and provide it as clocked output signal (clock is infered)"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialSISOSampler;

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of continuous-time, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation
      y = sample(u);

      annotation (
       defaultComponentName="sample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
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
This block samples the continuous-time, Real input signal u and provides it as 
clocked output signal y. The clock of the output signal is infered
(that is, it needs to be defined somewhere else in the clocked partition).
If this is not desired, use block
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">SampleClocked</a>
instead, to explicitly assign a clock to the output signal.
</p>

<p>
To be more precise: The input signal u(t) must be a continuous-time signal.
The output signal y(ti) is associated to a clock (defined somewhere else).
At a clock tick, the left limit of u is assigned to y:
<code>y(ti) = u(ti-eps)</code> (= the value of u just before the clock
became active). Since the operator returns the left limit of u, it introduces an
infinitesimal small delay between the continuous-time and the clocked partition.
This corresponds to the reality, where a sampled data system cannot act infinitely
fast and even for a very idealized simulation, an infinitesimal small delay is present.
As a result, algebraic loops between clocked and continuous-time partitions cannot
occur.
</p>

<h4>Examples</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.Sample1\">example</a>
samples a sine signal with a periodic clock of 20 ms period:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample1_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample1_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>

<p>
<br>In the following
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.Sample2\">example</a>
the continuous-time input signal contains a discontinuous value change at the 0.1 s
clock tick. It can be seen that the Sample block samples the left limit of the
step signal:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample2_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample2_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>

<p>
<br>In the following
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.Sample3\">example</a>
a direct feedthrough in the continuous-time and in the clocked partition is present.
Without a time-delay, this would result in an algebraic loop. However, since block
Sample samples the left limit of a continuous-time signal, sampling introduces a 
delay of one sample period that breaks the algebraic loop:
<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample3_Model.png\"></td>
    </tr>
<tr><td></td>
    <td align=\"center\">model<br></td>
   </tr>
<tr><td></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Sample3_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>

<p>
Note, the reason for the delay is that sample2.y (= the green, clocked signal)
is the left limit of hold.y (= the red, continuous-time signal). 
</p>
</html>"));
    end Sample;
    extends Modelica.Icons.Package;

    block SampleClocked
      "Sample the continuous-time, Real input signal and provide it as clocked output signal. The clock is provided as input signal"
      extends Modelica_Synchronous.RealSignals.Interfaces.SamplerIcon;
      Modelica.Blocks.Interfaces.RealInput u
        "Connector of continuous-time, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput clock
        "Output signal y is associated with this clock input"                           annotation (Placement(transformation(
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
              textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
This block is similar to the
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Sample\">Sample</a>
block. The only difference is that a clock signal is provided via a second
input and the output is associated to this clock.
</p>

<p>
Note, it does not make much sense to vectorize this block, because then
also the clock input is vectorized. Instead, if the input signal is a vector, use block
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked\">SampleVectorizedAndClocked</a>
that has a <b>vector</b> Real input and output, as well as a <b>scalar</b> clock input.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SampleClocked\">example</a>
samples a sine signal with a periodic clock of 20 ms period:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleClocked_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleClocked_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result<br></td>
   </tr>
</table>
</html>"));
    end SampleClocked;

    block SampleVectorizedAndClocked
      "Sample the continuous-time, Real input signal vector and provide it as clocked output signal vector. The clock is provided as input signal"
      extends Modelica_Synchronous.RealSignals.Interfaces.SamplerIcon;
      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.RealInput u[n]
        "Connector of continuous-time, Real input signal vector"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0), iconTransformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput y[n]
        "Connector of clocked, Real output signal vector"
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
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
This block is similar to the
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">SampleClocked</a>
block. The only difference is that the continuous-time input signal is a vector: All input
signals are sampled and are associated with the 
scalar clock signal provided via the second input.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SampleVectorizedAndClocked\">example</a>
has a vector as input, consisting of two different sine signals. These
signals are sampled with a periodic clock of 20 ms period:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleVectorizedAndClocked_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleVectorizedAndClocked_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result<br></td>
   </tr>
</table>
</html>"));
    end SampleVectorizedAndClocked;

    block SampleWithADeffects
      "Sample with (simulated) Analog-Digital converter effects including noise"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialSISOSampler;

      parameter Boolean noisy = false
        "= true, if output should be superimposed with noise"
        annotation(Evaluate=true,choices(__Dymola_checkBox=true),Dialog(enable=sampled,group="Sampling and noise"));

      parameter Boolean limited = false "= true, if output is limited"
        annotation(Evaluate=true,choices(__Dymola_checkBox=true),Dialog(group="Limiting and quantization"));
      parameter Boolean quantized = false
        "= true, if output quantization effects included"
        annotation(Evaluate=true,Dialog(enable=limited,group="Limiting and quantization"));
                                                                   // Dialog(enable=...) does not work with __Dymola_checkBox=... !?
      parameter Real yMax=1 "Upper limit of output (if limited = true)" annotation(Dialog(enable=limited,group="Limiting and quantization"));
      parameter Real yMin=-yMax "Lower limit of output (if limited = true)" annotation(Dialog(enable=limited,group="Limiting and quantization"));
      parameter Integer bits(min=1)=8
        "Number of bits of quantization (if quantized = true)" annotation(Dialog(enable=limited and quantized,group="Limiting and quantization"));

      Sample sample1
        annotation (Placement(transformation(extent={{-84,-6},{-72,6}})));

      replaceable
        Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.UniformNoise
                                                                                 noise if noisy
        constrainedby Modelica_Synchronous.RealSignals.Interfaces.PartialNoise
        "Noise model"
        annotation (__Dymola_choicesAllMatching=true, Dialog(enable=noisy,group="Sampling and noise"),Placement(transformation(extent={{-54,-6},
                {-42,6}})));
      Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.Limiter limiter(uMax=yMax,
          uMin=yMin) if limited
        annotation (Placement(transformation(extent={{-24,-8},{-8,8}})));
      Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.Quantization quantization(
        quantized=quantized,
        yMax=yMax,
        yMin=yMin,
        bits=bits) if quantized and limited annotation (Placement(transformation(extent={{14,-8},
                {30,8}})));
    protected
      Modelica.Blocks.Interfaces.RealInput uFeedthrough1 if not noisy
        annotation (Placement(transformation(extent={{-58,12},{-42,28}})));
      Modelica.Blocks.Interfaces.RealInput uFeedthrough2 if not limited
        annotation (Placement(transformation(extent={{-26,12},{-10,28}})));
      Modelica.Blocks.Interfaces.RealInput uFeedthrough3 if not quantized or not limited
        annotation (Placement(transformation(extent={{12,12},{28,28}})));
      Modelica.Blocks.Interfaces.RealOutput y1
        "Connector with a Real output signal"
        annotation (Placement(transformation(extent={{-61,-1},{-59,1}})));
      Modelica.Blocks.Interfaces.RealOutput y2
        annotation (Placement(transformation(extent={{-35,-1},{-33,1}})));
      Modelica.Blocks.Interfaces.RealOutput y3
        annotation (Placement(transformation(extent={{3,-1},{5,1}})));
      Modelica.Blocks.Interfaces.RealOutput y4
        annotation (Placement(transformation(extent={{41,-1},{43,1}})));

    equation
      connect(uFeedthrough1, y1) annotation (Line(
          points={{-50,20},{-58,20},{-58,0},{-60,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y1, noise.u) annotation (Line(
          points={{-60,0},{-55.2,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(noise.y, y2) annotation (Line(
          points={{-41.4,0},{-34,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y2, limiter.u) annotation (Line(
          points={{-34,0},{-25.6,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(uFeedthrough1, y2) annotation (Line(
          points={{-50,20},{-38,20},{-38,0},{-34,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y2, uFeedthrough2) annotation (Line(
          points={{-34,0},{-30,0},{-30,20},{-18,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(limiter.y, y3) annotation (Line(
          points={{-7.2,0},{4,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y3, quantization.u) annotation (Line(
          points={{4,0},{12.4,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y3, uFeedthrough3) annotation (Line(
          points={{4,0},{8,0},{8,20},{20,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(quantization.y, y4) annotation (Line(
          points={{30.8,0},{42,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(uFeedthrough3, y4) annotation (Line(
          points={{20,20},{38,20},{38,0},{42,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(uFeedthrough2, y3) annotation (Line(
          points={{-18,20},{0,20},{0,0},{4,0}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(sample1.y, y1) annotation (Line(
          points={{-71.4,0},{-60,0}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(u, sample1.u) annotation (Line(
          points={{-120,0},{-85.2,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y4, y) annotation (Line(
          points={{42,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
       defaultComponentName="sample1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Polygon(
              points={{0,-22},{-6,-38},{6,-38},{0,-22}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-112},{0,-38}},color={192,192,192}),
            Line(points={{-62,-72},{66,-72}}, color={192,192,192}),
            Polygon(
              points={{0,8},{-6,-8},{6,-8},{0,8}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid,
              origin={74,-72},
              rotation=-90),
            Line(
              points={{-50,-112},{-30,-112},{-30,-92},{-10,-92},{-10,-72},{10,-72},{
                  10,-52},{30,-52},{30,-32},{50,-32}},
              color={0,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-200,40},{200,100}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
This block is similar to the
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Sample\">Sample</a>
block. The only difference is that after the sampling of the input signal,
simulated real-world effects are applied on the sampled signal. In particular:
</p>

<ul>
<li> The output is limited, if parameter <b>limited</b> = true.</li>
<li> The output is value discretized in the form of an Analog-Digital converter
     with a defineable number of bits,
     if parameters <b>limited</b> = true, and <b>quantized</b> = true.</li>
<li> Noise is added to the output if
     parameter <b>noisy</b> = true.
     A pseudo random number generator is used to generate uniformly distributed
     random numbers in a given band.</li>
</ul>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SampleWithADeffects\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and adds the following effects:
</p>
<ul>
<li> Limits the output to +/- 0.8.</li>
<li> Discretizes the output with an 8 bit AD converter.</li>
<li> Adds large uniform noise with a band of +/- 0.2.</li>
</ul>
<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleWithADeffects_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SampleWithADeffects_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>

<p>
<br>The output y is quite far away from the continuous-time input signal,
    due to the strong discretization and large noise applied to the
    sampled input.
</p>
</html>"));
    end SampleWithADeffects;

    block Hold
      "Hold the clocked, Real input signal and provide it as continuous-time output signal (zero order hold)"
    extends Modelica_Synchronous.RealSignals.Interfaces.PartialSISOHold;

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
            Ellipse(
              extent={{-70,-30},{-50,-50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-30,28},{-10,8}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{10,70},{30,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,10},{70,-10}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This block holds the clocked Real input signal u with a zero order hold
and provides it as continuous-time output signal y. 
The clock of the input signal is infered
(that is, it needs to be defined somewhere else in the clocked partition).
</p>

<p>
To be more precise: The input signal u(ti) must be a clocked signal.
The output signal y(t) is a piecewise constant continuous-time signal.
When the clock of u ticks at time ti, the block output y(ti) = u(ti). Otherwise y(t), t &ge;ti, is the value of 
u(ti) from the last clock activation at time ti. Before the first clock activation of u, 
the block outputs the value of parameter <b>y_start</b>. The value of
this parameter is displayed below the icon.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"modelica://Modelica_Synchronous.Examples.ForDocumentation.RealSignals.Hold\">example</a>
samples a sine signal with a periodic clock of 20 ms period and delays it for 2 sample periods.
The resulting signal is hold with the Hold block. As a result, the clock of hold.u starts
ticking at 40 ms. The output hold.y of the block is a continuous-time signal that is present
from the start of the simulation. Before the first tick of the clock of hold.u, it is set
to -1.0 (= the value of parameter hold.y_start).<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Hold_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/Hold_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
&nbsp;
</html>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06)));
    end Hold;

    block HoldWithDAeffects
      "Hold with (simulated) Digital-Analog converter effects and computational delay"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialSISOHold;

      parameter Boolean computationalDelay = false
        "=true, if a computational delay should be imposed"
        annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(group="Computational delay in seconds = interval() * shiftCounter/resolution"));
      parameter Integer shiftCounter(min=0,max=resolution) = 0
        "(min=0, max=resolution), computational delay = interval()*shiftCounter/resolution"
        annotation(Dialog(enable=computationalDelay, group="Computational delay in seconds = interval() * shiftCounter/resolution"));
      parameter Integer resolution(min=1) = 1
        "Time quantization resolution of sample interval" annotation(Dialog(enable=computationalDelay, group="Computational delay in seconds = interval() * shiftCounter/resolution"));

      parameter Boolean limited = false "= true, if output is limited"
         annotation(Evaluate=true,choices(__Dymola_checkBox=true),Dialog(group="Limiting and quantization"));
      parameter Boolean quantized = false
        "= true, if output quantization effects included"
        annotation(Evaluate=true,Dialog(enable=limited,group="Limiting and quantization"));
                                                                   // Dialog(enable=...) does not work with __Dymola_checkBox=... !?
      parameter Real yMax=1 "Upper limit of output (if limited = true)" annotation(Dialog(enable=limited,group="Limiting and quantization"));
      parameter Real yMin=-yMax "Lower limit of output (if limited = true)" annotation(Dialog(enable=limited,group="Limiting and quantization"));
      parameter Integer bits(min=1)=8
        "Number of bits of quantization (if quantized = true)" annotation(Dialog(enable=limited and quantized,group="Limiting and quantization"));

      Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.Limiter limiter(uMax=yMax,
          uMin=yMin) if limited
        annotation (Placement(transformation(extent={{-56,-8},{-40,8}})));
      Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.Quantization quantization(
        quantized=quantized,
        yMax=yMax,
        yMin=yMin,
        bits=bits) if quantized and limited annotation (Placement(transformation(extent={{-18,-8},
                {-2,8}})));
      Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.ComputationalDelay
        compDelay(shiftCounter=shiftCounter, resolution=resolution) if
        computationalDelay
        annotation (Placement(transformation(extent={{20,-8},{36,8}})));
      Hold hold1(y_start=y_start)
                 annotation (Placement(transformation(extent={{78,-6},{90,6}})));
    protected
      Modelica.Blocks.Interfaces.RealInput uFeedthrough2 if not limited
        annotation (Placement(transformation(extent={{-58,12},{-42,28}})));
      Modelica.Blocks.Interfaces.RealInput uFeedthrough3 if not quantized or not limited
        annotation (Placement(transformation(extent={{-20,12},{-4,28}})));
      Modelica.Blocks.Interfaces.RealInput uFeedthrough4 if not computationalDelay
        annotation (Placement(transformation(extent={{18,12},{34,28}})));
      Modelica.Blocks.Interfaces.RealOutput y2
        annotation (Placement(transformation(extent={{-67,-1},{-65,1}})));
      Modelica.Blocks.Interfaces.RealOutput y3
        annotation (Placement(transformation(extent={{-29,-1},{-27,1}})));
      Modelica.Blocks.Interfaces.RealOutput y4
        annotation (Placement(transformation(extent={{9,-1},{11,1}})));
      Modelica.Blocks.Interfaces.RealOutput y5
        annotation (Placement(transformation(extent={{63,-1},{65,1}})));
    equation
      connect(y2, limiter.u) annotation (Line(
          points={{-66,0},{-57.6,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y2, uFeedthrough2) annotation (Line(
          points={{-66,0},{-62,0},{-62,20},{-50,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(limiter.y, y3) annotation (Line(
          points={{-39.2,0},{-28,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y3, quantization.u) annotation (Line(
          points={{-28,0},{-19.6,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y3, uFeedthrough3) annotation (Line(
          points={{-28,0},{-24,0},{-24,20},{-12,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(quantization.y, y4) annotation (Line(
          points={{-1.2,0},{10,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y4, compDelay.u) annotation (Line(
          points={{10,0},{18.4,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(uFeedthrough3, y4) annotation (Line(
          points={{-12,20},{6,20},{6,0},{10,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y4, uFeedthrough4) annotation (Line(
          points={{10,0},{14,0},{14,20},{26,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(uFeedthrough2, y3) annotation (Line(
          points={{-50,20},{-32,20},{-32,0},{-28,0}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(y5, compDelay.y) annotation (Line(
          points={{64,0},{36.8,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(y5, uFeedthrough4) annotation (Line(
          points={{64,0},{46,0},{46,20},{26,20}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(y5, hold1.u) annotation (Line(
          points={{64,0},{76.8,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, y2) annotation (Line(
          points={{-120,0},{-66,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hold1.y, y) annotation (Line(
          points={{90.6,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        defaultComponentName="hold1",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Ellipse(
              extent={{-88,-30},{-68,-50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-48,30},{-28,10}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-8,70},{12,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{32,10},{52,-10}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(visible=computationalDelay,
              extent={{-200,-146},{200,-211}},
              lineColor={0,0,0},
              textString="%shiftCounter/%resolution")}),
        Documentation(info="<html>
This block is similar to the
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Hold\">Hold</a>
block. The only difference is that simulated real-world effects are applied on the 
clocked input signal u before transforming the signal to a continuous-time signal
with a zero-order hold. In particular:
</p>

<ul>
<li> The output is delayed by a fraction of the clock period,
     if parameter <b>computationalDelay</b> = true.
     The delay is defined by shiftCounter/resolution*interval(),
     where <b>shiftCounter</b> and </b>resolution</b> are Integer parameters and 
     interval() is the time duration from the previous to the current
     clock tick. The maximal possible computational delay is one clock
     duration, and therefore there is the restriction that
     shiftCounter &le; resolution.</li>
<li> The output is limited, if parameter <b>limited</b> = true.</li>
<li> The output is value discretized in the form of an Digital-Analog converter
     with a defineable number of bits,
     if parameters <b>limited</b> = true, and <b>quantized</b> = true.</li>
</ul>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.HoldWithDAeffects1\">example</a>
samples a sine signal with an amplitude of 2.0 with a periodic clock of 20 ms period
and delays it for 2 sample periods.
The resulting signal is hold with the HoldWithDAeffects block. As a result, the clock of hold.u starts
ticking at 40 ms. The output hold.y of the block is a continuous-time signal that is present
from the start of the simulation. Before the first tick of the clock of hold.u, it is set
to 0.5 (= the value of parameter hold.y_start). Additionally,
the following effects are added to the hold block:</p>
<ul>
<li> The output is limited to +/- 1.9.</li>
<li> A computational delay of half of a sample period (= 1/2*20 ms = 10 ms)
     is defined.<br></li>
</ul>
<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/HoldWithDAeffects1_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/HoldWithDAeffects1_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>

<p>
<br>Due to the limitation of the output signal, the values of hold.u &ge; 1.9 
    are limited to 1.9.
</p>

<p>
If the hold output is delayed by one sample period, then the <b>previous</b>(..) value of the
input is output, and the first tick is delayed by one sample period,
as shown by the 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.HoldWithDAeffects2\">modified example</a>
from above:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/HoldWithDAeffects2_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/HoldWithDAeffects2_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
<br>Note, the computational delay of one sample period is defined 
    by shiftCounter=1, resolution=1, as shown in the icon of the
    hold block.
</p>
</html>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end HoldWithDAeffects;

    block SubSample
      "Sub-sample the clocked Real input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if sub-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Sub-sampling factor >= 1 (ignored if inferFactor=true)"
                                                                annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal (clock of y is slower as clock of u)"
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
              color={0,0,127}),                        Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={0,0,127},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
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
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,15},{75,-15}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-46,-20},{-26,-40}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{4,71},{24,51}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{57,3},{63,-3}},
              lineColor={0,0,127},
              fillColor={0,0,127},
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
This block sub-samples the clocked Real input signal u and provides it as 
clocked output signal y. 
</p>

<p>
To be more precise: 
The clock of y is factor-times slower than the clock of u. At every factor ticks of the clock of u, the output y returns the value of u. The first activation of the clock of y coincides with the first activation of the clock of u. By default, the sub-sampling factor is inferred,
that is, it must be defined somewhere else. If parameter <b>inferFactor</b> = false,
then the sub-sampling factor is defined by Integer parameter <b>factor</b>.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SubSample\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and 
then sub-samples the resulting clocked signal with a factor of 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SubSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SubSample_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
As can be seen, subSample.y picks every third-value of sample.y due to the
sub-sampling, and the sub-sampling factor = 3 is displayed in the icon of the
subSample block. Note the down-arrow in the icon of the subSample block indicates that the
clock of subSample.y is slower as the clock of subSample.u.
</p>
</html>"));
    end SubSample;

    block SuperSample
      "Super-sample the clocked Real input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if super-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Super-sampling factor >= 1 (ignored if inferFactor=true)"
                                                    annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal (clock of y is faster as clock of u)"
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
            preserveAspectRatio=true,
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
                                     color={0,0,127},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={0,0,127},
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
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-15,96},{15,66}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,83},{3,77}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{65,16},{95,-14}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{77,3},{83,-3}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-48,-46},{-18,-76}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{34,96},{64,66}},
              lineColor={0,0,127},
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
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block super-samples the clocked Real input signal u and provides it as 
clocked output signal y. 
</p>

<p>
To be more precise: 
The clock of y is factor-times faster than the clock of u. At every tick of the clock of y, the value of y is set to 
the value of u from the last tick of the clock of u. The first activation of the clock of y coincides with the first activation of the clock of u. By default, the super-sampling factor is inferred,
that is, it must be defined somewhere else. If parameter <b>inferFactor</b> = false,
then the super-sampling factor is defined by Integer parameter <b>factor</b>.
</p>

<p>
For control applications this block introduces unnecessary \"vibrations\".
In such a case it is better to use block 
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated\">SuperSampleInterpolated</a>
instead.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SuperSample\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and 
then super-samples the resulting clocked signal with a factor of 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SuperSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SuperSample_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
As can be seen, superSample introduces factor-1 additional clock ticks for the
output y. The super-sampling factor = 3 is displayed in the icon of the
superSample block. Note the up-arrow in the icon of the superSample block indicates that the
clock of superSample.y is faster as the clock of superSample.u.
</p>
</html>"));
    end SuperSample;

    block SuperSampleInterpolated
      "Super-sample the clocked Real input signal and provide it linearly interpolated as clocked output signal (this is also called an Interpolator)"

      parameter Boolean inferFactor=true
        "= true, if super-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Super-sampling factor >= 1 (if inferFactor=false)"
                                                    annotation(Evaluate=true, Dialog(enable=not inferFactor));
      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    protected
      Real uu(start=0.0);
      Real u_super;
      Real u_pre;
      Real u_preSuper;
      Integer usedFactor = if inferFactor then integer( (superSample(interval(u))/interval(u_super)) + 0.5) else factor;
      Integer ticks(start=0);
      Boolean first(start=true);
    equation
      when Clock() then  // clock of u
         uu = u;
         first = false;
         u_pre = if previous(first) then u else previous(uu);
      end when;

      when Clock() then  // clock of y
         if inferFactor then
            u_super = superSample(u);
         else
            u_super = superSample(u,factor);
         end if;
         u_preSuper = superSample(u_pre);
         ticks = if previous(ticks) < usedFactor then previous(ticks) + 1 else 1;
         y = u_preSuper + ticks/usedFactor*(u_super - u_preSuper);
      end when;

      annotation (
       defaultComponentName="superSampleIpo1",
       Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Rectangle(
              extent={{-90,90},{92,-90}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Line(
              points={{-100,0},{-40,0},{-40,-60},{16,-60},{16,0},{74,0},{74,80},{110,
                  80},{110,80},{110,80},{110,80},{120,80}},
              color={0,0,127},
              pattern=LinePattern.Dot,
              smooth=Smooth.None),
            Text(
              extent={{-200,175},{200,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(visible=not inferFactor,
              extent={{-200,-85},{200,-150}},
              lineColor={0,0,0},
              textString="%factor"),
            Ellipse(
              extent={{-55,-43},{-25,-73}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{59,94},{89,64}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2,16},{28,-14}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-89,-51},{-71,-69}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{7,88},{25,70}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{25,0},{5,20},{5,10},{-25,10},{-25,-10},{5,-10},{5,-20},
                  {25,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95},
              origin={-61,46},
              rotation=90)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block super-samples the clocked Real input signal u and provides it
linearly interpolated between the u-values as 
clocked output signal y. 
</p>

<p>
To be more precise: 
The clock of y is factor-times faster than the clock of u. At every tick of the clock of y, the value of y is set to 
the value of the linearly interpolated value between the last available values of u. 
The first activation of the clock of y coincides with the first activation of the clock of u. 
By default, the super-sampling factor is inferred,
that is, it must be defined somewhere else. If parameter <b>inferFactor</b> = false,
then the super-sampling factor is defined by Integer parameter <b>factor</b>.
</p>

<p>
For control applications, this block is better suited as block
<a href=\"Modelica_Synchronous.RealSignals.Sampler.SuperSample\">SuperSample</a>
since it does not induce \"vibrations\".
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.SuperSampleInterpolated\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and 
then super-samples the resulting clocked signal with a factor of 3
and interpolates the result linearly:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SuperSampleInterpolated_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/SuperSampleInterpolated_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
As can be seen, block superSampleIpo introduces 3 additional clock ticks for the
output y and determines the values at these clock ticks, so that the last two available
values of the input u are linearly interpolated. The super-sampling factor = 3 is displayed in the icon of the
superSampleIpo block. Note the up-arrow in the icon of the SuperSampleInterpolation block indicates that the
clock of superSampleIpo.y is faster as the clock of superSampleIpo.u.
</p>
</html>"));
    end SuperSampleInterpolated;

    block ShiftSample
      "Shift (delay) the clocked Real input signal by a fraction of the last interval and and provide it as clocked output signal"

      parameter Integer shiftCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
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
                                     color={0,0,127},
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
                                     color={0,0,127},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={0,0,127},
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
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block shifts the first activation of the clock of the output y by
fraction shiftCounter/resolution of the period (or for a non-periodic signal by a fraction of the last interval)
and the output y is set to the last available value of the input u.
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
and the clock of y starts at the second clock tick of cBase. At every tick of the clock of y,
the operator returns the value of u from the last tick of the clock of u.
</p>

<p>
Note, for 
<a href=\"Modelica_Synchronous.ClockSignals.Clocks.EventClock\">EventClock</a>s
there is the restriction that
block <b>ShiftSample</b> can only shift the number of ticks of the EventClock clock,
but cannot introduce new ticks, due to the restriction of operator <b>superSample</b> on
EventClocks.
</p>

<p>
Also note, that this block does not simply shift the signal in time,
since only the value of u from the last tick of the clock of u is used for the output.
If a time-delayed clock is desired, use instead block
<a href=\"modelica://Modelica_Synchronous.RealSignals.NonPeriodic.FractionalDelay\">NonPeriodic.FractionalDelay</a>
where the input signal is delayed by a time period and old values of u are stored in a buffer.
If the time delay is less than one period, the two blocks, ShiftSample and FractionalDelay, 
give the same result.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.ShiftSample\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and 
then shifts it with shiftCounter = 4 and resolution = 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/ShiftSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/ShiftSample_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
The first activation of output y of block shiftSample1 is shifted in time (4/3*20ms). The parameter values <b>shiftCounter</b> = 4 and <b>resolution</b> = 3 are visible at the bottom of the icon. Also note, that the signal is not simply a shift in time. The output of a ShiftSample block will always be the value from the <i>last</i> tick of the clock of its inputs.
</p>

</html>"));
    end ShiftSample;

    block BackSample
      "Shift clock of input backwards in time (and access the most recent value of the input at this new clock)"
      parameter Integer backCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Real y_start=0
        "Value of output y before the first clock tick of the input u";

      Modelica.Blocks.Interfaces.RealInput u(start=y_start)
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal (clock of y is faster als clock of u)"
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
                                     color={0,0,127},
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
                                     color={0,0,127},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-40},{-70,-60}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-16,0},{4,20},{4,10},{34,10},{34,-10},{4,-10},{4,-20},{-16,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95}),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-200,-74},{200,-139}},
              lineColor={0,0,0},
              textString="y_start=%y_start")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p>
This block shifts the first activation of the clock of the output y by
fraction backCounter/resolution of the period (or for a non-periodic signal by a fraction of the last interval)
before the first activation of the clock of u.
The output y is set to the last available value of the input u.
Here, <b>backCounter</b> and <b>resolution</b> are positive Integer parameters.
</p>

<p>
To be more precise: 
The block constructs (conceptually) a clock &ldquo;cBase&rdquo; 
</p>

<pre>
   <b>Clock</b> cBase = <b>subSample</b>(<b>superSample</b>(u, resolution), backCounter)
</pre>

<p>
and the first clock tick of y is shifted before the first tick of the clock of u,
such that this duration is identical to the duration
between the first and second clock tick of cBase.
Before the first tick of the clock of u, the block outputs
the value of parameter <b>y_start</b>. After that, the block returns the last 
available value of u.
</p>

<p>
Note, for 
<a href=\"Modelica_Synchronous.ClockSignals.Clocks.EventClock\">EventClock</a>s
there is the restriction that
block <b>BackSample</b> can only shift the number of ticks of the EventClock clock,
but cannot introduce new ticks, due to the restriction of operator <b>superSample</b> on
EventClocks.
</p>

<p>
Also note, that this block does not simply shift the signal in time,
since only the value of u from the last tick of the clock of u is used for the output.
In particular, a <b>BackSample</b> block following a <b>ShiftSample</b>
block cannot be used to recover the input signal of ShiftSample
(for a causal system this is impossible).
</p>


<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.BackSample\">example</a>
samples a sine signal with a periodic clock of 20 ms period, 
shift-samples it with shiftCounter = 4 and resolution = 3 and then back-samples it with backCounter=4 and resolution = 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/BackSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/BackSample_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
The first activation of output y of block backSample1 is shifted (4/3*20ms) before the first activation of output y of block shiftSample1. As a consequence, the activation times of the output y are coincident with the input signal of the shiftSample1 block. However, as described above, the output of block backSample1 <b>does not</b> recover the original sampled sine signal! For the first two ticks the output holds the value of the parameter <b>y_start</b> = 0.5. After that the output at a clock tick of block backSample1 is the <i>last</i> value of the output of the shiftSample1 block. The parameter values <b>y_start</b> = 0.5, <b>shiftCounter</b> = 4 and <b>resolution</b> = 3 are visible at the bottom of the icon. 
</p>
</html>"));
    end BackSample;

    block AssignClock "Assigns a clock to a signal"

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
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
                  0},{80,0},{100,0}},color={0,0,127},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={0,0,127},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(visible=useClock,
              points={{0,-100},{0,0}},
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
<p>The AssignClock block assigns a clock to a signal</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.AssignClock\">example</a>
shows a discrete counter. In order to execute the counter with a sample period of 20ms an AssignClock block is used. Due to clock inference all equations within the blocks are deduced to be active at the clock ticks given by the periodicClock block.
<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClock_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClock_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
At every clock tick (i.e., every 20ms) the output of the unitDelay1 block is incremented by one. 
</p>
</html>",     revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Date</th>
      <th>Author</th>
      <th>Company/Institute</th>
      <th>Comment</th>
    </tr>
    <tr>
      <td valign=\"top\">2012-08-20</td>
      <td valign=\"top\">Bernhard Thiele</td>
      <td>DLR, Institute for System Dynamics and Control</td>
      <td valign=\"top\">Initial version</td>
    </tr>
</table>
</html>"));
    end AssignClock;

    block AssignClockVectorized "Assigns a clock to a signal vector"

      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.RealInput u[n]
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y[n]
        "Connector of clocked, Real output signal"
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
                  0},{80,0},{100,0}},color={0,0,127},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={0,0,127},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={0,0,127},
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
<p>The AssignClock block assigns a clock to a signal</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.AssignClockVectorized\">example</a>
shows a two discrete counters. In order to execute the counter with a sample period of 20ms an AssignClockVectorized block is used. Due to clock inference all equations within the blocks are deduced to be active at the clock ticks given by the periodicClock block.
<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockVectorized_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockVectorized_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
At every clock tick (i.e., every 20ms) the output of the unitDelay1 block is incremented by one and that of the unitDelay2 block is incremented by two. The vector size of the input and output is provided by the parameter <b>n</b>=2 which is also shown in the icon.
</p>
</html>"));
    end AssignClockVectorized;

    package Utilities "Utility components that are usually not directly used"
       extends Modelica.Icons.Package;

      block UpSample
        "Upsample the clocked Real input signal and provide it as clocked output signal"

        parameter Boolean inferFactor=true
          "= true, if upsampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
        parameter Integer factor(min=1)=1
          "Upsampling factor >= 1 (if inferFactor=false)" annotation(Evaluate=true, Dialog(enable=not inferFactor));
        Modelica.Blocks.Interfaces.RealInput u
          "Connector of clocked, Real input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y
          "Connector of clocked, Real output signal (clock of y is faster as clock of u)"
          annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      protected
        Real dummy annotation(HideResult=true);
        Boolean b(start=false);
        Boolean b_super(start=false);
        Real u_super;
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
           y = if b_super <> previous(b_super) then u_super else 0.0;
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
                    {100,0}},          color={0,0,127},
                pattern=LinePattern.Dot),                Line(
                points={{-80,-60},{-80,0},{-100,0}},
                color={0,0,127},
                smooth=Smooth.None,
                pattern=LinePattern.Dot),
              Text(
                extent={{-200,175},{200,110}},
                lineColor={0,0,255},
                textString="%name"),
              Ellipse(
                extent={{-95,-45},{-65,-75}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-83,-57},{-77,-63}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{25,96},{55,66}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{37,83},{43,77}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-55,16},{-25,-14}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-6,16},{24,-14}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{64,16},{94,-14}},
                lineColor={0,0,127},
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
This block upsamples the clocked Real input signal u and provides it as clocked output signal y. 
</p>

<p>
To be more precise: 
The clock of y is factor-times faster than the clock of u. At every tick of the clock of u, the value of y is set to 
the value of u, at intermediate ticks of clock y, the value of y is set to zero. The first activation of the clock of y coincides with the first activation of the clock of u. By default, the upsampling factor is inferred,that is, it must be defined somewhere else. If parameter <b>inferFactor</b> = false, then the upsampling factor is defined by the Integer parameter <b>factor</b>.
</p>

<p>
For signal interpolation an <i>upsample</i> should be followed by an appropriate filter (antiimaging).
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.UpSample\">example</a>
samples a sine signal with a periodic clock of 20 ms period, and 
then upsamples the resulting clocked signal with a factor of 3:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/UpSample_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/UpSample_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
The upsampling factor is explicitly given at the upSample2 block, which also makes the factor visible in the icon. For the upSample1 block the factor is infered.  
As can be seen, upsample1 introduces 3 additional clock ticks for the
output y. Note the up-arrow in the icon of the upSample blocks which indicates that the
clock of their outputs is faster than the clock of their inputs.
</p>
</html>"));
      end UpSample;

        block AssignClockToTriggerHold
        "Generate a boolean continuous time trigger signal from a clocked real input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
          Modelica.Blocks.Interfaces.RealInput u
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Boolean output signal"     annotation (Placement(
                transformation(extent={{100,-10},{120,10}}, rotation=0),
                iconTransformation(extent={{100,-10},{120,10}})));
      protected
          Boolean y2(start=y_start);
          Boolean y3(start=y_start, fixed=true);
          Real uu annotation(HideResult=true);
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
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
This block creates a Boolean, continuous time, trigger signal whenever the clock of the input signal is active.  
</p>

<p>
A particular use-case in which that block might be useful is the combination of \"old-style\" sampled blocks (i.e., \"unclocked\" discrete control functions implemented using equations between \"when trigger then\" clauses) with clocked blocks.
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.AssignClockToTriggerHold\">example</a>
samples a sine signal with a periodic clock of 20 ms period. After that a continuous time Boolean trigger signal is generated at every clock tick of that sampled signal. The generated signal is used as trigger signal for an \"old-style\" <a href=\"Modelica.Blocks.Discrete.TriggeredSampler\">TriggeredSampler</a>  block from the Modelica.Blocks.Discrete package:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockToTriggerHold_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockToTriggerHold_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
<p>
Note, that it is clearly visible in the plot that the \"old-style\" discrete variables have an implicit zero-order hold semantics, while the new clocked variables are only active whenever their associated clock ticks. Just compare variable sample.y (clocked) with triggeredSampler.y (unclocked) to observe the difference.
</p>
</html>"));
        end AssignClockToTriggerHold;

        block AssignClockToSquareWaveHold
        "Generate a boolean continuous time square-wave output from a clocked real input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
          Modelica.Blocks.Interfaces.RealInput u
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Boolean output signal"     annotation (Placement(
                transformation(extent={{100,-10},{120,10}}, rotation=0),
                iconTransformation(extent={{100,-10},{120,10}})));
      protected
          Boolean y2(start=y_start);
        equation
          // dummy condition to relate clock of u with y2
          y2 = if u > 0 then not previous(y2) else not previous(y2);
          y = hold(y2);
          annotation (
            defaultComponentName="clockToSquareWave",
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
                                       Line(points={{-80,-70},{-40,-70},{-40,44},
                    {0,44},{0,-70},{40,-70},{40,44},{79,44}},
                                                           color={0,0,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
This block creates a Boolean, continuous time, square-wave output. Whenever the clock of the input signal is active the Boolean output value changes.  
</p>

<h4>Example</h4>

<p>
The following 
<a href=\"Modelica_Synchronous.Examples.ForDocumentation.RealSignals.AssignClockToSquareWaveHold\">example</a>
samples a sine signal with a periodic clock of 20 ms period. After that a Boolean, continuous time, square-wave signal is generated that changes its value at every clock tick of the sampled signal:<br>
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockToSquareWaveHold_Model.png\"></td>
    <td valign=\"bottom\">&nbsp;&nbsp;&nbsp;
                        <img src=\"modelica://Modelica_Synchronous/Resources/Images/RealSignals/AssignClockToSquareWaveHold_Result.png\"></td>  
    </tr>
<tr><td></td>
    <td align=\"center\">model</td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
        end AssignClockToSquareWaveHold;

      package Internal
        "Internal blocks and functions that are usually of no interest for the user"
         extends Modelica.Icons.Package;
        block ComputationalDelay
        extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
          parameter Integer shiftCounter(min=0,max=resolution) = 0
            "(min=0, max=resolution), computational delay = interval()*shiftCounter/resolution"
               annotation(Evaluate=true,Dialog(group="Computational delay in seconds = interval() * shiftCounter/resolution"));
          parameter Integer resolution(min=1) = 1
            "Time quantization resolution of sample interval"
               annotation(Evaluate=true,Dialog(group="Computational delay in seconds = interval() * shiftCounter/resolution"));
        protected
          Real ubuf(start=0.0);
        equation
          assert(resolution >= shiftCounter, "The maximal computational delay has the length of one sample interval, however a larger value than that was set");
          ubuf = u;
          if shiftCounter < resolution then
             y = shiftSample(u, shiftCounter, resolution);
          else
             y = shiftSample(previous(ubuf), shiftCounter, resolution);
          end if;

          annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                    -100},{100,100}}), graphics));
        end ComputationalDelay;

        block UniformNoise
          extends Modelica_Synchronous.RealSignals.Interfaces.PartialNoise;
          parameter Real noiseMax=0.1 "Upper limit of noise band";
          parameter Real noiseMin=-noiseMax "Lower limit of noise band";
          parameter Integer firstSeed[3](each min=0, each max=255) = {23,87,187}
            "Integer[3] defining random sequence; required element range: 0..255";
        protected
          Integer seedState[3](start=firstSeed, each fixed=true)
            "State of seed"                                                      annotation(HideResult=true);
          Real noise "Noise in the range 0..1" annotation(HideResult=true);
        equation
          (noise,seedState) =
            Modelica_Synchronous.RealSignals.Sampler.Utilities.Internal.random(
            previous(seedState));
            y = u + noiseMin + (noiseMax - noiseMin)*noise;

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics));
        end UniformNoise;

        model Quantization "DAC quantization effects"
        extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;

          parameter Boolean quantized = false
            "= true, if quantization effects shall be computed";
          parameter Real yMax=1 "Upper limit of output";
          parameter Real yMin=-1 "Lower limit of output";
          parameter Integer bits(min=1)=8
            "Number of bits of quantization (if quantized = true)";
        protected
          parameter Real resolution = if quantized then ((yMax - yMin)/2^bits) else 0;
        equation

          if quantized then
            y = resolution*floor(abs(u/resolution) + 0.5)*
                   (if u >= 0 then +1 else -1);
          else
            y = u;
          end if;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), Diagram(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
        end Quantization;

            block Limiter "Limit the range of a signal"
            extends
            Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
              parameter Real uMax(start=1) "Upper limits of input signals";
              parameter Real uMin= -uMax "Lower limits of input signals";

            equation
              assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) +
                                   ") < uMin (=" + String(uMin) + ")");
              y = smooth(0,if u > uMax then uMax else if u < uMin then uMin else u);
              annotation (
                Documentation(info="
<HTML>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</HTML>
"),             Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{0,-90},{0,68}}, color={192,192,192}),
                Polygon(
                  points={{0,90},{-8,68},{8,68},{0,90}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-90,0},{68,0}}, color={192,192,192}),
                Polygon(
                  points={{90,0},{68,-8},{68,8},{90,0}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
                Text(
                  extent={{-150,-150},{150,-110}},
                  lineColor={0,0,0},
                  textString="uMax=%uMax"),
                Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255})}),
                Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{0,-60},{0,50}}, color={192,192,192}),
                Polygon(
                  points={{0,60},{-5,50},{5,50},{0,60}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-60,0},{50,0}}, color={192,192,192}),
                Polygon(
                  points={{60,0},{50,-5},{50,5},{60,0}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
                Text(
                  extent={{46,-6},{68,-18}},
                  lineColor={128,128,128},
                  textString="u"),
                Text(
                  extent={{-30,70},{-5,50}},
                  lineColor={128,128,128},
                  textString="y"),
                Text(
                  extent={{-58,-54},{-28,-42}},
                  lineColor={128,128,128},
                  textString="uMin"),
                Text(
                  extent={{26,40},{66,56}},
                  lineColor={128,128,128},
                  textString="uMax")}));
            end Limiter;

        function random "Pseudo random number generator"

          input Integer seedIn[3]
            "Integer vector defining random number sequence, e.g., {23,87,187}";
          output Real x "Random number between 0 and 1";
          output Integer seedOut[3]
            "Modified seed to be used for next call of random()";
        algorithm
          seedOut[1] := rem((171*seedIn[1]), 30269);
          seedOut[2] := rem((172*seedIn[2]), 30307);
          seedOut[3] := rem((170*seedIn[3]), 30323);
          // zero is a poor seed, therfore substitute 1;
          if seedOut[1] == 0 then
            seedOut[1] := 1;
          end if;
          if seedOut[2] == 0 then
            seedOut[2] := 1;
          end if;
          if seedOut[3] == 0 then
            seedOut[3] := 1;
          end if;
          x := rem((seedOut[1]/30269.0 + seedOut[2]/30307.0 + seedOut[3]/30323.0), 1.0);
          annotation (
            Documentation(info="<HTML>
<p>
<i>Random</i> generates a sequence of uniform distributed
pseudo-random numbers. The algorithm is a variant of the
multiplicative congruential algorithm, known as the
Wichmann-Hill generator:
<pre>    x(k) = (a1*x(k-1)) mod m1
    y(k) = (a2*y(k-1)) mod m2
    z(k) = (a3*z(k-1)) mod m3
    U(k) = (x(k)/m1 + y(k)/m2 + z(k)/m3) mod 1
</pre>
This generates pseudo-random numbers U(k) uniformly distributed
in the interval (0,1). There are many forms of generators depending
on the parameters m (prime numbers) and a. The sequence needs an
initial Integer vector {x,y,z} known as the seed. The use of the same
seed will lead to the same sequence of numbers.
</p>
<p>
<b>Remarks</b>
</p>
<p>Random number generators (RNG) are pseudo-functions which are not true
functions but algorithms which deliver a fixed sequence of (usually Integer) numbers
which should have a very large period before they repeat itself and
appropriate statistic properties such that the sequence appears to be
a random draw. For real-valued random numbers, the integers are scaled to
the real interval 0.0-1.0. They result in a uniformly distributed random variate
between 0-1, which has to be tranformed to give a random variate of a wanted
distribution. There are two types of techniques for transforming random variates:
</p>
<ul>
<li>Acceptance-Rejection techniques</li>
<li>Transformation techniques</li>
</ul>
<p>Acceptance-Rejection techniques throw away some of the generated variates and are thus less efficient. They can not be avoided for all distributions. A good summary about random number generation and most of the transformation techniques used below is given in:</p>
 <address> Discrete Event Simulation <br>
 Jerry Banks and John S. Carson II<br>
 Prentice Hall Inc.<br>
 Englewood Cliffs, New Jersey<br>
 </address>
<p>Some of the other references are quoted below.</p>
<pre>
        WICHMANN-HILL RANDOM NUMBER GENERATOR
        Wichmann, B. A. & Hill, I. D. (1982)
          Algorithm AS 183:
          An efficient and portable pseudo-random number generator
          Applied Statistics 31 (1982) 188-190
        see also:
          Correction to Algorithm AS 183
          Applied Statistics 33 (1984) 123
        McLeod, A. I. (1985)
          A remark on Algorithm AS 183
          Applied Statistics 34 (1985),198-200
        In order to completely avoid external functions, all seeds are
        set via parameters. For simulation purposes this is almost
        always the desired behaviour.
        Translated by Hubertus Tummescheit from Python source provided by
        Guido van Rossum translated from C source by Adrian Baddeley.
        http://www.python.org/doc/current/lib/module-random.html
        R A N D O M   V A R I A B L E   G E N E R A T O R S
        distributions on the real line:
        ------------------------------
            normal (Gaussian) 2 versions
</pre>
<h4>Reference Literature:</h4>
<ul>
<li>function random: Wichmann, B. A. & Hill, I. D. (1982), Algorithm AS 183:
  <br>
  An efficient and portable pseudo-random number generator, Applied Statistics 31 (1982) 188-190<br>
  see also: Correction to Algorithm AS 183, Applied Statistics 33 (1984) 123 <br>
  McLeod, A. I. (1985), A remark on Algorithm AS 183, Applied Statistics 34 (1985),198-200</li>
<li>function normalvariate: Kinderman, A.J. and Monahan, J.F., 'Computer generation of random
  variables using the ratio of uniform deviates', ACM Trans Math Software, 3, (1977),
  pp257-260.</li>
<li>function gaussianvariate: Discrete Event Simulation, Jerry Banks and John S. Carson II,
<br>
  Prentice Hall Inc. Englewood Cliffs, New Jersey, page 315/316</li>
</ul>
<p>
Copyright &copy; Hubertus Tummescheit and Department of Automatic Control, Lund University, Sweden.
</p>
<p>
<i>This Modelica function is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>
</HTML>
"));
        end random;
      end Internal;

        block BooleanPulse "Generate pulse signal of type Boolean"

          parameter Real width(
            final min=Modelica.Constants.small,
            final max=100) = 50 "Width of pulse in % of period";
          parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,start=1)
          "Time for one period";
          parameter Modelica.SIunits.Time startTime=0
          "Time instant of first pulse";
          extends Modelica.Blocks.Interfaces.partialBooleanSource;

      protected
          parameter Modelica.SIunits.Time Twidth=period*width/100
          "width of one pulse"                                              annotation(HideResult=true);
          discrete Modelica.SIunits.Time pulsStart "Start time of pulse"
                                                     annotation(HideResult=true);
        initial equation
          pulsStart = startTime;
        equation
            when sample(startTime, period) then
              pulsStart = time;
            end when;
            y = time >= pulsStart and time < pulsStart + Twidth;
          annotation (
            Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Text(
                extent={{-150,-140},{150,-110}},
                lineColor={0,0,0},
                textString="%period"), Line(points={{-80,-70},{-40,-70},{-40,44},{0,
                    44},{0,-70},{40,-70},{40,44},{79,44}}, color={0,0,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Text(
                extent={{-60,-74},{-19,-82}},
                lineColor={0,0,0},
                textString="startTime"),
              Line(
                points={{-78,-70},{-40,-70},{-40,20},{20,20},{20,-70},{50,-70},{50,
                    20},{100,20}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{-40,61},{-40,21}}, color={95,95,95}),
              Line(points={{20,44},{20,20}}, color={95,95,95}),
              Line(points={{50,58},{50,20}}, color={95,95,95}),
              Line(points={{-40,53},{50,53}}, color={95,95,95}),
              Line(points={{-40,35},{20,35}}, color={95,95,95}),
              Text(
                extent={{-30,65},{16,55}},
                lineColor={0,0,0},
                textString="period"),
              Text(
                extent={{-33,47},{14,37}},
                lineColor={0,0,0},
                textString="width"),
              Line(points={{-70,20},{-41,20}}, color={95,95,95}),
              Polygon(
                points={{-40,35},{-31,37},{-31,33},{-40,35}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{20,35},{12,37},{12,33},{20,35}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,53},{-31,55},{-31,51},{-40,53}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{50,53},{42,55},{42,51},{50,53}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-95,26},{-66,17}},
                lineColor={0,0,0},
                textString="true"),
              Text(
                extent={{-96,-60},{-75,-69}},
                lineColor={0,0,0},
                textString="false")}),
            Documentation(info="<html>
<p>
The Boolean output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\">
</p>
</html>"));
        end BooleanPulse;
    end Utilities;

    annotation (Documentation(info="<html>
<p>
This package contains blocks that mark boundaries of a clocked partition
and transform a <b>Real</b> signal from one partition to the next. Especially, 
the following blocks are provided:<br>&nbsp;
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"3\">
<tr><th align=\"left\"><b>Boundary Type</b></th>
    <th align=\"left\"><b>Block Name</b></th>
    <th align=\"left\"><b>Description</b></th></tr>

<tr><td valign=\"top\" rowspan=\"4\">continuous-time &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Sample\">Sample</a></td>
      <td>Sample a continuous-time signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">SampleClocked</a></td>
      <td>Sample and associate a clock to the sampled <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked\">SampleVectorizedAndClocked</a></td>
      <td>Sample an input vector and associate a clock to the sampled <b>vector</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleWithADeffects\">SampleWithADeffects</a></td>
      <td>Sample with (simulated) Analog-Digital converter effects including noise.</td>
    </tr>

<tr><td valign=\"top\" rowspan=\"2\">clocked &rarr; continuous-time</td>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Hold\">Hold</a></td>
      <td>Hold a clocked signal with zero-order hold.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.HoldWithDAeffects\">HoldWithDAeffects</a></td>
      <td>Hold with (simulated) Digital-Analog converter effects and computational delay.</td>
    </tr>

<tr><td valign=\"top\" rowspan=\"5\">clocked &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SubSample\">SubSample</a></td>
      <td>Sub-sample a signal (output clock is slower as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SuperSample\">SuperSample</a></td>
      <td>Super-sample a signal (output clock is faster as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SuperSampleInterpolated\">SuperSampleInterpolated</a></td>
      <td>Super-sample a signal with linear interpolation (output clock is faster as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.ShiftSample\">ShiftSample</a></td>
      <td>Shift a signal (output clock is delayed with respect to input clock).  </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.BackSample\">BackSample</a></td>
      <td>Shift a signal and start the output clock before the input clock with a start value.  </td>
    </tr>


<tr><td valign=\"top\" rowspan=\"2\">within clocked partition</td>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClock\">AssignClock</a></td>
      <td>Assign a clock to a clocked <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized\">AssignClockVectorized</a></td>
      <td>Assign a clock to a clocked <b>vector</b> signal.</td>
    </tr>
</table>

<p>
Additionally, package 
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities\">Utilities</a></td>
contains utility blocks that are used as building blocks for user-relevant blocks.
Especially, block 
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample\">UpSample</a>
can be used in combination with a
<a href=\"modelica://Modelica_Synchronous.RealSignals.Periodic.FIRbyCoefficients\">FIR filter</a>
block to model super-sampling with interpolation and filtering.
</p>
</html>"));
  end Sampler;

  package NonPeriodic
    "Library of blocks that operate on periodically and non-periodically clocked signals"
  extends Modelica.Icons.Package;

    block PI
      "Discrete-time PI controller with clocked input and output signals (for periodic and aperiodic systems using the parameterization of the continuous PI controller)"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      parameter Real k "Gain of continuous PI controller";
      parameter Real T(min=Modelica.Constants.small)
        "Time constant of continuous PI controller";
      output Real x(start=0) "Discrete PI state";
    protected
      Real Ts = interval(u) "Sample time (periodic or non-periodic)";
    equation
      when Clock() then
         x = previous(x) + u*(Ts/T);
         y = k*(x + u);
      end when;

      annotation (defaultComponentName="PI1",
           Icon(graphics={
            Polygon(
              points={{90,-82},{68,-74},{68,-90},{90,-82}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
            Line(points={{-80,76},{-80,-92}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-82},{-80,-10},{-32,-10},{-32,18},{54,18},{54,46},{84,46},
                  {84,78}},
              color={0,0,127},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-32,-4},{80,-58}},
              lineColor={192,192,192},
              textString="PI"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="T=%T"),
            Ellipse(
              extent={{-87,-3},{-75,-15}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-38,24},{-26,12}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{48,52},{60,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
Discrete-time PI controller that has been derived from the continuous-time
PI controller
</p>
<pre>
                 1
   y = k * (1 + ---) * u
                T*s
           T*s + 1
     = k * ------- * u
             T*s
</pre>
<p>
by using the implicit Euler discretization formula. The block is
parametrized with the gain k and the time constant T of the continuous
PI block. As a result, the discrete-time form of the PI controller depends
explicitly on the sample time of the controller and changing this sample time,
will give still a similar performance.
</p>
</html>"));
    end PI;

    block UnitDelay "Delays the clocked input signal for one sample period"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO(
                                                                     u(final start=y_start));
      parameter Real y_start=0 "Value of output signal at first clock tick";
    equation
      y = previous(u);
      annotation (defaultComponentName="unitDelay1",
           Icon(graphics={
            Line(points={{-30,0},{30,0}}, color={0,0,127}),
            Text(
              extent={{-90,10},{90,90}},
              textString="1",
              lineColor={0,0,127}),
            Text(
              extent={{-90,-10},{90,-90}},
              textString="z",
              lineColor={0,0,127}),
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
    extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;

      parameter Integer shift(min=0) = 0
        "Delay = interval() * shift/resolution";
      parameter Integer resolution(min=1) = 1
        "Time quantization resolution of sample interval";
    protected
      parameter Integer n = div(shift,resolution);
      Real u_buffer[n+1](each start=0.0)
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
              color={0,0,127}),
            Text(
              extent={{4,-102},{4,-142}},
              lineColor={0,0,0},
              textString="%shift/%resolution"),
            Ellipse(
              extent={{-90,50},{-70,30}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-30,-30},{-10,-50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,10},{50,-10}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,50},{-40,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{0,-30},{20,-50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{60,10},{80,-10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end FractionalDelay;

  end NonPeriodic;

  package Periodic
    "Library of blocks that are designed to operate only on periodically clocked signals (mainly described by z transforms)"
  extends Modelica.Icons.Package;

    block StateSpace "Discrete-time State Space block"
      parameter Real A[:, size(A, 1)] "Matrix A of state space model";
      parameter Real B[size(A, 1), :] "Matrix B of state space model";
      parameter Real C[:, size(A, 1)] "Matrix C of state space model";
      parameter Real D[size(C, 1), size(B, 2)]=zeros(size(C, 1), size(B, 2))
        "Matrix D of state space model";
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedMIMO(
                 final nin=size(B, 2),
                 final nout=size(C, 1));
      output Real x[size(A, 1)](each start=0.0) "State vector";

    equation
      when Clock() then
        x = A*previous(x) + B*u;
        y = C*previous(x) + D*u;
      end when;
      annotation (
        Documentation(info="<html>
<p>
This block defines the state space representation of a discrete-time block
with input vector u, output vector y and state vector x:
</p>
<pre>
    x = A * previous(x) + B * u
    y = C * previous(x) + D * u
</pre>
<p>
where previous(x) is the value of the clocked state x at
the previous clock tick.
The input is a vector of length nu, the output is a vector
of length ny and nx is the number of states. Accordingly
</p>
<pre>
        A has the dimension: A(nx,nx),
        B has the dimension: B(nx,nu),
        C has the dimension: C(ny,nx),
        D has the dimension: D(ny,nu)
</pre>
<p>
Example:
</p>
<pre>
     parameter: A = [0.12, 2;3, 1.5]
     parameter: B = [2, 7;3, 1]
     parameter: C = [0.1, 2]
     parameter: D = zeros(ny,nu)

results in the following equations:
  [x[1]]   [0.12  2.00] [previous(x[1])]   [2.0  7.0] [u[1]]
  [    ] = [          ]*[              ] + [        ]*[    ]
  [x[2]]   [3.00  1.50] [previous(x[2])]   [0.1  2.0] [u[2]]

                        [previous(x[1])]            [u[1]]
  y[1]   = [0.1  2.0] * [              ] + [0  0] * [    ]
                        [previous(x[2])]            [u[2]]
</pre>
</HTML>
",     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>August 13, 2012</i>
    by <a href=\"http://www.dlr.de/rm/\">Bernhard Thiele</a>:<br>
    Used the code from Blocks.Discrete.StateSpace and converted it into
    the Modelica 3.3 clocked equation style.</li>
</ul>
</html>"),
    Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Text(
              extent={{-90,15},{-15,90}},
              textString="A",
              lineColor={0,0,127}),
            Text(
              extent={{15,15},{90,90}},
              textString="B",
              lineColor={0,0,127}),
            Text(
              extent={{-52,28},{54,-20}},
              textString="z",
              lineColor={0,0,127}),
            Text(
              extent={{-90,-15},{-15,-90}},
              textString="C",
              lineColor={0,0,127}),
            Text(
              extent={{15,-15},{90,-90}},
              textString="D",
              lineColor={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Text(
              extent={{-54,50},{52,-10}},
              lineColor={0,0,0},
              textString="zx=Ax+Bu"),
            Text(
              extent={{-56,14},{54,-50}},
              lineColor={0,0,0},
              textString="  y=Cx+Du"),
            Line(points={{-102,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end StateSpace;

    block TransferFunction "Discrete-time Transfer Function block"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      parameter Real b[:]={1} "Numerator coefficients of transfer function.";
      parameter Real a[:] "Denominator coefficients of transfer function.";

      output Real x[size(a, 1) - 1](each start=0.0)
        "State vector of controller canonical form";
    protected
      parameter Integer nb=size(b, 1) "Size of Numerator of transfer function";
      parameter Integer na=size(a, 1)
        "Size of Denominator of transfer function";
      Real x1;
      Real xext[size(a, 1)];

    equation
      when Clock() then
        /* State variables x are defined according to
       controller canonical form. */
        x1 = (u - a[2:size(a, 1)]*previous(x))/a[1];
        xext = vector([x1; previous(x)]);
        x = xext[1:size(x, 1)];
        y = vector([zeros(na - nb, 1); b])*xext;
      end when;
      annotation (
        Documentation(info="<html>
<p>The <b>discrete transfer function</b> block defines the
transfer function between the input signal u and the output
signal y. The numerator has the order nb-1, the denominator
has the order na-1.</p>
<pre>          b(1)*z^(nb-1) + b(2)*z^(nb-2) + ... + b(nb)
   y(z) = -------------------------------------------- * u(z)
          a(1)*z^(na-1) + a(2)*z^(na-2) + ... + a(na)
</pre>
<p>State variables <b>x</b> are defined according to
<b>controller canonical</b> form. Initial values of the
states can be set as start values of <b>x</b>.<p>
<p>Example:</p>
<pre>     TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>results in the following transfer function:</p>
<pre>        2*z + 4
   y = --------- * u
         z + 3
</pre>

</HTML>
",   revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>August 13, 2012</i>
    by <a href=\"http://www.dlr.de/rm/\">Bernhard Thiele</a>:<br>
    Used the original code from Blocks.Discrete.TransferFunction and converted it into
    the Modelica 3.3 clocked equation style.</li>
<li><i>November 15, 2000</i>
    by <a href=\"http://www.dynasim.se\">Hans Olsson</a>:<br>
    Converted to when-semantics of Modelica 1.4 with special
    care to avoid unnecessary algebraic loops.</li>
<li><i>June 18, 2000</i>
    by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
    Realized based on a corresponding model of Dieter Moormann
    and Hilding Elmqvist.</li>
</ul>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{82,0},{-84,0}}, color={0,0,127}),
            Text(
              extent={{-92,92},{86,12}},
              lineColor={0,0,127},
              textString="b(z)"),
            Text(
              extent={{-90,-12},{90,-90}},
              lineColor={0,0,127},
              textString="a(z)"),
            Text(
              extent={{-200,-105},{200,-145}},
              lineColor={0,0,0},
              textString="b=%b"),
            Text(
              extent={{-200,-150},{200,-190}},
              lineColor={0,0,0},
              textString="a=%a")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(
              points={{40,0},{-44,0}},
              color={0,0,0},
              thickness=0.5),
            Text(
              extent={{-54,54},{54,4}},
              lineColor={0,0,0},
              textString="b(z)"),
            Text(
              extent={{-54,-6},{56,-56}},
              lineColor={0,0,0},
              textString="a(z)"),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255})}));
    end TransferFunction;

    block PI "Discrete-time PI controller"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      parameter Real kd "Gain of discrete PI controller";
      parameter Real Td(min=Modelica.Constants.small)
        "Time constant of discrete PI controller";
      output Real x(start=0) "Discrete PI state";
    equation
      when Clock() then
         x = previous(x) + u/Td;
         y = kd*(x + u);
      end when;

      annotation (defaultComponentName="PI1",
           Icon(graphics={
            Polygon(
              points={{90,-82},{68,-74},{68,-90},{90,-82}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
            Line(points={{-80,76},{-80,-92}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-82},{-80,-10},{-32,-10},{-32,18},{16,18},{16,46},{64,46},
                  {64,80}},
              color={0,0,127},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Text(
              extent={{-30,-4},{82,-58}},
              lineColor={192,192,192},
              textString="PI"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="Td=%Td"),
            Ellipse(
              extent={{-87,-3},{-75,-15}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-37,25},{-25,13}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{9,52},{21,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{58,87},{70,75}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This block defines a discrete-time PI controller by the formula:
</p>
<pre>
// State space form:
   x(ti) = previous(x(ti)) + u(ti)/Td;
   y(ti) = kd*(x(ti) + u(ti));

// Transfer function form:
   y(z) = kd*(c*z-1)/(z-1)*u(z);
          c = 1 + 1/Td
</pre>
<p>
where kd is the gain, Td is the time constant, ti is the time instant
of the i-th clock tick and z is the inverse shift operator.
</p>

<p>
This discrete-time form has been derived from the continuous-time
form of a PI controller by using the implicit Euler discretization formula.
</p>
</html>"));
    end PI;

    block MovingAverage
      "Moving average filter (= FIR filter with coefficients a = fill(1/n,n), but implemented recursively)"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      parameter Integer n = 2
        "Number of points that are averaged (= number of coefficients of corresponding FIR filter)";
    protected
      Real u_buffer[n+1](each start=0.0)
        "The previous values of the inputs; u_buffer[1] = u, u_buffer[2] = previous(u_buffer[1]); u_buffer[3] = previous(u_buffer[2])";
      Boolean first(start=true) "Used to identify the first clock tick";
      Real uu(start=0.0)
        "Dummy variable to provide a dummy start value for u (which has no effect)";
      Real yy(start=0.0)
        "Dummy variable to provide a dummy start value for y (which has no effect)";
    equation
      when Clock() then
         first = false;
         uu = u;

         // At the first clock tick u_last is filled with "u" (to initialize in steady state).
         u_buffer = if previous(first) then fill(uu,n+1) else
                         cat( 1, {uu}, previous(u_buffer[1:n]));

         // Moving average formula
         y = if previous(first) then uu else previous(yy) + (u_buffer[1] - u_buffer[n+1])/n;
         yy = y;
      end when;
      annotation (
        Documentation(info="<HTML>
<p>
This block computes the output y as the average of the input u and of
its past values (= moving average filter):
</p>
<pre>
 y(i) = ( u(i) + u(i-1) + u(i-2) + ... ) / n
</pre>
<p>
where y(i) and u(i) are the values of y and u at clock tick i, and n are the number of
u and past u values that are taken into account.
</p>

<p>
This block could also be implemented with block
<a href=\"modelica://Modelica_Synchronous.Periodic.FIRbyCoefficients\">FIRbyCoefficients</a>
by using the coefficients a = fill(1/n, n). However, block <i>MovingAverage</i> is
a more efficient implementation since it can be implemented recursively,
contrary to a general FIR filter.
</p>

</HTML>
"),     Icon(graphics={
         Line(points={{-84,78},{-84,-90}}, color={192,192,192}),
        Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
          Rectangle(extent={{-84,-82},{-18,4}},
                lineColor={192,192,192}, fillColor={255,255,255},
                fillPattern=FillPattern.Backward),
        Line(points={{-84,30},{-72,30},{-52,28},{-32,20},{-26,16},{-22,12},{-18,6},{
                  -14,-4},{-4,-46},{0,-64},{2,-82}},
                                             color={0,0,127}),
        Polygon(points={{-84,90},{-92,68},{-76,68},{-84,90},{-84,90}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=   FillPattern.Solid),
          Line(points={{2,-82},{4,-64},{8,-56},{12,-56},{16,-60},{18,-66},{20,-82}},
                                                                             color={0,0,127}),
          Line(points={{20,-80},{20,-78},{20,-72},{22,-66},{24,-64},{28,-64},{32,-66},
                  {34,-70},{36,-78},{36,-82},{36,-74},{38,-68},{40,-66},{44,-66},{46,
                  -68},{48,-72},{50,-78},{50,-82},{50,-78},{52,-70},{54,-68},{58,-68},
                  {62,-72},{64,-76},{64,-78},{64,-80},{64,-82}},
                                                color={0,0,127}),
        Polygon(points={{90,-82},{68,-74},{68,-90},{90,-82}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=  FillPattern.Solid),
            Text(
              extent={{-26,88},{88,48}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Backward,
              textString="MA"),
            Text(
              extent={{-150,-110},{150,-150}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="n=%n")}));
    end MovingAverage;

    block FIRbyCoefficients "FIR filter defined by coefficients"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      input Real a[:]={1,1} "Coefficients of FIR filter" annotation(Dialog);

    protected
      parameter Integer n = size(a, 1) - 1 "Order of filter";
      Real u_buffer[n+1](each start=0.0)
        "The previous values of the inputs; u_buffer[1] = u, u_buffer[2] = previous(u_buffer[1]); u_buffer[3] = previous(u_buffer[2])";
      Boolean first(start=true) "Used to identify the first clock tick";
      Real uu(start=0.0)
        "Dummy variable to provide a dummy start value for u (which has no effect)";

    equation
      when Clock() then
         first = false;
         uu = u;

         // At the first clock tick u_last is filled with "u" (to initialize in steady state).
         u_buffer = if previous(first) then fill(uu,n+1) else
                         cat( 1, {uu}, previous(u_buffer[1:n]));

         // FIR formula
         y = a*u_buffer;
      end when;

      annotation (defaultComponentName="FIR1",
        Documentation(info="<HTML>
<p>
This block computes the output y as a linear combination of the input u
and of its past values (= FIR filter):
</p>
<pre>
 y(i) = a[1]*u(i) + a[2]*u(i-1) + a[3]*u(i-2) + ...
</pre>
<p>
where y(i) and u(i) are the values of y and u at clock tick i and
a[:] are the filter coefficients.
</p>
</HTML>
"),     Icon(graphics={
        Polygon(points={{-84,90},{-92,68},{-76,68},{-84,90},{-84,90}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=   FillPattern.Solid),
         Line(points={{-84,78},{-84,-90}}, color={192,192,192}),
        Line(points={{-84,30},{-72,30},{-52,28},{-32,20},{-26,16},{-22,12},{-18,6},{
                  -14,-4},{-4,-46},{0,-64},{2,-82}},
                                             color={0,0,127}),
          Rectangle(extent={{-84,-82},{-18,4}},
                lineColor={192,192,192}, fillColor={255,255,255},
                fillPattern=FillPattern.Backward),
          Line(points={{2,-82},{4,-64},{8,-56},{12,-56},{16,-60},{18,-66},{20,-82}},
                                                                             color={0,0,127}),
          Line(points={{20,-80},{20,-78},{20,-72},{22,-66},{24,-64},{28,-64},{32,-66},
                  {34,-70},{36,-78},{36,-82},{36,-74},{38,-68},{40,-66},{44,-66},{46,
                  -68},{48,-72},{50,-78},{50,-82},{50,-78},{52,-70},{54,-68},{58,-68},
                  {62,-72},{64,-76},{64,-78},{64,-80},{64,-82}},
                                                color={0,0,127}),
        Polygon(points={{90,-82},{68,-74},{68,-90},{90,-82}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=  FillPattern.Solid),
        Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
            Text(
              extent={{-26,86},{88,56}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Backward,
              textString="FIR"),
            Text(
              extent={{-150,-110},{150,-150}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="a=%a")}));
    end FIRbyCoefficients;

    block FIRbyWindow
      "FIR filter defined by filter order, cut-off frequency and window-type"

      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;

      parameter Modelica_Synchronous.Types.FIR_FilterType
                                                      filterType=
          Modelica_Synchronous.Types.FIR_FilterType.LowPass "Type of filter";
      parameter Integer order(min=1) = 2 "Order of filter";
      parameter Modelica.SIunits.Frequency f_cut=1 "Cut-off frequency";
      parameter Modelica_Synchronous.Types.FIR_Window
                                                  window= Modelica_Synchronous.Types.FIR_Window.Kaiser
        "Type of window";
      parameter Real beta=2.12 "Beta-Parameter for Kaiser-window"
          annotation(Dialog(enable = window == Modelica_Synchronous.Types.FIR_Window.Kaiser));

      final output Real a[order+1]=Internal.FIR_coefficients(
          filterType,
          order,
          f_cut,
          interval(u),
          window,
          beta);

      FIRbyCoefficients FIRbyCoefficients1(final a=a)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

    equation
      connect(FIRbyCoefficients1.u, u)
                                      annotation (Line(
          points={{-22,0},{-120,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(FIRbyCoefficients1.y, y)
                                      annotation (Line(
          points={{1,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (defaultComponentName="FIR1",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
         Line(points={{-84,78},{-84,-90}}, color={192,192,192}),
        Polygon(points={{-84,90},{-92,68},{-76,68},{-84,90},{-84,90}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=   FillPattern.Solid),
        Line(points={{-90,-82},{82,-82}}, color={192,192,192}),
        Polygon(points={{90,-82},{68,-74},{68,-90},{90,-82}}, lineColor={192,192,192}, fillColor={192,192,192},
                fillPattern=  FillPattern.Solid),
        Line(points=[-84,30; -72,30; -52,28; -32,20; -26,16; -22,12; -18,6; -14,
                  -4; -4,-46; 0,-64; 2,-82], color={0,0,127}),
          Line(points=[2,-82; 4,-64; 8,-56; 12,-56; 16,-60; 18,-66; 20,-82], color={0,0,127}),
          Line(points=[20,-80; 20,-78; 20,-72; 22,-66; 24,-64; 28,-64; 32,-66; 34,
                  -70; 36,-78; 36,-82; 36,-74; 38,-68; 40,-66; 44,-66; 46,-68; 48,
                  -72; 50,-78; 50,-82; 50,-78; 52,-70; 54,-68; 58,-68; 62,-72; 64,
                  -76; 64,-78; 64,-80; 64,-82], color={0,0,127}),
          Rectangle(extent=[-84,-82; -18,4],
                lineColor={192,192,192}, fillColor={255,255,255},
                fillPattern=FillPattern.Backward),
            Text(
              extent={{-54,52},{100,14}},
              lineColor={192,192,192},
              textString="%order"),
            Text(
              extent={{-150,-110},{150,-150}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="f_cut=%f_cut"),
            Text(
              extent={{-32,92},{82,62}},
              lineColor={175,175,175},
              fillColor={255,255,255},
              fillPattern=FillPattern.Backward,
              textString="FIR")}),
        Documentation(info="<HTML>
<p>
This block computes the output y as a linear combination of the input u
and of its past values (= FIR filter):
</p>
<pre>
 y(i) = a[1]*u(i) + a[2]*u(i-1) + a[3]*u(i-2) + ...
</pre>
<p>
where y(i) and u(i) are the values of y and u at clock tick i and
a[:] are the filter coefficients. Contrary to block
<a href=\"modelica://Modelica_Synchronous.Periodic.FIRbyCoefficients\">FIRbyCoefficients</a>
this block computes the filter coefficients a[:] by design parameters
(filter order, cut-off frequency, filter window)
</p>
</HTML>
"));
    end FIRbyWindow;

    package Internal
      "Internal blocks and functions that are usually of no interest for the user"
    extends Modelica.Icons.Package;
      function FIR_coefficients
        "Calculates the FIR-filter coefficient vector from filter design parameters"
        import FilterType = Modelica_Synchronous.Types.FIR_FilterType;
        input Modelica_Synchronous.Types.FIR_FilterType
                                                    filterType=
            Modelica_Synchronous.Types.FIR_FilterType.LowPass "Type of filter";
        input Integer order(min=1) = 2 "Order of filter";
        input Modelica.SIunits.Frequency f_cut=1 "Cut-off frequency";
        input Modelica.SIunits.Time Ts(min=0) "Sampling period";
        input Modelica_Synchronous.Types.FIR_Window
                                                window= Modelica_Synchronous.Types.FIR_Window.Rectangle
          "Type of window";
        input Real beta=2.12 "Beta-Parameter for Kaiser-window"
            annotation(Dialog(enable = window == Modelica_Synchronous.Types.Window.Kaiser));
        output Real a[order+1] "Filter coefficient vector";

      protected
        constant Real pi=Modelica.Constants.pi;
        Boolean isEven=mod(order,2)==0;
        Real Wc=2*pi*f_cut*Ts;
        Integer i;
        Real w[order + 1];
        Real k;

      algorithm
        assert(filterType == FilterType.LowPass or filterType == FilterType.HighPass and isEven,
               "High pass FIR filters must have an even order");
        assert(f_cut<=1/(2*Ts),"The cut-off frequency f_cut cannot be greater than half the sample frequency (Nyquist frequency),\n" +
                               "i.e. f_cut <= " + String(1/(2*Ts)) + " but is "+String(f_cut));
        w := Internal.FIR_window(order+1, window, beta);
        for i in 1:order + 1 loop
           k := i - 1 - order/2;
           if i - 1 == order/2 then
              a[i] := if filterType == FilterType.LowPass then Wc*w[i]/pi else
                      w[i] - Wc*w[i]/pi;
           else
              a[i] := if filterType == FilterType.LowPass then sin(k*Wc)*
                      w[i]/(k*pi) else w[i]*(sin(k*pi) - sin(k*Wc))/(k*pi);
           end if;
        end for;

        // Scale coefficients, so that the sum is one
        a := a/sum(a);

        annotation (
          Documentation(info="<HTML>
<p>
The FIR-filter synthesis based on the window method. The coefficients are
calculated through a fourier series approximation of the desired amplitude
characteristic. Due to the fact that the Fourier series is truncated, there
will be discontinuities in the magnitude of the filter. Especial at the edge
of the filter the ripple is concentrated (Gibbs-effect). To counteract this,
the filter coefficients are convolved in the frequency domain with the spectrum
of a window function, thus smoothing the edge transitions at any discontinuity.
This convolution in the frequency domain is equivalent to multiplying the filter
coefficients with the window coefficients in the time domain.
</p>
<p>
The filter equation
<pre>
     y(k) = a0*u(k) + a1*u(k-1) + a2*u(k-2) + ... + an*u(k-n)
</pre>
implies that the function outputs n+1 coefficients for a n-th order filter. The
coefficients can be weightened with different kind of windows: Rectangle, Bartlett,
Hann, Hamming, Blackman, Kaiser <br>
The beta parameter is only needed by the Kaiser window.
</p>
</HTML>
"));
      end FIR_coefficients;

      function FIR_window
        "Calculation of n-point weighting window for FIR filter"

        import Window = Modelica_Synchronous.Types.FIR_Window;
        input Integer na "Number of points of weighting window vector";
        input Modelica_Synchronous.Types.FIR_Window
                     window=Window.Kaiser "Type of window";
        input Real beta=2.12 "Beta-Parameter for Kaiser-window";
        output Real a[na] "Weighting window vector a[na]";
      protected
        constant Real pi=Modelica.Constants.pi;
        Integer i=0;
        Real k;
      algorithm
        if window <> Window.Rectangle then
          for i in 1:na loop
            k := i - 1 - (na - 1)/2;
            if window == Window.Bartlett then
              a[i] := 1 - 2*abs(k)/(na - 1);
            elseif window == Window.Hann then
              a[i] := 0.5 + 0.5*cos(2*pi*k/(na - 1));
            elseif window == Window.Hamming then
              a[i] := 0.54 + 0.46*cos(2*pi*k/(na - 1));
            elseif window == Window.Blackman then
              a[i] := 0.42 + 0.5*cos(2*pi*k/(na - 1)) + 0.08*cos(4*pi*k/(na - 1));
            elseif window == Window.Kaiser then
              k := 2*beta*sqrt((i - 1)*(na - i))/(na - 1);
              a[i] := Internal.bessel0(k)/Internal.bessel0(beta);
            else
              Modelica.Utilities.Streams.error("window = " + String(window) + " not known");
            end if;
          end for;
        else
          a := ones(na);
        end if;

        annotation (
          Documentation(info="<HTML>
<p>
Weighting windows are used for digital filter design or spectrum estimation (e.g. DFT)
to increase the quality. In designing FIR-Filter the main role of windowing is to remove
non-ideal effects caused by the endless number of filter coefficients (Gibbs phenomenon).
Multiplying the coefficients with a window damps the coefficients at the beginning and at
the end.
</p>
<p>
The function outputs a L-point vector for a given kind of window. The parameter \"beta\" is
only needed by the Kaiser window. The types of windows are:
</p>
<OL>
<LI>Rectangle</LI>
<LI>Bartlett</LI>
<LI>Hann</LI>
<LI>Hamming</LI>
<LI>Blackman</LI>
<LI>Kaiser</LI>
</OL>
</HTML>
"));
      end FIR_window;

      function bessel0
        "Polynomial approximation of the zeroth order modified Bessel function"

        input Real x;
        output Real y;
      protected
        Real ax;
        Real a;
      algorithm

        ax := abs(x);
        if ax < 3.75 then
          a := (x/3.75)^2;
          y := 1 + a*(3.5156229 + a*(3.0899424 + a*(1.2067492 + a*(0.2659732 + a*
            (0.0360768 + a*0.0045813)))));
        else
          a := 3.75/ax;
          y := exp(ax)/sqrt(ax)*(0.39894228 + a*(0.01328592 + a*(0.00225319 + a*(
            -0.00157565 + a*(0.00916281 + a*(-0.02057706 + a*(0.02635537 + a*(-0.01647633
             + a*0.00392377))))))));
        end if;
        annotation (
          Documentation(info="<HTML>
<p>
Polynomial approximation of the zeroth order modified Bessel function.
The algorithm is taken from
</p>
<dl>
<dt>H. W. Press, S.A. Teukolsky, W. Vetterling:
<dd><b>Numerical Reciepes in C: The Art of Scientific Computing</b><br>
       Cambridge UP, 1988
</dl>
<p>
The function is used to calculate the Kaiser-window via
<i>calcWindow</i>.
</p>
<p><b>Release Notes:</b></p>
<ul>
<li><i>July 10, 2002</i>
       by Nico Walther<br>
       Realized.</li>
</ul>
</HTML>
"));
      end bessel0;

    end Internal;
  end Periodic;

  package Interfaces
    "Library of partial blocks for components with clocked Real signals"
    extends Modelica.Icons.InterfacesPackage;

    partial block SamplerIcon
      "Basic graphical layout of block used for sampling of Real signals"

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
            Line(points={{-100,0},{-45,0}}, color={0,0,127}),
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-35,0},{30,35}}, color={0,0,127}),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{45,0},{100,0}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end SamplerIcon;

    partial block PartialSISOSampler
      "Basic block used for sampling of Real signals"
    extends Modelica_Synchronous.RealSignals.Interfaces.SamplerIcon;
      Modelica.Blocks.Interfaces.RealInput u
        "Connector of continuous-time, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation

    end PartialSISOSampler;

    partial block PartialSISOHold
      "Basic block used for zero order hold of Real signals"

      parameter Real y_start = 0.0
        "Value of output y before the first tick of the clock associated to input u";

      Modelica.Blocks.Interfaces.RealInput u(final start=y_start)
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of continuous-time, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));

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
                                   Line(points={{-60,-40},{-20,-40},{-20,20},{20,20},
                  {20,60},{60,60},{60,0},{100,0},{100,0},{100,0},{100,0},{120,0}},
                                     color={0,0,127}), Line(
              points={{-60,-40},{-60,0},{-100,0}},
              color={0,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-200,-80},{200,-145}},
              lineColor={0,0,0},
            textString="%y_start"),
            Text(
              extent={{-200,129},{200,64}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<HTML>

</HTML>
"),     Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06)));
    end PartialSISOHold;

    partial block PartialClockedSISO
      "Block with clocked single input and clocked single output Real signals"
      extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;

      Modelica.Blocks.Interfaces.RealInput u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));

      annotation (Icon(graphics));
    end PartialClockedSISO;

    partial block PartialClockedMIMO
      "Block with multiple clocked input and multiple clocked output Real signals"
      extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;

      parameter Integer nin=1 "Number of inputs";
      parameter Integer nout=1 "Number of outputs";

      Modelica.Blocks.Interfaces.RealInput u[nin]
        "Connector of clocked, Real input signals"
                                   annotation (Placement(transformation(extent=
              {{-140,-20},{-100,20}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y[nout]
        "Connector of clocked, Real output signals"
                                    annotation (Placement(transformation(extent=
             {{100,-10},{120,10}}, rotation=0)));

      annotation (Icon(graphics));
    end PartialClockedMIMO;

    partial block PartialNoise
      "Interface for SISO blocks with Real signals that add noise to the signal"
      extends Modelica_Synchronous.RealSignals.Interfaces.PartialClockedSISO;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end PartialNoise;
  end Interfaces;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that operate on clocked Real signals.
Especially blocks are provided to transform from continuous-time Real signals to
clocked Real signals (with Sampler blocks) and vice versa
(with Hold blocks), as well as to transform a clocked Real signal to
another (time-synchronized) clock.
</p>
</html>"));
end RealSignals;


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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Sample\">RealSignals.Sampler.Sample</a>).
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleClocked\">RealSignals.Sampler.SampleClocked</a>).
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SampleVectorizedAndClocked\">RealSignals.Sampler.SampleVectorizedAndClocked</a>).
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
        Documentation(info="<HTML>
<p>
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Hold\">RealSignals.Sampler.Hold</a>).
</p>
</HTML>
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SubSample\">RealSignals.Sampler.SubSample</a>).
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.SuperSample\">RealSignals.Sampler.SuperSample</a>).
</p>
</html>"));
    end SuperSample;

    block ShiftSample "Shift (delay) input for some clock ticks"
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
              lineColor={255,128,0},
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.ShiftSample\">RealSignals.Sampler.ShiftSample</a>).
</p>
</html>"));
    end ShiftSample;

    block BackSample
      "Shift clock of input backwards in time (and access the most recent value of the input at this new clock)"
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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.BackSample\">RealSignals.Sampler.BackSample</a>).
</p>
</html>"));
    end BackSample;

    block AssignClock "Assigns a clock to a signal"

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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClock\">RealSignals.Sampler.AssignClock</a>).
</p>
</html>"));
    end AssignClock;

    block AssignClockVectorized "Assigns a clock to a signal vector"

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
This block for Boolean signals works similar as the corresponding block for Real signals (see <a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.AssignClockVectorized\">RealSignals.Sampler.AssignClockVectorized</a>).
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
This block for Boolean signals works similar as the corresponding block for Real signals (see 
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.UpSample\">RealSignals.Sampler.Utilities.UpSample</a>).
</p>
</html>"));
      end UpSample;

        block AssignClockToTriggerHold
        "Generate a boolean continuous time trigger signal from a clocked Boolean input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
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
This block for Boolean signals works similar as the corresponding block for Real signals (see 
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToTriggerHold\">RealSignals.Sampler.Utilities.AssignClockToTriggerHold</a>).
</p>
</html>"));
        end AssignClockToTriggerHold;

        block AssignClockToSquareWaveHold
        "Generate a boolean continuous time square signal from a clocked real input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
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
This block for Boolean signals works similar as the corresponding block for Real signals (see 
<a href=\"modelica://Modelica_Synchronous.RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold\">RealSignals.Sampler.Utilities.AssignClockToSquareWaveHold</a>).
</p>

</html>"));
        end AssignClockToSquareWaveHold;

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
  end Interfaces;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that operate on clocked Boolean signals.
Especially blocks are provided to transform from continuous-time Boolean signals to
clocked Boolean signals (with Sampler blocks) and vice versa
(with Hold blocks), as well as to transform a clocked Boolean signal to
another (time-synchronized) clock.
</p>
</html>"));
end BooleanSignals;


package IntegerSignals "Library of clocked blocks for Integer signals"
  extends Modelica.Icons.Package;
  package Sampler "Library of sampler and hold blocks for Integer signals"
    extends Modelica.Icons.Package;

    block Sample
      "Sample the continuous-time, Real input signal and provide it as clocked output signal (clock is infered)"
      extends Modelica_Synchronous.IntegerSignals.Interfaces.PartialSISOSampler;

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

</html>"));
    end Sample;

    block SampleClocked
      "Sample the continuous-time, Integer input signal and provide it as clocked output signal. The clock is provided as input signal"
      extends Modelica_Synchronous.IntegerSignals.Interfaces.SamplerIcon;
      Modelica_Synchronous.ClockSignals.Interfaces.ClockInput
                                                 clock
        "Output signal y is associated with this clock input"                           annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of continuous-time, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal"
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

</html>"));
    end SampleClocked;

    block SampleVectorizedAndClocked
      "Sample the continuous-time, Integer input signal vector and provide it as clocked output signal vector. The clock is provided as input signal"
      extends Modelica_Synchronous.IntegerSignals.Interfaces.SamplerIcon;
      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.IntegerInput
                                           u[n]
        "Connector of continuous-time, Integer input signal vector"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0), iconTransformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y[n]
        "Connector of clocked, Integer output signal vector"
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

</html>"));
    end SampleVectorizedAndClocked;

    block Hold
      "Hold the clocked, Integer input signal and provide it as continuous-time output signal (zero order hold)"
      extends Modelica_Synchronous.IntegerSignals.Interfaces.PartialSISOHold;
      parameter Integer y_start = 0
        "Value of output y before the first tick of the clock associated to input u";

    equation
        y = hold(u);

      annotation (
        defaultComponentName="hold1",
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics={
            Ellipse(
              extent={{-70,-28},{-50,-48}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-30,28},{-10,8}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{10,70},{30,50}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{52,12},{72,-8}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-200,-80},{200,-145}},
              lineColor={0,0,0},
              textString="%y_start")}),
        Documentation(info="<HTML>

</HTML>
"),     Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end Hold;

    block SubSample
      "Sub-sample the clocked Integer input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if sub-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Sub-sampling factor >= 1 (ignored if inferFactor=true)"
                                                                annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal (clock of y is slower as clock of u)"
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
              color={255,128,0}),
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
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{45,15},{75,-15}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-46,-20},{-26,-40}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{4,71},{24,51}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{57,3},{63,-3}},
              lineColor={255,128,0},
              fillColor={255,128,0},
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

</html>"));
    end SubSample;

    block SuperSample
      "Super-sample the clocked Integer input signal and provide it as clocked output signal"
      parameter Boolean inferFactor=true
        "= true, if super-sampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
      parameter Integer factor(min=1)=1
        "Super-sampling factor >= 1 (ignored if inferFactor=true)"
                                                    annotation(Evaluate=true, Dialog(enable=not inferFactor));

      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal (clock of y is faster as clock of u)"
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
            preserveAspectRatio=true,
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
                                     color={255,128,0},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-100,0}},
              color={255,128,0},
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
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-83,-57},{-77,-63}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-15,96},{15,66}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,83},{3,77}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{65,16},{95,-14}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{77,3},{83,-3}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-48,-46},{-18,-76}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{34,96},{64,66}},
              lineColor={255,128,0},
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

</html>"));
    end SuperSample;

    block ShiftSample "Shift (delay) input for some clock ticks"
      parameter Integer shiftCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation for 'shiftCounter/resolution*interval(u)' seconds"));

      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal"
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
                                     color={255,128,0},
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
                                     color={255,128,0},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={255,128,0},
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
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.06),
                         graphics),
        Documentation(info="<html>
<p><i>The first activation of the clock of y = shiftSample(..) is shifted in time shiftCounter/resolution*interval(u) later than the first activation of the clock of u.</i></p>
<p>Conceptually, the operator constructs a clock &ldquo;cBase&rdquo; <b>Clock</b> cBase = <b>subSample</b>(<b>superSample</b>(u, resolution), shiftCounter) and the clock of y = <b>shiftSample</b>(..) starts at the second clock tick of cBase. At every tick of the clock of y, the operator returns the value of u from the last tick of the clock of u.</p>
<p>Note, due to the restriction of <b>superSample</b> on Boolean clocks, <b>shiftSample</b> can only shift the number of ticks of the Boolean clock, but cannot introduce new ticks.</p>
<p>Also note that the operator does not simply shift the signal in time, since only the value of u from the last tick of the clock of u is available at the output.</p>
</html>"));
    end ShiftSample;

    block BackSample
      "Shift clock of input backwards in time (and access the most recent value of the input at this new clock)"
      parameter Integer backCounter(min=0)=0 "Numerator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer resolution(min=1)=1 "Denominator of shifting formula"
            annotation(Dialog(group="Shift first clock activation backwards in time for 'shiftCounter/resolution*interval(u)' seconds"));
      parameter Integer y_start=0
        "Value of output y before the first clock tick of the input u";

      Modelica.Blocks.Interfaces.IntegerInput
                                           u(start=y_start)
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal (clock of y is faster als clock of u)"
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
                                     color={255,128,0},
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
                                     color={255,128,0},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-40},{-70,-60}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,60},{-30,40}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-16,0},{4,20},{4,10},{34,10},{34,-10},{4,-10},{4,-20},{-16,0}},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              lineColor={95,95,95}),
            Ellipse(
              extent={{10,-40},{30,-60}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{50,60},{70,40}},
              lineColor={255,128,0},
              fillColor={255,128,0},
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

</html>"));
    end BackSample;

    block AssignClock "Assigns a clock to a signal"

      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Integer output signal"
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
                  0},{80,0},{100,0}},color={255,128,0},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={255,128,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={255,128,0},
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

</html>"));
    end AssignClock;

    block AssignClockVectorized "Assigns a clock to a signal vector"

      parameter Integer n(min=1)=1
        "Size of input signal vector u (= size of output signal vector y)";
      Modelica.Blocks.Interfaces.IntegerInput
                                           u[n]
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y[n]
        "Connector of clocked, Integer output signal"
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
                  0},{80,0},{100,0}},color={255,128,0},
              pattern=LinePattern.Dot),                Line(
              points={{-80,-60},{-80,0},{-106,0}},
              color={255,128,0},
              smooth=Smooth.None,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-90,-50},{-70,-70}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,10},{-30,-10}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-10,90},{10,70}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,50},{50,30}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,10},{90,-10}},
              lineColor={255,128,0},
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

</html>"));
    end AssignClockVectorized;

    package Utilities "Utility components that are usually not directly used"
       extends Modelica.Icons.Package;

      block UpSample
        "Upsample the clocked Integer input signal and provide it as clocked output signal"

        parameter Boolean inferFactor=true
          "= true, if upsampling factor is inferred"  annotation(Evaluate=true, choices(__Dymola_checkBox=true));
        parameter Integer factor(min=1)=1
          "Upsampling factor >= 1 (if inferFactor=false)" annotation(Evaluate=true, Dialog(enable=not inferFactor));
        Modelica.Blocks.Interfaces.IntegerInput
                                             u
          "Connector of clocked, Integer input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
        Modelica.Blocks.Interfaces.IntegerOutput
                                              y
          "Connector of clocked, Integer output signal (clock of y is faster as clock of u)"
          annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
      protected
        Integer dummy annotation(HideResult=true);
        Boolean b(start=false);
        Boolean b_super(start=false);
        Integer u_super;
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
           y = if b_super <> previous(b_super) then u_super else 0;
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
                    {100,0}},          color={255,128,0},
                pattern=LinePattern.Dot),                Line(
                points={{-80,-60},{-80,0},{-100,0}},
                color={255,128,0},
                smooth=Smooth.None,
                pattern=LinePattern.Dot),
              Text(
                extent={{-200,175},{200,110}},
                lineColor={0,0,255},
                textString="%name"),
              Ellipse(
                extent={{-95,-45},{-65,-75}},
                lineColor={255,128,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-83,-57},{-77,-63}},
                lineColor={255,128,0},
                fillColor={255,128,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{25,96},{55,66}},
                lineColor={255,128,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{37,83},{43,77}},
                lineColor={255,128,0},
                fillColor={255,128,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-55,16},{-25,-14}},
                lineColor={255,128,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-6,16},{24,-14}},
                lineColor={255,128,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{64,16},{94,-14}},
                lineColor={255,128,0},
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

</html>"));
      end UpSample;

        block ClockedIntegerToBooleanTriggerHold
        "Generate a boolean continuous time trigger signal from a clocked Integer input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
          Modelica.Blocks.Interfaces.IntegerInput
                                               u
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
          Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Boolean output signal"     annotation (Placement(
                transformation(extent={{100,-10},{120,10}}, rotation=0),
                iconTransformation(extent={{100,-10},{120,10}})));
      protected
          Boolean y2(start=y_start);
          Boolean y3(start=y_start, fixed=true);
          Real uu annotation(HideResult=true);
        equation
          when Clock() then
             uu = u "Dummy assignment to relate clock of u with y2";
             y2 = not previous(y2);
          end when;
          y3 = hold(y2);
          y = change(y3);
          annotation (
            defaultComponentName="ClockedSignalToTrigger",
            Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={            Ellipse(
                  extent={{71,7},{85,-7}},
                  lineColor= {235,235,235},
                  fillColor= {235,235,235},
                  fillPattern=FillPattern.Solid),
              Line(points={{-70,-70},{-70,70}}, color={0,0,0}),
              Line(points={{-30,-70},{-30,70}}, color={0,0,0}),
              Line(points={{10,-70},{10,70}}, color={0,0,0}),
              Line(points={{50,-70},{50,70}}, color={0,0,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
The Boolean output y is a conditional trigger signal. The output y is <b>true</b>
at sample times (defined by parameter <b>period</b>) and if input enable = <b>true</b>, otherwise it is
<b>false</b>.
</p>

</html>"));
        end ClockedIntegerToBooleanTriggerHold;

        block ClockedIntegerToBooleanSquareHold
        "Generate a boolean continuous time square signal from a clocked Integer input"
          extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;
          parameter Boolean y_start=false "initial value of output signal";
          Modelica.Blocks.Interfaces.IntegerInput
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
          y2 = if u > 0 then not previous(y2) else not previous(y2);
          y = hold(y2);
          annotation (
            defaultComponentName="ClockedSignalToSquare",
            Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={            Ellipse(
                  extent={{71,7},{85,-7}},
                  lineColor={235,235,235},
                  fillColor={235,235,235},
                  fillPattern=FillPattern.Solid),
                                       Line(points={{-80,-42},{-54,-42},{-54,0},{-28,0},
                      {-28,24},{-8,24},{-8,64},{16,64},{16,20},{36,20},{36,0},{42,0},{42,
                      0},{60,0}},        color={255,128,0})}),
            Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
            Documentation(info="<html>
<p>
The Boolean output y is a conditional trigger signal. The output y is <b>true</b>
at sample times (defined by parameter <b>period</b>) and if input enable = <b>true</b>, otherwise it is
<b>false</b>.
</p>

</html>"));
        end ClockedIntegerToBooleanSquareHold;

    end Utilities;
    annotation (Documentation(info="<html>
<p>
This package contains blocks that mark boundaries of a clocked partition
and transform an <b>Integer</b> signal from one partition to the next. Especially, 
the following blocks are provided:<br>&nbsp;
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"3\">
<tr><th align=\"left\"><b>Boundary Type</b></th>
    <th align=\"left\"><b>Block Name</b></th>
    <th align=\"left\"><b>Description</b></th></tr>

<tr><td valign=\"top\" rowspan=\"3\">continuous-time &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.Sample\">Sample</a></td>
      <td>Sample a continuous-time signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.SampleClocked\">SampleClocked</a></td>
      <td>Sample and associate a clock to the sampled <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.SampleVectorizedAndClocked\">SampleVectorizedAndClocked</a></td>
      <td>Sample an input vector and associate a clock to the sampled <b>vector</b> signal.</td>
    </tr>

<tr><td valign=\"top\">clocked &rarr; continuous-time</td>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.Hold\">Hold</a></td>
      <td>Hold a clocked signal with zero-order hold.</td>
    </tr>

<tr><td valign=\"top\" rowspan=\"4\">clocked &rarr; clocked</td>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.SubSample\">SubSample</a></td>
      <td>Sub-sample a signal (output clock is slower as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.SuperSample\">SuperSample</a></td>
      <td>Super-sample a signal (output clock is faster as input clock). </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.ShiftSample\">ShiftSample</a></td>
      <td>Shift a signal (output clock is delayed with respect to input clock).  </td>
    </tr>

    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.BackSample\">BackSample</a></td>
      <td>Shift a signal and start the output clock before the input clock with a start value.  </td>
    </tr>


<tr><td valign=\"top\" rowspan=\"2\">within clocked partition</td>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.AssignClock\">AssignClock</a></td>
      <td>Assign a clock to a clocked <b>scalar</b> signal.</td>
    </tr>
    <tr>
      <td><a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.AssignClockVectorized\">AssignClockVectorized</a></td>
      <td>Assign a clock to a clocked <b>vector</b> signal.</td>
    </tr>
</table>

<p>
Additionally, package 
<a href=\"modelica://Modelica_Synchronous.IntegerSignals.Sampler.Utilities\">Utilities</a></td>
contains utility blocks that are used as building blocks for user-relevant blocks.
</p>
</html>"));
  end Sampler;

  package NonPeriodic
    "Library of blocks that operate on periodically and non-periodically clocked signals"
  extends Modelica.Icons.Package;

    block UnitDelay "Delays the clocked input signal for one sample period"
      extends Modelica_Synchronous.IntegerSignals.Interfaces.PartialClockedSISO(
                                                                        u(final start=y_start));
      parameter Integer y_start=0 "Value of output signal at first clock tick";
    equation
      y = previous(u);
      annotation (defaultComponentName="UnitDelay1",
           Icon(graphics={
            Line(points={{-30,0},{30,0}}, color={255,128,0}),
            Text(
              extent={{-90,10},{90,90}},
              textString="1",
              lineColor={255,128,0}),
            Text(
              extent={{-90,-10},{90,-90}},
              textString="z",
              lineColor={255,128,0}),
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
    extends Modelica_Synchronous.IntegerSignals.Interfaces.PartialClockedSISO;

      parameter Integer shift(min=0) = 0
        "Delay = interval() * shift/resolution";
      parameter Integer resolution(min=1) = 1
        "Time quantization resolution of sample interval";
    protected
      parameter Integer n = div(shift,resolution);
      Integer u_buffer[n+1](each start=0)
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
              color={255,128,0}),
            Text(
              extent={{4,-102},{4,-142}},
              lineColor={0,0,0},
              textString="%shift/%resolution"),
            Ellipse(
              extent={{-90,50},{-70,30}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-30,-30},{-10,-50}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{30,10},{50,-10}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,50},{-40,30}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{0,-30},{20,-50}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{60,10},{80,-10}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end FractionalDelay;

  end NonPeriodic;

  package Interfaces
    "Library of partial blocks for components with clocked Integer signals"
    extends Modelica.Icons.InterfacesPackage;

    partial block SamplerIcon
      "Basic graphical layout of block used for of Integer signals"

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
            Line(points={{-100,0},{-45,0}}, color={255,128,0}),
            Ellipse(
              extent={{-25,-10},{-45,10}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-35,0},{30,35}}, color={255,128,0}),
            Ellipse(
              extent={{45,-10},{25,10}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{45,0},{100,0}}, color={255,128,0})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end SamplerIcon;

    partial block PartialSISOSampler
      "Basic block used for sampling of Integer signals"
    extends Modelica_Synchronous.IntegerSignals.Interfaces.SamplerIcon;
      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of continuous-time, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));
    equation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end PartialSISOSampler;

    partial block PartialSISOHold
      "Basic block used for zero order hold of Integer signals"

      parameter Integer y_start = 0
        "Value of output y before the first tick of the clock associated to input u";

      Modelica.Blocks.Interfaces.IntegerInput
                                           u(final start=y_start)
        "Connector of clocked, Integer input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of continuous-time, Integer output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));

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
                                   Line(points={{-60,-40},{-20,-40},{-20,20},{20,20},
                  {20,60},{60,60},{60,0},{100,0},{100,0},{100,0},{100,0},{120,0}},
                                     color={255,128,0}),
                                                       Line(
              points={{-60,-40},{-60,0},{-100,0}},
              color={255,128,0},
              smooth=Smooth.None),
            Text(
              extent={{-200,-80},{200,-145}},
              lineColor={0,0,0},
              textString="%y_start"),
            Text(
              extent={{-200,129},{200,64}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(info="<HTML>

</HTML>
"),     Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.06), graphics));
    end PartialSISOHold;

    partial block PartialClockedSISO
      "Block with clocked single input and clocked single output Integer signals"
      extends Modelica_Synchronous.ClockSignals.Interfaces.ClockedBlockIcon;

      Modelica.Blocks.Interfaces.IntegerInput
                                           u
        "Connector of clocked, Real input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
            rotation=0)));
      Modelica.Blocks.Interfaces.IntegerOutput
                                            y
        "Connector of clocked, Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
            rotation=0)));

      annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-100},{100,100}}), graphics));
    end PartialClockedSISO;
  end Interfaces;
  annotation (Documentation(info="<html>
<p>
This package contains blocks that operate on clocked Integer signals.
Especially blocks are provided to transform from continuous-time Integer signals to
clocked Integer signals (with Sampler blocks) and vice versa
(with Hold blocks), as well as to transform a clocked Integer signal to
another (time-synchronized) clock.
</p>
</html>"));
end IntegerSignals;


  package Types "Library of types with choices, especially to build menus"
  extends Modelica.Icons.Package;

    type SolverMethod = String
    "Enumeration defining the integration method to solve differential equations in a clocked discretized continuous-time partition"
    annotation(choices(
       choice=" "
        "Do not use any solver (partition is forced to not contain differential equations)",
       choice="External" "Solver specified externally",
       choice="ExplicitEuler" "Explicit Euler method (order 1)",
       choice="ExplicitMidPoint2" "Explicit mid point rule (order 2)",
       choice="ExplicitRungeKutta4" "Explicit Runge-Kutta method (order 4)",
       choice="ImplicitEuler" "Implicit Euler method (order 1)",
       choice="ImplicitTrapezoid" "Implicit trapezoid rule (order 2)"));
    type Resolution = enumeration(
      y "y (year)",
      d "d (day)",
      h "h (hour)",
      min "min (minutes)",
      s "s (seconds)",
      ms "ms (milli seconds)",
      us "us (micro seconds)",
      ns "ns (nano seconds)")
    "Enumeration defining the resolution of a clocked signal" annotation (
      Documentation(info="<html>
<p>
Enumeration defining the resolution of a clock signal, especially
of the clock signal generated by block
<a href=\"modelica://Modelica_Synchronous.Clocks.PeriodicExactClock\">PeriodicExactClock</a>.
The following values are possible:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.Resolution.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">y</td>
    <td valign=\"top\">year (= 365*24*60*60 seconds)</td></tr>

<tr><td valign=\"top\">d</td>
    <td valign=\"top\">day (= 24*60*60 seconds)</td></tr>

<tr><td valign=\"top\">h</td>
    <td valign=\"top\">hour (= 60*60 seconds)</td></tr>

<tr><td valign=\"top\">min</td>
    <td valign=\"top\">minute (= 60 seconds)</td></tr>

<tr><td valign=\"top\">s</td>
    <td valign=\"top\">seconds</td></tr>

<tr><td valign=\"top\">ms</td>
    <td valign=\"top\">milli seconds (= 1/1000 seconds)</td></tr>


<tr><td valign=\"top\">us</td>
    <td valign=\"top\">micro seconds (= 1/(1000*1000) seconds)</td></tr>


<tr><td valign=\"top\">ns</td>
    <td valign=\"top\">nano seconds (= 1/(1000*1000*1000) seconds)</td></tr>
</table>



</html>"));

    type FIR_FilterType = enumeration(
      LowPass "Low pass filter",
      HighPass "High pass filter")
    "Enumeration defining the type of a FIR filter (high pass or low pass filter)"
        annotation (Evaluate=true, Documentation(info="<html>
</html>"));

    type FIR_Window = enumeration(
      Rectangle,
      Bartlett,
      Hann,
      Hamming,
      Blackman,
      Kaiser) "Enumeration defining the window type for a FIR filter"
        annotation (Evaluate=true, Documentation(info="<html>

</html>"));
  annotation (Documentation(info="<html>
<p>
This package contains enumeration definitions utilized
in blocks of the Modelica_Synchronous package.
</p>
</html>"));
  end Types;


  annotation (preferredView="info",
  uses(Modelica(version="3.2")),
    version="0.91",
    versionBuild=0,
    versionDate="2012-09-20",
    dateModified = "2012-09-20 09:27:58Z",
    revisionId="$Id::                                       $",
  Documentation(info="<html>
<p>
Library <b>Modelica_Synchronous</b> is a Modelica package
to precisely define and synchronize sampled data systems with different sampling rates.
The library has elements to define periodic clocks and event clocks that trigger elements to sample, sub-sample, super-sample, or shift-sample partitions synchronously. Optionally, quantization effects, computational delay or noise can be simulated. Continuous-time equations can be automatically discretized and utilized in a sampled data system. The sample rate of
a partition need to be defined only at one location. All Modelica libraries designed so far for sampled systems, such as Modelica.Blocks.Discrete or Modelica_LinearSystems2.Controller
are becoming obsolete and instead Modelica_Synchronous should be utilized instead.
</p>

<p>
In the following figure a simple sampled data system is show, where the borders of the
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
<tr><td style=\"vertical-align: top;\"><b>Copyright &copy; 2012, DLR Institute of System Dynamics and Control</b></td>
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
