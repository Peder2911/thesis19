
# Introduction

Data is a prerequisite for scientific progress. Therefore, the development of
new and better ways to collect data is an important and meaningful task. While
the world is becoming saturated with information, this does not necessarily
facilitate the production of useful data: As the volume of raw information
increases, filtering and processing useful signals might actually become more
diffcult. Innovation in data collection is important to handle the growing
quantities of raw information. 

The importance of collecting reliable and valid data effectively is the main
motivation behind the present work. Lack of data creates "knowledge gaps",
phenomena remain imponderable until they have been systematically and carefully
observed. One such gap is created by the lack of systematic description of the
phenomenon of _ceasefires_, which is a recurrent and presumably important part
of many conflicts, and have been important components in many peace-processes.
Despite this, the contingent effect of a ceasefires on a given conflict is
unknown. Whether or not ceasefires facilitate peace in the long term is
therefore an open question. 

Data about ceasefires are certainly not lacking because they are trivial or
uninteresting phenomena, rather, data-collection is limited by practicality.
"Traditional" data collection is done through careful and patient treatment of
raw information by trained human coders, a process that is costly both in terms
of time and resources. This makes data a scarce resource. Improving the
cost-efficiency of data collection processes might lead to much greater volumes
of available data, and might then lead to more comprehensive understanding of
such important phenomena as ceasefires.

The procedure that is proposed and tested here involves automation of the
coding process: using computers rather than humans to apply coding procedures
to raw data. This is based on a proposed linkage between measurement as
traditionally understood in scientific litterature, and statistical learning.
Measurement, if treated as a process of estimating and applying measuring
procedures to raw data, can be favourably enhanced by estimating the measuring
procedures using statistical learning. This theoretical linkage is explored in
chapters 3 and 6.

The computerization of the coding process leads to a great increase in speed,
allowing for extremely efficient and expedient production of new data.  In
addition, i will also argue that there are substantial qualitative benefits to
automating the data collection process, in terms of both validity and
reliability. Openness and replicability, which are also important criteria for
intersubjective scientific data, are also facilitated by computerization, as
computer algorithms can be made entirely public, while commonsensical human
decisions can never be fully published.

While some researchers have viewed statistical approaches to data collection
with some skepticism [@schrodt_automated_2013 p. 37], @hanna_mpeds_2017 has
demonstrated that such approaches can be effective and accurate tools for
producing data. I confirm these findings in chapter 7, where i evaluate several
slightly different approaches, and present the results of a final evaluation on
held-out data. These findings show that statistical learning is indeed a useful
technique to apply in the process of coding data.

The technicalities of estimating and testing statistical learning systems on
text data are presented in chapter five and six. Using supervised learning
necessitates the development of a corpus of text with which to train the model,
and a thorough testing regime that evaluates different approaches. The corpus
is presented in chapter five, where I elaborate on the source, treatment and
pre-classification of the data. In the sixth chapter I describe my
classification methodology, defining key terms like supervised machine
learning, and cross validation of classification schemes. I also explain the
different techniques for transforming text into data, and the metrics used to
evaluate the different classifier schemes. 

With this thesis I hope to show that text classification based on statistical
learning is indeed an interesting technology for coding data within the
political science domain. The speed and reliability of computer coding makes
evaluating different classification schemes viable, and the open and schematic
nature of computer programs facilitates replication and critical assessment of
the resulting data. 
