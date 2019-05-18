
# Coding

>  "Scientists, in searching for the causes of phenomena, assume that the
> universal and the particular are aspects of one reality".
> [@wright_study_1965 732]

Data is simply information. In this broad sense, Any kind of perception or
record, ephemeral or permanent, is raw data. Raw data is the medium between us
and the world. When thus defined, producing and analyzing data can be seen as
the basic form or structure of scientific work, or indeed the fundamental way
humans relate to the world through the reception and understanding of sensory
input.  When understood in this way, data is synonymous with information; any
kind of percieved and recorded bit of information about the world is data. 

Furthermore, it is common to discern between structured and unstructured data.
In fact, i will argue that this dichotomy is very important for defining
scientific observation as opposed to other kinds of observation. The
"structure" of structured data is understood as a set of rules that govern how
data is to be recorded.  Many kinds of data that are interesting to social
scientists are unstructured, and must be structured before they are useful for
analysis. The structuring of information, according to a fixed set of
procedures, is called coding [@bryman_social_2016 245]. 

In this chapter i establish the theoretical background with which i developed a
text coding system by exploring the process of coding on a theoretical and
practical level. By framing coding as a form of measurement, i establish the
link between coding and classification as understood in political science, by
developing a common set of formal definitions. 

Scientific coding is a process fraught with challenges and caveats, because of
the strict criteria for scientifically useful data. These challenges relate to
the term data quality. Using the definition of descriptive coding as given by
true score theory, I attempt a formal definition of data quality, and relate
the different aspects of data quality to elements of the coding process.  I
also argue that automating the coding process using computers has several
beneficial effects on data quality. I emphasize three; mechanical reliability,
cost-reduction and transparency. 

## Structured data 

Phenomena can be percieved and recorded in any number of different ways. The
"raw data" of everyday experience must somehow be structured in order for it to
be comprehensive and understandable; to make it possible to connect thoughts
with phenomena in a meaningful way. It is common to distinguish between
structured and unstructured data: Between data that fits a strict schema, and
data that is somehow more amorphous, and can be intepreted, or structured, in
different ways.

@codd_relational_1970 offers a foundational definition of how data can be
structured. Through what is termed the relational model, or relational theory
[@date_database_2001 5] of data, it is possible to define some basic properties
and traits of structured data, that serve as the departure point for my
discussion.

The relational model states that structured data are organized into relations,
which might also be called tables. A relation has columns, which
@codd_relational_1970 also call domains, and rows. Rows are distinct tuples
containing one value from each domain. Importantly, domains hold a single
significance, or meaning, representing some category or kind of information. 
 
What is useful about Codds relational model of data, is that it emphasizes an
important aspect of structured data; the relatedness of the rows _through_ the
domains. This means that rows can be compared as similar but distinct instances
having values in the same domains, meaning that they hold some value of
information in the same categories.

This is best illustrated by the later specification of "Tidy data"
[@wickham_tidy_2014], a special case of relational data that easily yields
itself to analysis. Tidy data is summarized through three principles: 

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

This represents "a standard way of mapping the meaning of a dataset with its
structure" [@wickham_tidy_2014 4]: a standardized relationship between the
semantics and the structure of the data.

The idea that observations can be seen as related through their traits requires
an assumption of relatedness and difference grounded in theory. The segregation
of observational units into separate tables (3) depends on the assumption of
difference between the units, and the collection of values under a single given
variable column (2) depends on the assumption of equality of the values in
terms of the dimension that they express. In other words, the units must be
distinct, but comparable.
 
Importantly, structured data is _made_, not found or observed. This has
important implications for how data should be used and interpreted, and means
that data can only really be understood in conjunction with the rules and
assumptions used when creating them. For scientific work, the assumptions
should be formalized in terms of explicit decision rules. The creation of data
through the application of such rules on unstructured data is called coding.

## Coding 

Coding is a special case of cognition: defined as the act of translating myriad
sensory input into named objects, connecting the world of ideas with the world
of observation, and  allowing us to discern between different objects, human
and animal, edible and inedible, mechanical and organic, strange or familiar,
and so on.

What sets coding apart from cognition, is the strict systematization of the
process @krippendorff_content_2004 [p.  126] through the specification of
coding rules, meaning the explicit definition of the concepts of the relevant
names. A name has an associated concept [@hunt_experiments_1966 10]. The
concept is the decision rules with which the name is inferred. While both sane
cognition and coding employ concepts to name observations, coding requires that
these concepts are made as clear as possible.

By this definition, coding can also be called data making
[@krippendorff_content_2004 83], since the structuredness imparts itself on the
data, yielding a systematic data set of observations and classifications. In
ideal cases, coding also strictly specifies what features are relevant when
discerning between cases. This means that coding both requires and produces
somewhat structured data. 

As mentioned, structured data is not observed, but created.  Names are in
themselves unobservable theoretical entities, thus _deciding_ what names to
apply involves theorization. In addition, the selection of relevant features
when producing a strict coding scheme is also theory dependent. A set of
observations could be observed and named in an arbitrary number of ways.
Selecting a set of relevant features and a naming scheme, and thus deciding how
observations should be viewed and categorized means committing to theory
[@holsti_content_1969 94].

While both coding and cognition rely on theory, the explication of the coding
process makes it possible to reason about the theory and assumptions that
underlie data: The schematic and explicit nature of coding allows other
researchers to dissect and understand the coding process through which the data
was made, and replicate it. 

With clear concepts, the validity of the relationship between the name and the
data can be meaningfully assessed.  The paramount importance of validity in
research, which is discussed below, is what makes formalized coding obligatory
for empirical scientific work.  

### Measurement

When coding is structured, and the relevant variables and decision rules are
explicitly clear, it becomes akin to measurement [@oberg_gathering_2011 61].
Measurement is defined as "the assignment of numerals to objects or events
according to rules" [@stevens_theory_1946 677]. 

"Naming" measurement means assigning nominal numerals, that only act as name
referents for the observed cases.  The numbering of football players and car
serial numbers, or the assignment of the numbers 1 or 0 to individuals in
survey to denote gender are all examples of nominal numerals; arithmetic done
with such numbers is nonsensical, they only make it possible to discern between
cases. The only formal rule for measuring on a nominal scale is: "Do not assign
the same numeral to different classes or different numerals to the same class"
[@stevens_theory_1946 679].

The connection between coding and measurement allows us to formalize the
assumptions of the observational aspect of coding using classical true score
theory [@allen_introduction_1979 p. 56], which also allows for the
formalization of other important aspects of the coding process, and facilitates
comparison with computer classification. 

\begin{align}
m &= t + e \label{tst1}\\
E(m) &= t \label{tst2}\\
E(e) &= 0 \label{tst3}\\
\rho_{et} &= 0 \label{tst4}\\
\rho_{e_1e_2} &= 0 \label{tst5}\\
\rho_{e_1t_2} &= 0 \label{tst6}
\end{align}

\ref{tst1} states that a measurement $m$ is composed of a true score $t$, and
an error term $e$. Another way of saying this, is that $m$ is a measure of the
concept $t$. The expected value of $m$ is $t$ (\ref{tst2}), thus the expected
value of $e$ is 0 (\ref{tst3}). 

This is not the same as saying that the expected error is small, only that its
mean value will be 0.  Thus, for a case $i$, the true score $t_i$ can
theoretically be uncovered as the mean of an infinite number of independent
measurements. This is obviously not feasible, but the theoretical construct $t$
is useful for understanding the process of measurements, and how to improve the
overall usefulness of the data through repeated measurements
[@allen_introduction_1979 p. 56].

Another important insight that is gained from this formalization, is that $t$
is not defined by referencing any "real" concept, but is rather defined
mathematically, as the expected value of $m$. This is a way of saying that it
is only possible to approach the truth of a test, rather than the truth of what
is tested. Thus the quality of the measurements also depends on the validity
and reliability of the operationalization, which is discussed below.

\ref{tst4} through \ref{tst5} state that the
error term and true score elements are assumed to be uncorrelated.

\begin{align}
y = f(x_i) \label{msr1}
\end{align}

Where $x_i$ are attributes of an observation, and the algorithm $f$ represents
a way of understanding the configuration of the attributes, or "any one-to-one
substitution" (ibid.) of the attributes with a name $y$. 

## Data quality 

Data quality is a normative term that is used to describe structured data. The
term is an expression of the scientific ideals of intersubjectivity and
veracity. 

With more and more data being made available through the internet, being able
to discern between good and bad data is of great importance
[@simmhan_survey_2005]. Bad data will corrupt analyses with false knowledge,
yielding seemingly credible falsities that are much more dangerous than other
kinds of claims.

According to @king_designing_1994, the "first and most important guideline for
improving data quality is: Record and report the process by which the data are
generated".  

> More stuff here...

### Validity 

Once the concepts to be measured have been explicated, the next step is to
ensure the validity of the operationalization... (bad segway)

Being open about the sourcing and coding of data is absolutely necessary to
prevent «cascading errors» (@chojnacki_event_2012 p. 384). 


Formal measurements are worth nothing without establishing a connection with
relevant, interesting phenomena. According to the definition by
@adcock_measurement_2001, validity is the degree of correspondence between
a concept, and a measurement of a manifestation of the concept, or rather
"whether a variable measures what it is supposed to measure" (ibid. 529).
Validity is not defined mathematically, but is rather related to the
conceptualization of the names being applied.

Validity is antecedent to reliability. A completely unreliable measure can
never be valid, while a completely reliable measure can be both valid or
invalid. This is because validity is concerned with the conceptual meaning of
$t$ in \ref{tst1}, and if $e$ dominates $m$, the validity of $t$ is not
relevant, since it cannot be observed in $m$.

When reliability has been established however, validity is the most important
factor of a measurement scheme. 

> More stuff is coming here...

### Reliability

The "reliability" of data is a measure of the extent to which repeated
generation of the data, from the same source, employing different coders, would
yield the same results.

Reliability increases or decreases as a function of the complexity of the
coding rules, and the vagueness of the phenomenon being measured. Simply put;
the easier it is to measure a variable correctly, the more reliable measures
will be attained [@sundberg_systematic_2011].

> More substance

The theoretical reliability coefficient is expressed as
[@allen_introduction_1979 p. 73]

\begin{align}
\rho^2_{mt} \label{rel1}
\end{align}

If two measurements, $m_1$ and $m_2$,are made of the same phenomenon, the true
score $t$ is assumed to equal, and the measurements are thought of as parallel.
Reliability is thus also defined as

\begin{align}
\rho_{m_1m_2} \label{rel2}
\end{align}

When coding information from text, reliability is affected by the logical
structure of the typology, the precision and clarity of the coding rules, the
training of the coders, and the degree of ambiguity in the data source.  In
short, it reflects the measure of the objectivity in the data generation effort
@leng_toward_1977 [79], the correspondence between the truth and the coding,
which is expressed in \ref{rel1}.

## Computerization of coding 

When measurements are made by humans, they become part of the measurement
apparatus. This is especially true in the case of content analysis of text. The
need for interpretation in ambiguous cases, or the need for more or less
context sensitivity, however, requires skill and sensitivity from the coder. 

Since humans differ from one another in how they understand and interpret
information, they are not ideal measuring instruments when required to make
uniform measurements. Coder consistency, even for an individual coder, is
extremely important when doing content analysis. Doing "multiple passes" over
the same information is one way of evaluating coder consistency through the
reliability coefficient \ref{rel2}. 

In essence, coders are assumed to be interchangeable agents, not adding error
in either a systematic or random way.  The more interpretation needed, however,
the less likely this assumption is to be true.

There are three intrinsic qualities of computers, compared to humans, which
drive the improvement in data quality: The fact that computers follow  given
algorithms unerringly, the fact that these algorithms can be scrutinized and
reproduced, and the fact that computers work extremely quickly compared to
humans.  

Now that i have defined coding and its pitfalls, i will turn to focus on the
means of coding. I make case for computerizing the coding process, using the
phenomenal speed and absolute reliability of computer algorithms to remedy some
of the issues of traditional "human coding". 

It is important to emphasize the importance of human intelligence in the coding
process. This importance does not diminish with computerization of the "work"
of coding; rather, it becomes even more important, as the volume of data that
can be produced is greatly increased. The way human intelligence is applied
_through_ algorithms is shown in the following chapter. 

I argue that there are two primary benefits of computerization; speed and
reliability. These benefits can positively affect data quality in powerful
ways, making it feasible to use a much broader selection of sources, and to
evaluate different coding rules by recoding quickly and accurately. These are
often impossible for reasons of time and money when coding manually. 

A third benefit, which relates to both the speed and transparency of computer
procedures, is the interchangeability and openness regarding typologies. This
both allows researchers to "state their bias" that is inherent in data, and
data-makers to experiment with different typologies in order to reason more
efficiently about them.

### Resources 

As shown in \ref{tst1} and the following discussion, $m$ approaches $t$ as the
number of unique observations increase. When the error in each observation is
large, this becomes more important. 

Data volume is desirable, as non-determinate phenomena can only be
approximately observed through statistics performed on large numbers of cases.
As a general rule, the less determinate the phenomena, the more data is needed.  

"
To the contrary, scholars of politics have long recognized that much of
politics is expressed in words. But scholars have struggled when using texts to
make inferences about politics. 

The primary problem is volume: there are simply too many political texts. 

Rarely are scholars able to manually read all the texts in even moderately
sized corpora. And hiring coders to manually read all documents is still very
expensive. The result is that analyzing massive collections of text has been
essentially impossible for all but the most well-funded projects.
" @grimmer_text_2013 1

Coding from text data requires an enormous effort from many people over long periods of time. According to @schrodt_twenty_2006 [5], a single human coder typically has "a sustained output of five to ten events per [...] hour". 

According to calculations by @schrodt_automated_2013 [26], coding 3 million
events from 26 million records with the TABARI automated coder takes about 6
minutes, while the same work would require about 500 000 man-hours of manual
coding.

...the amount of source material is too big to process by hand...
[@boschee_automatic_2013 p. 51]

The need to focus efforts to be able to produce sufficient amounts of data is in itself a source of bias (@earl_use_2004 p.68).

This means that computerized content analysis is not just a more effective
tool, but an enabling necessity when trying to answer research questions that
depend on event data, especially in real time, as the amount of source material
is too big to process by hand [@boschee_automatic_2013, p.51].

Efforts to computerize the collection of data have «greatly helped» the
empirical study of conflict. [@hegre_forecasting_2017, p.115]

"
We show how automated content methods can make possible the previously
impossible in political science: the systematic analysis of large-scale text
collections without massive funding support.
" @grimmer_text_2013 2

"
Human-based methods for making [classification inferences] are both time and
resource intensive. Even after coding rules are developed and coders are
trained, manual methods require that coders read each individual text.
Automated methods can mitigate the cost of assigning documents to categories,
by limiting the amount of classification humans perform.
" 8

Data quality and availability has been an important factor, affecting the
feasibility of detailed empirical study of conflict. 

These efforts are «greatly helped» by efforts in automating data collection
efforts [@hegre_forecasting_2017 115]

### How computers help with reliability

The reliability of computer programs is absolute. By their nature
[@stone_general_1966 12], Computers are generally "unimaginative" when
executing programs. This is both a weakness and a strength, as computers can
not identify erroneous coding instructions themselves, and give feedback to the
author of the instructions.  The great advantage of this lack of imagination,
however, is near absolute reliability.

The difference between humans and computers in reliability can be compared by
analogy; given even explicitly stated codebooks, it is to be expected that
different teams of human coders will code raw data in slightly different ways.
Computers, given the algorithms used to transform raw data into coded data,
will not vary in the same way. Any variation can be attributed to specific
differences in the system architecture, or other explicit and easily
identifiable factors. Thus, possessing both the software and the raw data, such
as the archives of text used to code events, and some knowledge about the
computer that ran the code, anyone would be able to reproduce the data exactly.

" Content analysis usually requires skilled and sensitive coders, the very type of persons who
 soon become bored and frustrated by the tedious and repetitive nature of the task"

Individual differences in actual coding practices often occur and the same coder may show considerable fluctuation over time.
" @stone_general_1966 [62-63]

"
coders are humans even when they are asked to act like computers
[...]
Recording is a highly repetitive analytical task that requires strenuous attention to details. Not everyone is capable of maintaining consistency under these conditions.
" @krippendorff_content_2004 [127]

"
The implementation of procedures on a computer insure that they are both
systematic and objective. The nature of a computer program requires that both
the categories and the rules for identifying and recording characteristics
occurring in the data be explicitly stated. 

The computer then systematically applies the categories and rules to the data
in a completely objective manner. Whether the measurement procedure was
reasonable or best suited to the inferences being made may be debated, but the
procedures themselves are explicit and clear.
" @stone_general_1966 [12]

Typologies are inevitably reflections of the investigators understanding, and
objectives. Due to reductions in cost, and transparency offered by computerized
coding, the process can be repeated using multiple different procedures. This
makes it possible to assess the impact of each operationalization.

@
"Contaminating" the data with assumptions is a problem for any data collection effort
(e.g "gathering data for a single theory")
Especially when data collection is so expensive
"
Any constructed typology is unavoidably a reflection of the investigator's understanding of the nature of the phenomena being observed and classified, and his research objectives.
" @leng_toward_1977 [74]

But since computerized data collection is practically "free" once it is running, data can be collected with different rules.
@ @leng_toward_1977 [72-73]

"
What should be avoided, then, is the blind use of any method without a
validation step. This is why we discourage the use of many commercial tools for
quantitative text analysis. These programs simply provide the researcher with
output. It is often difficult, and sometimes impossible, to validate the
output. But more damning for these methods is that once a problem is
identified, it is exceedingly difficult to change how the analysis is
conducted. Certainly, these methods can be validated and provide conceptually
valid and useful output. But without a broader set of tools available, it is
difficult to know if the methods included in the commercially available
software are optimal for the particular problem at hand.
" @grimmer_text_2013

### Transparent typologies

It is established that computers are fast and transparent. This has a third
important benefit related to the process of developing and assessing typologies
of phenomena. Returning to the discussion in the previous chapter about the
theory-dependent nature of typologies...

## Summary

With this chapter, i hope to have shown how coding can be formalized and
decomposed into separate steps and problems. In the following, i will show how
coding can be done using a computer program, while referencing the definitions
established here. As mentioned in the introduction, the definitions in this
chapter most certainly simplify the process of cognition, and understanding.
I do think, however, that a simple schematic approach to the problem of coding
can contribute greatly to a joint understanding of the problem between social
science and computer science.
