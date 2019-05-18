
# News and conflict data 

The system described in this thesis was written to assist coders in creating a
structured data set based on newspaper text. The goal of the project is to
create a comprehensive tabular data structure representing ceasefire episodes,
defined in terms of a beginning and end date, and signatory parties.  To create
this data set, coders have to process enormous amounts of raw text.  Thousands
of news articles, filtered as containing some mention of ceasefires are
downloaded per country, and must be read through in order to find the relevant
information: When, where and between whom ceasefires have been signed.

The system that was designed and tested here assists the coders, by doing a
first pass over the text data, rating each sentence in the newspaper articles
as either relevant or irrelenvant for future coding. This first pass is meant
to alleviate the information load on the coders, and speed up the process of
converting thousands of raw reports to a handful of ceasefire occurrences.  In
formal terms, it is assumed that each message unit $x$ has a hidden value $y$,
denoting its relevance. The purpose of estimating $y$ is to solve the "haystack
task" [@hanna_mpeds_2017 7]; the preselection of relevant documents that are
likely to contain information that is deemed interesting or relevant for
further information extraction.

In each case, the estimation of a hidden variable depends on some knowledge
about the characteristics and idiosyncrasies of the kind of raw data one is
working with. Working with text warrants a discussion of how its observable
traits can be said to relate to unobservable information, and what processes
affect this translation. In addition, the production and dissemination of text
as an information source makes it necessary to be critical, and not blindly
accept relayed information as true, even if it is presented as such.

## Working with text

Text is not an unusual source of information for data collection efforts in
political science: While many kinds of unstructured data might be interesting
for political science research, the most relevant information is often
expressed in the form of text. Language is central to the study of political
conflict as the traces of political processes are most often found in the form
of language expressions [@grimmer_text_2013 1]. Thus, the "raw material" of
much of the coding work in political science is text.

This has also been the case for several successful efforts to gather event data
and conflict data, from the very first such data sets [@mcclelland_acute_1961],
to later, large scale efforts utilizing computer coding [@schrodt_keds:_1994,
@hanna_mpeds_2017, @osorio_supervised_2017]. Gathering facts about events at
scale, seems to be best approached through the mass-analysis and coding of news
data.

While text is often a useful source of information, the information it is meant
to convey is nontrivial to extract. Furthermore, there are often issues of
completeness and credibility, related to the sources of text. A third specific
problem of text which is perhaps especially salient when using automated
methods is the stochastic process through which information is conveyed using
language symbols. All of these elements of data creation that proceeds from
text are discussed in this chapter.

## Text and information 

Content analysis is the structured analysis of the content of language
expressions [@stone_general_1966 5], also simply defined as the transformation
of text into data [@holsti_content_1969 2]. Such analysis involves the
collection and structured, systematic comprehension of text in terms its
content. The assumption that lies at the heart of content analysis, is that it
is possible to discern a meaningful picture of the _content_ of a _message
unit_, by examining its manifest features [@hunt_experiments_1966 151].

A message unit [@neuendorf_content_2017 21] might be a document, a sentence or
a paragraph, or some other conceivable unit of expression. A message unit
contains language symbols; an expression of information that is a combination
of the symbols and a language syntax. Together, the ordered symbols convey
information, through their semantic relationship with meaningful concepts
[@pustejovsky_natural_2012 12]. 

Systematically recording the semantic content of message units might variously
be termed a process of description [@stone_general_1966 11], labelling
[@pustejovsky_natural_2012 40] or information extraction [@benoit_treating_2009
495]. Although, while it might be philosophically interesting to discuss
whether or not a text can be said to _contain_ the information sought in any
given case, warranting the use of the term "extraction", or whether the
information only arises as a _combination_ of what the observer expects, and
what is contained in the text, warranting the use of the term "labelling", I
will not go further with this discussion here. For the sake of parsimony. I
have opted to use the term "extraction" throughout, which may also be taken as
synonymous with "labelling" and "description".

The information to be extracted from each unit is the saliency for further
coding, or rather, the relevance to a coding task. This information is
initially unobservable: There is no given language symbol, present in every
such relevant sentence, that will discern between relevant and irrelevant
sentences. Instead, the basic assumption is that the information that the
author intends to convey through a given text affects the symbol content of the
text [@hunt_experiments_1966 159]. The task, then is determining how, or
rather, estimating the function $f$ that maps the set of symbols $I$ to the
variable $y$, which is the degree to which a sentence expresses information
that is relevant to the coders. 

To give a naïve, but clear example of how such a function might work, consider
the sentences:

```{R, include = TRUE, echo = TRUE}
a <- "A ceasefire was declared at 20:00 this evening."

b <- "No ceasefire has been declared yet" 
```

These sentences contain letters, which make up words, that are linked by syntax
to form meaningful sentences. A useful starting point is to consider the
sentences as sets of word-symbols: 

```{R}
simpleTokenize <- function(sentence){
   unlist(strsplit(sentence,' '))
}
```

```{R, include = TRUE}
simpleTokenize(a)
```

A human will easily be able to sort these two sentences as being either
"relevant" or "irrelevant" when collecting data about the start of ceasefires.
Sentence `a` contains a clear reference to the start of a ceasefire; while
supplementary information must be collected to ascertain which parties were
involved, it is clearly relevant. Sentence `b`, on the other hand, would not be
relevant for coding coding the start of a ceasefire, as does not point to an
event of interest. Given the task of sorting these two sentences as either
"interesting" or "uninteresting" to coders on the basis of the set
representations, sentence `a` will be labelled as `i`, and sentence `b` will be
labelled as `u`.

What function $\hat{f}$ will effectively discern between sentences of type `i`
and type `u`? From our meager "training" set we might infer a naïve decision
rules that constitutes a mapping procedure from a given sentence to the
information we seek. In pseudocode, this procedure might look like this:

```
f <- evaluate(sentence):

   if sentence.verb.conjugation is 3rd_singular_past:
      sentence is "i"

   otherwise:
      sentence is "u"
```

However, it should be clear that this procedure is entirely inadequate. A
simple negation of the past participle "declared" in sentence `a`, while not
changing the outcome of $f$, changes the semantic meaning of `a`:

```{R, include = TRUE, echo = TRUE}
a_neg <- "A ceasefire was not declared at 20:00 this evening."
```

This brief account shows that relating text symbols with manifest information
is obviously quite complicated in most cases, as symbols or systems of symbols
might reasonably be related to several different kinds of information at once
[@bryder_innehallsanalys_1985 24]. The fact that there is no theory that can
deterministically map the symbols of language to the information we seek makes
the extraction of information from text a significant challenge: When something
is expressed through language, there "is no theory to tell us what words will
[necessarily] be used" [@stone_general_1966 10]. 

Instead, a given piece of information can be expressed through a very large
number of distinct, conceiveable texts [@benoit_treating_2009 497]. Simplified,
we might think of this as a process where the relayed information is altered by
two stochastic processes; the process of formulation, and the process of
interpretation. A given way of formulating a given piece of information,
combined with a given scheme for interpreting this text, yields a piece of
information that has been relayed through several potentially error-generating
processes [@benoit_treating_2009 498]: Formulation, expression and
understanding. 

In other words; an author might not express the information clearly, and a
reader might not properly understand the text.  What this means in our case, is
that there is no theory that could deterministically specify $f$. This is
because, in formal terms, the function "generating" text from $y$, is partially
stochastic, at least in practical terms. 

The error term, or rather, the specific variance of each case must not be
"included" in our function. This would lead to an "overfit" function, that will
generalize poorly, due to the fact that random noise is used as information,
rather than discarded. When estimating $\hat{f}$ in the following, avoiding
such overfitting is very important. 

## Sourcing 

The ceasefire dataset in production might aim to cover all ceasefires between
1989 and 2018. When considering how the data is collected, however, it becomes
clear that this is not an entirely realistic assumption. It is very important
to have an understanding of how text relates to the real world when using it as
a medium to extract "real world" information [@oberg_gathering_2011 61].
Problems of source coverage, and credibility, are unavoidable when coding from
relayed information. These problems have been discussed since the very first
data collection efforts in war and conflict research [@dumas_losses_1923 21],
and are arguably exacerbated in the age of massive flows of information from
a great multitude of different sources. 

Using a source rather than observing directly means that an intermediate
element is present between the observer and the "real" world.  An important
question then becomes: Is the object of analysis, in this case episodes of
ceasefires, accurately covered? Are some objects omitted from coverage, and is
this done in a random or systematic fashion?  Understanding how information is
filtered through second-hand sources is important, because it has substantial
effects on what the data can validly purport to be a representation of. 

Using relayed information is ultimately a matter of trust. An important fact
about trust is that it is transitive; if one is relying on information that is
relayed through more than one link, for example in a newspaper article relating
official reports of eyewitness accounts, one is essentially trusting several
sources at once.  A formalization of such trust-chains in the concept of "data
provenance" by @huang_big_2018 [p. 2189] shows formally trustworthiness
decreases significantly when these chains are long, and data is far-removed
from the facts which they purportedly express. On the other hand, corroborating
facts through several chains of trust increases trustworthiness.

Historians similarly distinguish between primary and secondary sources.
Secondary sources are not as useful as primary sources for the same reason;
they demand additional trust on the part of the recipient [@dulic_peace_2011
36].  In the case of ceasefires, what is sought is essentially information
about the actual events that constitute the ceasefire. Whether the source
presenting such information was present when such an event occurred, or is
relaying information from a correspondent, a local newspaper, a participant or
a witness, affects the trustworthiness of the information. Journalists writing
articles might sometimes be primary sources, but are mostly reiterating
information they have received from third parties [@oberg_gathering_2011 49].

A basic assumption for collecting information relayed through text is that
there is a "real" distribution of the phenomenon of interest, and that the
relayed information will yield a subset or superset of this "real" distribution
[@woolley_using_2000 157]. The underlying "true" distribution of objects is
assumed as the set $O$. This set contains all the observations that are
relevant to our data collection effort, or rather, that are covered by the
typology. Another way of thinking about this is that $O$ is the set of
observations that "should" be available to us when coding data. However, what
is conveyed in the source material, $S$, might either be a subset or superset
of this true set: We might only be able to observe some of the true events, or
we might observe reported events that did not in fact occur.

In the first case, $S \subset O$, it is important to reflect on the kind of
selection that occurs when the distribution of true events is conveyed through
source material. What determines whether something is reported? Only a small
fraction of the events that happen on a given day end up in newspapers
[@oberg_gathering_2011 53]. When using certain source, it might be necessary to
concede that its biases are imparted on the resulting data. Data that is
produced using newspaper data, for example, will inevitably be more
"newsworthy".

Newsworthiness can be defined in many ways, depending on the kind of
information. In the case of protest events @wueest_using_2013 [5] identifies
three main factors: Firstly, violent and confrontational protests are more
often reported than peaceful ones.  Secondly, Events that are geographically
closer to the offices of the agency are more often reported than distant ones.
Thirdly, protests about issues or concerns that "resonate" more with general or
salient concerns are more likely to be included. 

In the case of conflict events, newsworthiness is also defined in terms of
violence, and location. In addition, the feasibility of reporting creates a
substantial bias: If a conflict area cannot be safely approached by reporters,
its constituent events will be under-reported [@oberg_gathering_2011 55]. 

Inevitably, the target audience of a publication also governs what gets
reported (ibid. 57); news producers are not always altruistic in their motives,
but also exist to make money. If the audience is not interested in some
particular conflict or area, it will receive less attention, because it will
generate less revenue. This factor is magnified by the fact that it is now
possible for news agencies to gather detailed statistics about what gets read
online, in terms of the number of views and the average time spent reading each
article. Of course, the actual distribution $O$ is not observable, and it is
not possible to assess the true "completeness" of $S$ [@wueest_using_2013 5].

Multi-source corroboration is an important way of handling source bias,
however. Checking multiple sources, preferably sources with different
geographical origin and political slant [@hanna_mpeds_2017 4] makes it less
likely that the data will be seriously biased in one or the other direction,
making the issue of source bias more manageable [@wueest_using_2013 1].

Corroboration, of course, will probably make it necessary to "merge" different
accounts of the same "real" events, lest the set $S$ will contain multiple
observations that are in fact different "views" of the same entities in $O$
[@huang_big_2018 2186]. If this issue can be handled efficiently, though,
corroboration increases the chance of observing more of the units in $O$.
Corroboration might also single out events that seem unlikely to be real, and
thus increases the validity of the data: If an event is, for example, only
reported by one less credible source, it might be flagged as less credible than
if it was reported by multiple sources [@dulic_peace_2011 41].

In practice, however, data collectors have often had to focus on subsets of the
raw material to code, which increases the chance of bias [@wueest_using_2013
7]. This is due to issues of cost: With the enormous amounts of raw data
available, several quintillion bytes of raw data produced each day
[@cioffi-revilla_introduction_2017 103], attempting to extract data from
everything at once is hardly possible for "traditional" coding efforts.
Subsetting by excluding some sources of data, like certain newspapers or
certain regions makes the "universe" of raw material more manageable, but less
representative. 

Ultimately, source bias must be accounted for in the typology. A data set
generated on the basis of information relayed through the media will be a
dataset of "newsworthy" information, even when corroborating the information
through multiple news sources. For example, both the event data typology
designed by @azar_ten_1975 [2] and @leng_toward_1977 [3] accounts for this
explicitly, only purporting to cover _newsworthy_ events, rather than _all_
events. When this is explicitly stated, further analysis can account for the
bias, rather than assuming that one is working with a representation of the
full universe of events. A further delimitation of the unit of analysis is
caused by the fact that only english-speaking media have been analyzed when
creating the present data set.

However, the fact that ceasefires are deliberately publicized events is
remedial when it comes to source problems. Events that are wilfully obscured,
such as war crimes, will obviously be more seriously affected by source biases
that ceasefires, which are announced publicly, and depend on mutual
acknowledgement. This means that while sourcing problems are worthy of serious
consideration in any case involving information extraction from relayed
information, it might be considered less of a problem in the present case. 

