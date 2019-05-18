# Coding and data 

Social science is directed toward the "dual goals" of describing and explaining
[@king_designing_1994 34]. While we cannot theorize and explain without proper
description, description is only really interesting if it can be connected to
some goal of explanation or reasoning. 

The seemingly simple act of description is perhaps understudied. "Of all the
skills that go into the growth of social science knowledge", writes
@singer_variables_1982 [212], "the least developed is that of data generation".
While, as I will argue in this chapter, the availability and quality of data is
very important for scientific progress, the production of new data has
apparently not been given much scholarly attention in itself.  I will argue
that the defining characteristic of scientific observation is systematicity.
This is what sets data coding apart from "mere" observation.  Coding, or
"data-making" is thus defined as the application of rules to a set of
observations. Furthermore, understanding the set of rules and the way they were
applied is key to be able to reason about data. 

The purpose of this chapter is to establish the theory with which I developed a
text coding system. By first describing what data is, and how it is made
through the process of measurement, I establish several formalizations that
will be useful in the following chapters when discussing how to computerize the
process using statistical learning techniques.  While this chapter focuses on
the basic definitions of data creation, the next chapter describes the specific
process of coding ceasefires from newspaper data.

I approach the process of coding by first giving a brief definition of the
outcome of the process: Structured data. This definition makes it possible to
reason about, and explain the elements of process of coding in terms of their
effect on the qualities of data. These qualities make it possible to
normatively assess different ways of producing data, as high quality is a
prerequisite for further meaningful analysis.

Once the outcome of the process has been thoroughly defined, I focus on the
process of creating data. A formalization of data-making is given, that makes
it possible to reason about how to achieve good data quality. This
formalization also forms the basis of my argument that data-making is a process
that is essentially similar to classification as defined in computer science.
This is what makes the algorithmic approach to data-making, which is presented
in the following chapters, theoretically viable. 

## Definition of Data 

A datum is essentially just a statement of something that was: An existential
statement that refers to some state, condition or event that has existed
@singer_variables_1982. Datum is a Latin word, which originally means "a
given". Data can thus be interpreted as "what is given" for an analysis, or
rather, what is taken to be true; the premise for an argument.  In this broad
sense, Any kind of perception or record, ephemeral or permanent, is data. Data
is synonymous with information; perceived and recorded bits that refer to some
fact, notion or state.

The first step in data making is selection, or judging the relevance of
possible observations.  Reality is an intractable mass of information, and the
world is full of an infinite number of facts. When seeking knowledge about some
particular phenomenon, it becomes necessary to make judgments about relevance,
to seek the "signal" in the "sea of noise" [@singer_variables_1982 196]. This
is called selection, and is the first of two necessary steps
[@singer_data-making_1965 69] from "raw" to structured data. 

The next step is classification, or structured comprehension of the signal
observations. In a sense, this is also a kind of selection process, as it
involves choosing a set of attributes that will be expressed as data, and
naming these attributes. Essentially, once what we want to study has been
defined, we also need to decide what it is about our objects of study, that is
relevant. A "data language", which determines what attributes are relevant for
observation,is the Rosetta stone that mediates between the unstructured matter
of observation and the structured matter of data [@krippendorff_content_2004
150]. 

When combined, the act of selection and classification constitute structured
data; collections of bits of information that are curated and recorded
according to a given set of procedures. This is, as @king_designing_1994 [42]
points out, an act of simplification of reality, and it is one of the most
difficult tasks in social science. 

The virtue of a simplifying structure, however, is that it facilitates
analysis: Since the same procedures for structuring observations are applied to
multiple cases, the resultant values can be meaningfully compared in many
useful ways. However, the "conceptual screening" [@singer_data-making_1965 69]
that is performed on raw information to produce data is not a neutral, a fact
that warrants critical assessment of data. Data should be thought of as more
than mere fact, but rather a marriage of fact and the observational scheme
[@krippendorff_content_2004 81].

### Ways of structuring data

There are many conceiveable ways of structuring data. A data structure is an
ordering principle that determines how the points of data should be considered
in relation to one another. 

@codd_relational_1970 created an influential and foundational data structure:
Through what is termed the relational model, or relational theory
[@date_database_2001 5] of data, it is possible to define some basic properties
and traits of data, that serve as a practical foundation for this discussion.

The relational model states that structured data are organized into relations,
which might also be called tables. A relation has columns, which
@codd_relational_1970 also call domains, and rows. Rows are distinct tuples
containing one value from each domain. Importantly, domains hold a single
significance, or meaning, representing some category or kind of information. 
 
What is useful about Codds relational model of data, is that it emphasizes an
important aspect of structured data; the relatedness of the rows _through_ the
domains. This means that rows can be compared as similar but distinct instances
having values in the same domains, meaning that they hold some value of
information in the same categories, or rather, variables. This assumption of
comparability and structured difference in terms of the variables makes the
rows comparable.

This is best illustrated by the later specification of "Tidy data"
[@wickham_tidy_2014], a special case of relational data that is designed to
easily yield itself to analysis. Tidy data is summarized through three
principles, that form a standard for how the semantics and the structure of
data should be related (ibid. 4): 

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

The idea that observations can be seen as related through their traits requires
an assumption of relatedness and difference. The segregation of observational
units into separate tables (3) depends on the assumption of difference between
the units, and the collection of values under a single given variable column
(2) depends on the assumption of equality of the values in terms of the
dimension that they express. In other words, the units are distinct, but
comparable.

The fact that Tidy data yields itself to analysis is important, because
analyzability might be said to be the main motivation behind the difficult and
costly enterprise of scientific observation [@krippendorff_content_2004 146].
While other kinds of structures, such as graphs or dictionaries are also
analyzable, the readily analyzable form of unit-tables where the units can be
compared in terms of a given set of variables is a useful model to aim for when
determining how the data should be structured before collection can begin. 

## Making data 

Data creation can refer to a wide variety of methods, with the common element
that information is recorded in some structured, predetermined way. The method
applied in the following chapters is Content Analysis, defined as the
systematic comprehension of text according to a given procedure
[@holsti_content_1969 5], or rather Coding, which is defined as a process where
raw data is transformed into structured data (ibid. 94).

[@king_designing_1994 51] The creation of data starts with a conceptualization,
which is a systematic formulation of some concept of interest [@adcock_measurement_2001 529]: 
The researcher starts with an interest in a concept or domain, and must develop
some systematic idea about how the concept is manifested in the form of
empirical fact. Indeed, we must start with some idea of what we want to explain
[@king_designing_1994 51], because we need to be able to discern between
relevant and irrelevant facts about the objects we are looking at. 

Thus, structured data is not observed, but created.  The codebook,
instructions, coding guide or computer program used to process the raw
information connects the structured and unstructured data; linking the
phenomena and the theoretical backdrop in which the data is framed. Central
questions include, how the coding categories are defined, what the units of
analysis are, and how the units will map to these to the categories
[@holsti_content_1969 94]. This must all be established a-priori, before
structured observations can be recorded [@neuendorf_content_2017 18].

Why not instead start with the observations rather than the conceptualization?
The emphasis on comparability and sameness in terms of the attributes, rather
than the uniqueness of each case can seem overly reductive, especially in in
the social sciences. Indeed, interesting properties are inevitably lost when
selecting some attributes and objects, and ignoring the rest, "imposing"
a structure on the phenomena.

Uniqueness can on the other hand overshadow the "useful" comparable attributes,
and lead to excessive nominalism [@friedrich_general_1966 70], an undue focus
on the particular overshadowing the universal.  While the world is made up of
particulars, "good social science attempts to go beyond these particulars to
more general knowledge" [@king_designing_1994 35] in terms of overarching
theory. 

In addition, as @holsti_content_1969 [94] notes, data collection simply cannot
proceed without a motivating reason, an idea about why the data might be
important to have. Structured observation rarely ever proceeds without some
idea of what the data will be able to illuminate [@friedrich_general_1966 71].
This fact is of course also compounded by the enormous practical effort
required to perform data collection at scale.

### Data and theory

A set of observations could be observed and named in an arbitrary number of
ways. Choosing a scheme, and defining what is relevant and what is not about
the objects of study, is an act built on theoretical assumptions, of course
related to the problem domain from which the data collection effort starts.
Thus, every data-making scheme is laden with a set of theoretical assumptions
[@holsti_content_1969 94]. 

This is one of the elements that makes being open about the coding procedure,
the instructions, operationalizations and even prior rationalization of the
data gathering, so important.  While arguably all cognition relies on some sort
of prior understanding, explication makes it possible to reason about the
theory and assumptions that underlie data: The schematic and explicit nature of
coding allows other researchers to dissect and understand the coding process
through which the data was made, and replicate it. 

I would argue that a set of data is only really intelligible by understanding
the process that created it: how it was designed in terms of its units of
analysis and variables, and how it was gathered. While researchers must be sure
about the quality of data before they can proceed with admitting it as data in
an analysis, "black box" data-making processes are not intelligible
[@kreutz_war_2015 120]. 

Put simply; if the instructions are not public and explicit, the data cannot be
admitted to an analysis with any degree of confidence [@singer_wages_1972 14].
If a researcher unwittingly admits data with errors, such as incorrect
operationalizations, these errors "cascade", also affecting the result of any
subsequent analysis [@chojnacki_event_2012 384].

Therefore, the single most important rule for data collection is to be diligent
in recording details about the process and reasoning behind it, and to publish
these details along with the data [@king_designing_1994 51]. In fact,
@krippendorff_content_2004 [81] argues that the very idea of research
"presupposes explicitness".

### Data Quality

Data-making is a process fraught with challenges and caveats, and producing
high-quality data, especially at scale, requires that much attention is put
into developing the procedures and rules to be applied.

With more and more data being made available through the internet, being able
to discern between good and bad data is of great importance
[@simmhan_survey_2005]. Bad data corrupts and analysis or comprehension of it
with false knowledge, yielding seemingly credible falsities. These "fake views"
of the world are much more dangerous than other kinds of falsities in that they
seem credible, and might yield themselves to statistical analysis that provides
great rhetorical weight. "Cascading errors" is a term used by
@chojnacki_event_2012 to warn against the propagation of poor inferential
quality from data to analysis. 

Approaching data critically can only be done, however, if the process of
creation is explicitly and completely recorded, and made open.  Why was the
object of analysis and variables chosen? How was it understood and approached
by the data creators?  Subsequently, how was the observations and records made?
What kinds of instruments and personnel were involved in the measurements, what
kinds of instructions were given, and what kinds of discussions arose during
the process? To facilitate this discussion of how the creation of data affects
its quality in important ways, I will begin with a detailed look at one of the
most basic processes in data creation; measurement.

### Measurement

The classic definition of measurement is that it is "assignment of numerals to
objects or events according to rules" [@stevens_theory_1946 677]. While
"numeral" seems equivalent to "number", @kerlinger_foundations_1973 [427]
specifies that it might also simply mean "symbol". It might hold quantitative
meaning as a number, but might also simply be a label, like the numbering of
football-players or billiard balls. Thus, measurement can either be a process
of labelling or quantifying some phenomenon; the core process of data
collection.

The structuredness of measurement means that what is observable is pre-defined
as a "range"; a space of possible outcomes. Measurement, then, is a process of
"mapping" observations, termed the "domain" of the measurement, to this range,
according to some given procedure, or "rule" (ibid. 428). This is essentially
the same as the application of a function in mathematics; the rule is a
function of the observations, and produces a given range of outcomes. The range
is always the same for a given set of observations. Measurements should also
always be the same for a given set of observations, though this is really only
true in theory: In reality, measurements always "contain" some error in
addition to the desired "true" score. 

#### Truth and measurement

When discussing methodology, it is essential that key terms are disambiguated
[@gerring_case_2008 19].  Much confusion arises from the term "true", when
discussing measurements. What might be helpful, is to discern between the three
kinds of truth attainable from a measurement: The truth of the measure, the
truth of the concept as-understood, and the "ideal" truth of the concept.

The first is the truth of some measuring procedure, given operationalization,
or "test", which is defined as the outcome of such a procedure administered to
a given case exempt random errors of measurement [@allen_introduction_1979 57].
This truth is expressed by the idea of reliability.  Deviations from this first
truth are called "errors of measurement", and are assumed to be unsystematic.

Secondly, there is the truth of some concept as-understood in the given case.
This truth is expressed as the validity of the measure, dependent both on
a correct operationalization and of reliable, or "true" measurement. Deviations
from this second truth, ill-conceived measurement procedures that measure more,
or less than what they ostensibly measure, could be called "errors of
operationalization" or "errors of conceptualization".

Finally, there is the "ideal" truth of the concept in itself. This final, or
ground truth is what we approximate when we are formulating, or rather
reasoning about the concept before attempting to measure. How this can be
argued, or even if there is such a thing as "ideal truths" about the things we
attempt to reason about, are rather abstract questions which I will not go
deeper into here.  Thus, the two levels of "truth" relevant to this study of
scientific observation are whether or not one is observing the true score of
some measurement procedure, and whether this procedure is accurately conceived
according to the concept as understood by the researcher, or rather, if it is
valid. 

The stages of truth might be thought of as hierarchical: It is not possible to
attain a true measurement of a concept as it is operationalized, without
attaining the truth of that operationalization. Similarly, it is not reasonable
to think that one can approach the "real "truth of some concept as it actually
is, without being able to measure correctly according to how it is understood.
Put technically: Reliability is antecedent to validity, and validity is
antecedent to "proper" understanding. 

While this brief account might appear trivial and semantic, holding the
different kinds of discussion about the "truth" of a measurement is practical,
as it makes it possible to keep separate the discussion of validity,
reliability, and the more foundational, philosophical arguments about the
understanding of phenomena. Only the first two discussions are approached here.

#### Formalization

First, I define $A$ as a given range, or "scale" in which the measurements will
fall, or rather, the range of possible measurements as defined by the
measurement scheme. $I$ is a set of one or more observed elements, f is a rule
for mapping these elements to the scale $A$. The resulting $t$ is the "true
measurement" given an observation $I$. 

\begin{align}
t &= f(I) \label{measurement}\\
t &\in A \label{range}\\
f(I): I &\to A \label{mapping}\\
\end{align}

When talking about "real world" measurement, however, an important addition is
needed to complete this formalization. A given measurement will, in any case,
contain some error, or $e$ [@kerlinger_foundations_1973 446]. The error term,
contains any kind of disagreement between what "should" have been measured,
according to the rules of the measurement procedure, and what was actually
measured. A more realistic formalization of the process, then, is:

\begin{align}
g(I) &= f(I) + e\label{errorFunc}\\
m &= g(I)\label{errMeasure}\\
m &\in B\label{errRange}\\
g(I): I &\to B\label{errMap}\\
B &\subset A\label{errInRange}
\end{align}

The function $g$ includes an error term, while the range of outcomes of $g$,
$B$ is a subset of the range of "true" outcomes on the scale $A$, meaning that
the error term cannot make the score exceed the scale. 

Under classical true score theory, it is further assumed that:

\begin{align}
E(e) &= 0\label{expError}
\end{align}

Which means that the expected, or mean value of $e$ is zero, and thus that the
expected value of $m$ is $f(I)$ (\ref{tst2}) [@allen_introduction_1979 57].
This means that the measurement will, despite some variation, be a reasonable
approximation of what we are trying to measure. Whether or not this is
assumption is reasonable for a given scheme, however, is an important question.

How is measurement performed, or rather, what is $f$? In general, we can say
that measurement necessarily involves some kind of instrumentation, or medium.
The distance between the observer and the observed phenomenon can vary greatly;
from measuring the current temperature through a wall thermometer to measuring
the level of discontent among the Russian working class in 1916, or the number
of casualties that occurred during the battle of the Somme.  Obviously, the
latter measurements are a great deal further removed from the actual phenomenon
that is measured, than the former. 

Whatever the distance, however, measurement is always done through indication;
the observation of phenomena thought to be associated with the actual
phenomenon of interest [@kerlinger_foundations_1973 431]. While temperature
might be the object of a measurement when using an old thermometer, it is not
directly observed; only indicated by the expansion and contraction of
quicksilver, which is known to be correlated with temperature. Similarly, the
phenomenon of war might be thought to be indicated by a given number of battle
deaths, as is the case for the UCDP armed conflict data set
[@gleditsch_armed_2002].

The activities, or "operations" deemed necessary and sufficient for observing
a sought concept is called the "operationalization" of that concept
[@kerlinger_foundations_1973 432]. The operationalization is related to a given
set of one or more indicators that are purported to be associated with the
concept that is measured. A concept can usually be operationalized in various
ways, and the various operationalizations might vary both in their precision
and reliability, but also in their accessibility and practicality. 

The argument that a given operationalization is a good, or "valid" way of
producing measurements of some concept must be thorough, and this is
increasingly important the further away from the object the observer is.  Like
all other causal relationships, indication is hypothetical. For users of data,
this means that the validity and reliability of measurements is fundamentally
important.

### Validity 

Valid and reliable data is a faithful representation of what it is purported to
represent, and a prerequisite for any further meaningful analysis. The way
data relates through real phenomena is through the "bridging" concept of
indication. In this view, data is a bridge between an observed phenomena and
the purported concept through an indicator. If the indication is sound, the
measurement is "valid", meaning that we are actually measuring what we are
trying to measure [@adcock_measurement_2001 529].

This definition of measurement highlights an important fact about measured
data; that it is neither a perfect reflection of reality, nor an accurate
representation of the concepts we seek to describe. Data is rather an attempt
to bridge the gap between these two realms through an argued
operationalization, making it possible to reason about the concepts by
referencing some observed real-world phenomenon [@singer_variables_1982 191].

As @sundberg_systematic_2011 [92] points out, there is no such thing as
a perfect measure. There is always a tension between being too specific and too
general. While the former means omitting cases, the latter means including too
much. An important question, then, is: How can we be sure that a measurement
procedure is well defined, that $f(I)$ is a sound enough bridge between
indicators and concept? In other words, how can we be sure that we are measuring
what we are purportedly measuring, and producing valid data? 

The correspondence between a given measurement procedure and the "real" truth
about some concept is termed the "isomorphism" between the procedure and
reality [@kerlinger_foundations_1973 431]. Interestingly, this trait is not
a part of the formal definition of measurement. Measurement without any
assumptions about the truth value of the scores, as in \ref{expError}, is
simply a "game", its rules are only that some class of phenomenon should be
mechanically mapped to a range of outcomes.  Whether the game is played with
rules that make sense in the real world is an entirely different question
(ibid.), but it is of course of the utmost importance when making sense of the
data. 

In line with @adcock_measurement_2001 [530], I do not discern between different
"types of validity"; validity is simply the agreement between a measure and its
concept. There are, however, several ways to validate, or rather, to strengthen
our confidence in the validity of a measure. 

An important question given the formalization of measurement given above is,
where does validity fit in?  Should validity be included in the formal
definition of measurement, given in \ref{measurement}?
@kerlinger_foundations_1973 [470] does so, when he suggests that the variance
of a given measure could be conceptualized as:

\begin{align}
V(t) = V(co) + V(sp) + V(e)
\end{align}

$co$ is defined as the conceptually common element of the "total" measure $t$;
common, because @kerlinger_foundations_1973 (ibid.) associates validity with
the idea of convergence between multiple tests purportedly measuring the same
concept. $sp$, on the other hand, is defined as the specific element of the
measure. Without going into detail, what this essentially means is that when
making a measurement, the score will in part reflect the concept we are
attempting to measure, but will also contain variance associated with the
specific procedure. A measurement procedure $f$ will give scores that should be
taken as partial reflections of what we are trying to measure. The remaining
variance is specific to the test. 

A theoretical measure of validity, which is an expression of how much of the
total variance of our measurements is due to our actually measuring of the
concept of interest, is given by @kerlinger_foundations_1973 as:

\begin{align}
Val &= \frac{V(co)}{V(t)}
\end{align}

Should the variance $V(sp)$ be considered a part of the error term in
a measuring procedure?  Validity as defined by @adcock_measurement_2001 [531]
is related to the scores of a test, while older definitions are focused on the
validity of the test itself [@allen_introduction_1979 95], or rather, the
procedure $f$. This is really just a difference in whether or not validity
should be formalized as part of the error term $e$, expressed as a kind of
systematic bias.

This, again, relates to the question of whether the range $A$ should be
considered a "true" range, or scale, or if it should simply be considered the
"correct" range given some measurement scheme $f$. Questions of validity could
instead be thought of in terms of defining $A$ in the first place, relative to
some "real" scale of the concept; $T$. In this sense, another theoretical
validity measure $v$ could be defined as some kind of similarity metric
comparing $R$ and $T$. Of course, as "real scales" are not observable, this is
simply a thought experiment. 

Validity can be assessed in various ways, such as testing whether the
observation correlates with an indicator, or "criterion": Does the measured
phenomenon "behave" like we expect? An example would be to calculate the
correlation between a job aptitude test and subsequent job performance: If
there is a correlation, then it is reasonable to assume that the test correctly
measures aptitude [@allen_introduction_1979 97]. 

### Reliability 

Validity is complex, indeed philosophical. Reliability, on the other hand, is
more of a technical question. The "reliability" of data is a measure of the
extent to which repeated generation of the data, from the same source,
employing different coders, would yield the same results.

Although reliability is conceptually "simpler", it is antecedent to validity. A
discussion of validity is moot without reliability.  As will be shown here,
Reliability can be said to be a measure of the objectivity of a data-generating
process [@leng_toward_1977 79], of course relative to an "object" whose
validity can be further discussed. A completely unreliable measure can never be
valid. This is because validity is concerned with the conceptual meaning of
$f(I)$ in \ref{tst1}, and if $e$ dominates $f$ in \ref{errorFunc}, validity is
moot.

In practice, scores will be reliable if the collection is done strictly and
precisely according to the rules laid out beforehand. Put formally, this would
mean that $f(I)$ is followed strictly in \ref{measurement}, without admitting
any additional variance. Reliability increases or decreases as a function of
the complexity of the coding rules, and the vagueness of the phenomenon being
measured. Simply put; the easier it is to measure a variable correctly, the
more reliable measures will be attained [@sundberg_systematic_2011 99].
Reliability is affected by the "clarity, explicitness and precision" of the
instructions [@singer_variables_1982 194]; the less ambiguous the rules are,
the more reliable the outcome will be. 

If something is left implicit in the coding instructions for example, or if the
observational matter is so complex or diverse that it cannot reasonably be
"encapsulated" in the measurement scale, the measurements will be less reliable
[@douglass_measuring_2018 192]. When clerks assigned with collecting data
encounter ambiguous situations where common sense must be applied to resolve
between categories, or to determine the inclusion or exclusion of an
observation, the decision made is not made within $f$, and thus creates an
additional source of variance [@stone_general_1966 62]. 

However, it is important to be aware of the fact that simpler and more rigid
rules will very likely result in less valid data [@sundberg_systematic_2011
99], especially in cases where the material to be structured is inherently
complex, or ambiguous. A balance must be found in every case.

The theoretical reliability coefficient [@allen_introduction_1979 p.
73] is given as:

\begin{align}
\rho^2_{mt} \label{rel1}
\end{align}

Where $t$ is taken as the "true" score of some test, analogous with $f(I)$, and
$m$ is the measurement made. Errors made in performing the measurement,
recording the results, or during other related procedures generate $e$ – error
– and thus weaken the correlation between what "would have been" the score from
the test proper, excempt these errors. 

Of course, the true score is not observable in itself. If it was, we would have
simply used that for our measurement and avoided the $e$. In practice, however,
we must assume that our measurements always contain some error. Further
paraphrasing the definition of measurement within the framework of classical
true score theory (ibid.), we expand the formalization with the following:

\begin{align}
E(m) &= g(I) \label{tst1}\\
E(e) &= 0 \label{tst2}\\
\rho_{em} &= 0 \label{tst3}\\
\rho_{e_1e_2} &= 0 \label{tst4}\\
\rho_{e_1m_2} &= 0 \label{tst5}
\end{align}

These are assumptions about how the measured true score relates to the other
terms. \ref{tst1} states that the expected value of a measurement is the result
of the measurement procedure, and that the expected error is 0 \ref{tst2}. 

This is not the same as saying that the expected error is small, only that its
mean value will be 0.  Thus, for a case $i$, the true score $t_i$ can
theoretically be uncovered as the mean of an infinite number of independent
measurements. This is obviously not feasible, but the theoretical construct $t$
is useful for understanding the process of measurements, and how to improve the
overall usefulness of the data through repeated measurements

Doing "multiple passes" over the same information is one way of evaluating
coder consistency through the reliability coefficient.  

Test-retest reliability [@allen_introduction_1979 76] can be estimated by
making two measurements, $m_1$ and $m_2$,of the same phenomenon $i$. This could
be written as: 

\begin{align*}
m_1 &= f(i) + e_1\\
m_2 &= f(i) + e_2
\end{align*}

Everything is kept constant. Since, however, $e_1$, the error introduced in the
first measurement, might be different from $e_2$, the measured value might differ
even though its "true" value will not. 

When coding information from text, reliability is affected by the logical
structure of the typology, the precision and clarity of the coding rules, the
training of the coders, and the degree of ambiguity in the data source.  In
short, it reflects the measure of the objectivity in the data generation effort
@leng_toward_1977 [79], the correspondence between the truth and the coding,
which is expressed in \ref{rel1}.

## Computerization

Automated methods for extracting information from text have been in use since
the 1960s [@cioffi-revilla_introduction_2017]. 

Data quality largely depends on the definition and execution of the
data-creation process. This raises the question: Do some approaches to
data-creation inherently lead to higher data quality? Comparing approaches in
terms of data quality reveals that there are salient differences that might
greatly affect the quality of the data. In addition, practical differences,
such as the time and resources per data point, are also important. 

I will argue that computerizing a data-making process, that is, using a
computer to perform part of, or the entire process of structuring information
into structured data, will improve data quality, especially when compared to
data-production processes involving human judgement as part of measurement
process.

There are three facts about the way computers operate that drive this
improvement in data quality: First , computers follow given algorithms
unerringly. Second, computer algorithms can be scrutinized and reproduced post
factum. Third, algorithms are executed extremely quickly. 

### Reliability

The measurement part of data-making is a schematic process of applying
instructions to a given set of indicators to produce data. While it is
certainly possible to perform high-quality coding using human coders, who
follow instructions when comprehending information material, "coders are humans
even when they are asked to act like computers" [@krippendorff_content_2004
127].

A computer works by applying procedures to information. These procedures are
executed unerringly, yielding results with no random variation. This is a
crucial difference between the way computers and humans cognize, as was shown
in the discussion of reliability: For better or worse, humans err when
following instructions, while the reliability of the execution of a computer
program is nearly absolute [@stone_general_1966 12]. 

The fact that computers are thorough and unimaginative in performing tasks,
while not making them particularly suited for developing typologies or
reasoning about complex ideas, makes them ideal when it comes to the mindless
application of instructions. As I have shown here, data creation involves both
kinds of reasoning; the development of concepts and operationalizations, and
the schematic observations according to the operationalization. The latter task
is ideally suited for automation, since it should involve little to no further
abstract reasoning.

Traditionally, reliability is affected by the complexity of the coding
instructions; the easier something is to measure and code, the more reliable
the data will be [@sundberg_systematic_2011 99]. Complex instruction that
demand much of the coder creates fatigue, and the need for commonsensical
disambiguation creates bias. These "fluctuations" do not, however, enter into
the process when a computer is used [@stone_general_1966 12].

For a computer, simple and complex instructions are equally difficult to
execute, but not equally difficult to define. When using computers to code, one
might say that the difficulty of measuring something instead affects the
resultant validity, or rather, the chance of measuring a concept correctly. The
development and scrutiny of the coding procedures, or rather the
operationalization, for a computerized data-making effort, is very important.

### Openness

While the schematic part of data-creation is suited for computerization, it is
important to emphasize the importance of human intelligence in defining and
managing the data-generating process. The importance of mindful and correct
definitions and operationalization does not diminish with computerization, but
arguably becomes even more important, as the volume of data that can be
produced and disseminated is greatly increased. Thus, with the opportunities
for creating vast amounts of data, ensuring operational validity and discussion
about the concepts that underlie the data becomes extremely important.

While computers cannot help in defining correct operationalizations and
conceptualizations, the fact that the operationalizations must be explicitly
detailed [@stone_general_1966 12], and might also be made open, means that
mindful use of data is made easier. The computer will not help with the
development of operationalizations, but the detailed scrutiny of the
operationalization, or even testing the effect of different operationalizations
on the resulting data, and conclusions drawn from such data, might contribute
positively to such discussions.  This is made easier when coding with
computers, since in addition to being open, the application of the procedures
is extremely cost-efficient. 

### Resources

The running costs of a computerized data collection effort, both in terms of
time and money, are very low. While the initial investment in hardware and in
the development of software might be substantial, the result is extremely
efficient. This has two important implications: Firstly, more data can
realistically be produced, no longer limited by arbitrary financial boundaries.
Secondly, data can be coded and recoded extremely quickly, making it more
feasible to assess a given operationalization by comparison.

Experiences with automatic coding have shown substantial cost reductions:
According to calculations by @schrodt_automated_2013 [26], coding 3 million
data points from 26 million records with the TABARI automated coder takes about
6 minutes, while the same work would require about 500 000 man-hours of manual
coding. While the development of TABARI took a substantial amount of time and
resources, once it is designed, the inclusion of new source material, and the
continuous production of near real-time data is possible. 

