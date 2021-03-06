
```{R}
knitr::read_chunk('ch6_code.R')
```

# Classification Methodology

Several steps are necessary to use statistical learning techniques to code
outcomes in a similar way to human coders.  The creation of structured data
depends on two steps; selecting a set of attributes with which cases are
represented, and classification based on these traits according to some given
rule. In this chapter, I describe these steps in terms of statistical learning
using a computer. First, i describe the way a classifier can be estimated from
a vector representation, then i describe how raw text can be represented as a
feature vector.

As mentioned in the previous chapter, i used supervised learning to estimate
the classifier functions presented in the following chapter. This means
extrapolating the decision rules from a set of coded data and applying these
rules to new data. The estimation of the coding rule is done through the
application of statistical techniques, that mimic the coding rule established
in the training set. 

Since there is no predefined "best" classifier algorithm for any given problem,
it is essential to test each algorithm using a training / testing methodology,
which is also thoroughly described. This methodology is used to select
classifier procedure that will be applied to a held-out partition of the
labelled data, to give a final evaluation of the effectiveness of statistical
learning methods in discerning between relevant and irrelevant sentences. 

Since the featurization step is cited as the most important part of machine
learning systems [@zheng_feature_2018 1], i describe several variations of this
step in detail. It is primarily the various ways that text is vector
represented that are evaluated in the following chapter, where i present the
results from several such procedures.

## Machine Learning

Machine learning is a term used to describe computer systems that infer
functions from patterns in raw data. It can be considered a kind of "artificial
intelligence" [@pustejovsky_natural_2012 p.  37] in the sense that it is able
to "learn" its procedures from data, rather than having to be explicitly
instructed. An agent can be said to "learn" if its performance is improved by
way of observation [@russell_artificial_2010 693]. A computer learns by way of
statistical estimation, computing models of relationships between traits and
outcomes that have been "observed".

Generally, learning, can be defined as the estimation of a procedure, or
function of observed cases based on the association of their attributes and an
outcome of interest. Thus, @james_introduction_2013 [36] describes statistical
learning as an attempt to estimate a function $f$, where:

\begin{align}
y = f(x) + \epsilon \label{ml1}
\end{align}

This is done by observing cases expressed in terms of a vector of features.
Recall that I defined measurement as $t = f(I)$ (\ref{measurement}). In the
definition of machine learning given above, the attempt to estimate the
function $\hat{f}(x)$ behind measurements $y_1,y_2...y_i$ can thus be seen as
an attempt to uncover $f(I)$ as a function of the set $I$ of attributes
$i_1,i_2...i_n$ of each unit of observation $u_1,u_2...u_i$.

There are two reasons for wanting to learn such a function from raw data
[@james_introduction_2013 17] : The first is to explore the coefficients in the
function to learn more about the relationship between the variables, or rather,
what has been learned about this relationship. This is usually the purpose of
traditional regression analysis, where insight is gained from examining
coefficients, that show statistical correlations between different indicators
with various degrees of confidence. 

The second reason is to use the learned function to predict new outcomes. This
is extremely useful when an outcome of interest is more expensive or difficult
to measure than the features [@james_introduction_2013 28]. Consider this in
the case of text classification; observing manifest features of text is
trivial, while measuring "hidden" information content, significance, or
relevance is a much more difficult task.

A basic dichotomy in machine learning is the distinction between supervised
learning and unsupervised learning [@grimmer_text_2013 2]. The difference
between these rather different approaches, is that with supervised learning,
the goal is to estimate a function of an outcome variable that is observed,
while with unsupervised learning, a theorized number of outcomes are inferred
from patterns in the data.

Supervised learning models are estimated using "training data", where the
outcome variable is given, while unsupervised models are used to "discover" an
outcome variable as a pattern in the independent variables. This process of
"teaching" the model about the connection between indicators and the outcome
variable $y$ means that essentially, the outcome function $f$ will be an
imitation, or rather extrapolation of the coding function that "generated" the
outcomes in the training data. 

This means that supervised learning and subsequent classification must proceed
from a set of data that has been labelled [@grimmer_text_2013 p. 3], as
described in the previous chapter. The system then attempts "to find a concept
which will categorize all objects in the universe in the same manner as the
experimenter has categorized them" [@hunt_experiments_1966 p. 10]. Thus, the
algorithm "learns" how to classify documents, mimicking the assumed decision
rule $f$ applied by the human hand coders [@grimmer_text_2013 p. 9].

It is clear from the definition given above that machine learning and formal
measurement are analogous processes. The basic premise is estimating a function
of a given set of traits, that will be used to infer some unobserved trait of
interest. Machine learning models can thus be thought of as "measuring
instruments". 

Supervised models use the procedures and rules established in the training data
to establish the measuring procedure. This means that a supervised learning
model is a tool of _extrapolation_. It is thus very important to mindfully
develop the rules with which the training data is classified: Valid training
data is a prerequisite for valid outcomes using a trained model.

## Evaluation methodology 

There is no way to determine the ideal approach to estimating $\hat{y}$
a-priori. Measuring the performance of different approaches is the only way of
determining which procedures perform well in a given context
[@grimmer_text_2013 3]. In addition to the classification step, different
strategies for expanding each unit into a corresponding feature vector should
also be considered. 

Using flexible, powerful modelling techniques, it is possible to estimate
a function $\hat{f}$ that will perfectly predict $y$ for each training case.
This will inevitably result in an _overfit_ model, however: A model that does
not generalize well to new, unobserved cases [@james_introduction_2013 22]. The
term $\epsilon$ in the definition of statistical learning means that it must be
assumed that the training data contains some specific variance in addition to
the "common" variance that we are trying to model. 

Fitting too flexible models to the data might lead to models that express the
specific variance of the training set, a situation called "overfitting"  where
the classifier is trained to recognize the semantically trivial characteristics
in the training data. These characteristics are not useful for classifying the
phenomenon of interest more generally, but might be correlated with the
phenomenon in the training data. 

Recall from chapter 4 that information relayed through language is affected by
the stochastic elements of language formulation; any given piece of information
could be expressed in multiple ways. What this means is that each training case
contains both uninteresting idiosynchrasies and information; in the terms used
to discuss validity, we might say that each training case is affected by
specific and general variance.

To handle this problem, evaluation strategies should be designed so that each
procedure is tested on unseen data, that is not used to estimate the procedure.
This is done by splitting the data into separate partitions, estimating the
classifier using one partition, and applying it to an "unseen" partition. In
addition, a final "holdout" partition can be used to give a definitive score
using data that has not been used at all during preliminary evaluation of the
development of the model. Because the data used to calculate the metrics are
not used in estimating the model, the metrics give an indication of how well
the model will generalize, thus avoiding overly specific, overfit models.

Comparing $y$ and $\hat{y}$, the predicted and actual classification of text in
the unobserved data, it is possible to quantify model performance directly by
calculating several metrics that favor different kinds of model performance.
The choice of a performance metric affects the choice of models, therefore it
is important to reflect on the characteristics of the different metrics.
It is also important to consider different approaches to partitioning the data.
If data is scarce, the testing partition might be too small to produce
a representative metric: 

### K-fold cross validation

The partitioning of the data can be done in several ways. The simplest is
sampling a percentage of the data randomly, splitting it into two parts,
training the model on one part, and evaluating it on the other. The randomness
ensures that the model is representative of the whole data set. However, if the
data set is small, the respective partitions become to small to yield
reasonable results.

Resampling is a technique that involves estimating an equivalent model from
multiple randomly created partitions of the same data. With multiple different
random partitions, the resulting models will differ slightly. Calculating
evaluation metrics for each model gives a more robust impression of how the
modelling approach is performing. 

One such approach is called K-fold cross validation [@james_introduction_2013
181]. This involves splitting the data into $K$ partitions, called "folds". $K$
models are then trained, excluding one part of the data in each case, thus each
model is trained on $K-1$ folds. Evaluating each model using the left-out fold
gives a more robust and complete picture of how the modelling strategy is
working on the whole of the data, as every data point is used for evaluation,
yielding more generalizable results. 

In addition to the K-fold validation procedure, ten percent of the data is
"held out" from the process of specifying and testing the procedures. This data
is unseen until the final evaluation, and will thus give a good indication of
how well the classifiers generalize. This is a good strategy, because the
results from development testing data might be biased towards good performance,
since procedures are developed and selected using only this data
[@jurafsky_speech_2018 77].

### Metrics

When a classifier is used to predict scores for $y$ where $y$ is already known,
its performance can be evaluated in terms of how often it classifies correctly.
A Confusion Matrix [@fawcett_introduction_2006] is a way of presenting the
performance of a classifier, and can be used to calculate additional
performance measures.

In this matrix, the rows represent the hypothesized class of each case, and the
columns represent the true case. Given two possible values of $y$, P and N,
four possible outcomes are possible: If the value of $y$ is P, the classifier
can either produce a "true" P, TP, or a "false" N, FN. Conversely, if the value
of $y$ is N, the classifier can either produce a TN, or a FP: 

```{R confMat, results = 'asis',include = TRUE}
```

While the Confusion Matrix is a useful tool for evaluating classifiers up
front, when comparing classifier specifications, it is often useful to express
performance in terms of metrics, summarizing the matrix. From the Confusion
Matrix, it is possible to calculate several such metrics, which summarize the
performance of the classifier in various ways.  Choosing to focus on a
particular performance metric is an important decision when designing a
classification scheme, as different metrics emphasize different kinds of
performance.

A natural point of departure is to calculate the ratio of _correct
classifications_ to _total classifications_, called the _accuracy_ of the
procedure. The major diagonal of the confusion matrix represents correct
decisions, while the minor diagonal holds erroneous decisions. From these,
accuracy is defined as:

\begin{align*}
Accuracy &= \frac{TP + TN}{TP + FP + TN + FN}
\end{align*}

However, while accuracy is desirable in any case, an accurate classifier is not
necessarily useful. In a case where there are very few true positive cases, a
procedure yielding only negatives will achieve a very high accuracy, while not
being of much use in finding the positives [@jurafsky_speech_2018 74].

From these, and the column totals
$N$ and $P$, how many cases of $y=N$ and $y=P$ there are in total, it is
possible to calculate:

\begin{align*}
 Precision &= \frac{TP}{TP + FP}\\
 Recall &= \frac{TP}{P}
\end{align*}

Recall gives the ratio of _correctly classified_ cases P, to _actual_ cases P,
while precision gives the measure of _correctly classified_ cases P to _total
classified_ cases P.  Recall thus reflects the degree of coverage, while
precision reflects the credibility, or trustworthiness of predicted P.

In simpler terms, a more conservative classifier scores higher on precision
than recall [@fawcett_introduction_2006 863]. Importantly, high precision and
high recall tend to be mutually exclusive, [@chinchor_muc-4_1992, p. 24].
Thus, a choice must be made: If it is very important to catch all of the
positive cases, and some noise in the outcome is acceptable, recall should be
prioritized.  Conversely, if it is important that the cases classified as
positive are not actually negative, precision should be prioritized
[@hanna_mpeds_2017 p. 13].

#### F1 and ROC

A "compromise" between these two statistics is the F statistic. The F statistic
is calculated from precision and recall, and rewards models with equal, strong
precision and recall while punishing models with low scores, or high but
asymmetric scores in either statistic.

\begin{align*}
 F = \frac{(\beta^{2} + 1) \times Precision \times Recall}
          {\beta^{2}\times Precision + Recall}
\end{align*}

The balancing parameter $\beta$ is used to determine the balance of the effect
of Precision and Recall. The special case where $\beta = 1$, making $F$ equal
to the harmonic mean of Precision and Recall, is termed $F1$. "Weighting" the F
score towards either Precision or Recall can be done based on considerations of
the importance of credibitlity versus coverage. 

For the specific task of classifying sentences as either "interesting" or not
for the coders, one must consider the importance of either missing too many
relevant sentences, or including too many irrelevant sentences. While it may
seem logical to avoid missing as many potentially relevant sentences as
possible, the system must also perform well in filtering the information, as
that is its main function in the coding process. I therefore chose to weigh the
measures equally, and to rank the models according to their F1-score. 

Lastly, i also present some of the approaches as points in ROC-space. ROC-space
is defined [@fawcett_introduction_2006 862] as the two-dimensional space
comprised of the evaluation metric dimensions Recall and Fallout. Fallout is
a measurement of the number of cases with a true score of N, that have been
classified as P. 

\begin{align*}
Fallout= FP / N
\end{align*}

When metrics calculated from a confusion matrix from a given procedure are
mapped to ROC space, the point indicates the degree of coverage, Recall, versus
what might be termed the "trustworthiness" of the procedure, represented as
Fallout. More lenient models will produce more False Positives, but will also
cover a larger array of the True Positives. More conservative models, on the
other hand, will discard more True Positives as false, but will also produce
fewer False Positives, as illustrated here:

```{R rocToy, include = TRUE}
```

In this toy example, $a$ is the model that combines a reasonable Recall without
encurring too much fallout. $c$, on the other hand, correctly classifies more
positives, but also wrongly classifies many negative cases as positives.  Both
$b$ and $d$ are dangerously close to the line between 0,0 and 1,1; These models
do not perform much better than random guessing would.

The models $a$ and $b$ both perform well; choosing one of them involves
a substantial choice: Is it more important to catch as many positives as
possible, thus risking a less trustworthy set of predictions? Or is the
trustworthiness of the predictions the most important element? This must be
determined by considering the context in which the results will be used. 

## Procedure selection 

At the outset, it is important to determine the number and qualities of steps
that will be compared.  Any number of steps, algorithms and parameters could be
tested, but a selection is made to facilitate testing. 

Importantly, in a addition to the classification step described above, i also
include preprocessing and vectorization steps as part of the procedures that
will be compared. In fact, only two variants of the classification step will be
considered here; an SVM model with and without hyperparameter tuning.  In
addition, a classification procedure involves all of the steps necessary to
predict outcomes from text, including preprocessing and vectorization of the
text.

The reason for limiting the range of procedure variants that will be considered
is related to the exponential increase in variants that must be evaluated; The
number of procedures that must be tested increases exponentially for each step
that is considered. This makes it necessary to select a subset of steps to
focus on; i have chosen to consider several different preprocessing steps,
instead of different classifiers.

SVM is one of the most common algoritms used for machine learning
classification  [@pustejovsky_natural_2012 39], and was chosen because it is
considered one of the best classifiers "out of the box"
[@james_introduction_2013 337]. The great advantage of SVM, along with the also
common Logistic Regression and Naïve Bayes models, is that it balances
simplicity with predictive power [@jurafsky_speech_2018 394], usually yielding
adequate results, while not requiring long training cycles and complex tuning.
It would of course be very interesting to apply more advanced classification
schemes to the task presented here, and compare the results, but for the sake
of parsimony, i have chosen to only present results from using an SVM.

The SVM model has a single hyperparameter, which must be specified prior to
estimation. The parameter C determines the amount of error that will be
tolerated by the separating hyperplane. Essentially, C determines the
"slackness" of the separating rule; if C is small, the model is tightly fit to
the data, potentially increasing the risk of overfitting. If C is large, on the
other hand, the model might be underfit, and miss the relevant relationship.
C is treated as a tuning parameter [@james_introduction_2013 347]. This means
that determining an a-priori value for C is not possible; several procedures
must be estimated using cross-validation to determine which C-value yields the
best results on testing data. In the presentation in the next chapter, the
"tuning" step represents the inclusion of C-tuning; otherwise, C is set to 1,
the default value in the implementation used here. 

### Text as data 

"Raw" data like text, numbers and audio has no inherent vector representation,
and must be given one through the measurement of some property or feature. This
is called featurization.  Featurization is essentially just a given way of
measuring one or several attributes of an object to create an analyzable
representation of it [@zheng_feature_2018 10]. 

Featurization is arguably the most important step when making a machine
learning system, and might have a very strong effect on classifier performance
[@bird_natural_2009  224]. This resonates with how we understand measurement,
or indeed comprehension in general. What attributes we choose to look at, or
ignore, determines what we are able to understand about some case. The
procedures presented in the following chapter largely differ in terms of the
way text is vectorized. 

Featurization means that each case is given a feature representation $x_1 ...
x_i$. Any structured measurement procedure, computerized or not, depends on
some sort of "featurization", which is more or less rigid. In the case of using
computers, however, featurization must be entirely schematic, and predefined.
While, as i argued, all measurement procedures can be more or less
metaphorically viewed as mathematical functions, computer classifiers are
actual mathematical functions that map vectors to outcomes. This means that all
units must be given a numeric vector representation, which expresses some set
of features that are determined to be relevant to the classification problem. 

As briefly described in chapter 4, units of text such as sentences or documents
can be expressed in terms of a set of symbols. A document-term-matrix (DTM) is
a data set relation where documents are represented through _symbol
occurrence_, with the word "term" used synonymously with "symbol" and "token".
This means that the variables are symbols, and the values are how often terms
occur in each document. This is an example of such a representation:

```{R}
someData <- tibble(doc = c('a','b','c','d'),
                   text = c('I read text', 'Read that text', 'Text I read', 'Reading text'))

tokens <- unnest_tokens(someData,words,text) %>%
   group_by(words,doc) %>%
   summarize(count = n())
dtm <- cast_dtm(tokens, doc, words, count) %>%
   as.matrix(dtm) %>% 
   as_tibble(rownames = 'doc') %>% 
   arrange(doc)
dtm$Original <- someData$text
```

```{R, include = TRUE, results = 'asis'}
knitr::kable(dtm[,c(ncol(dtm),3:ncol(dtm) - 1)])
```

This is an example of a basic representation of text, the "bag of words"
approach. Under this representation, texts are transformed into a dataset of
count variables, expressing word occurrences. The values can either be
expressed in terms of either-or occurrences, that are binary representations of
whether or not a word occurs or not, or counts, that are numerical values that
express how many times a word appears. 

There are several strategies that attempt to improve the baseline bag of words
approach.  Each of these strategies aims to improve the performance of
subsequent classification, by either including more information, normalizing
the values, or normalizing the data prior to tokenization.

#### Content and utility words

One such strategy involves selecting certain features that are assumed to be
more relevant than others. Only one set of such features is considered for this
approach: Stopwords.  Stopwords are words that might be expected to have little
discriminatory power when classifying text. These include prepositions,
conjugations of "to be", and pronouns like "them" and "he". 

The importance of including stopwords might be said to be related to the
required granularity of understanding necessary to discern between the classes
of text.  In some cases, it might be necessary to discern between texts using
fine nuances in the way the author uses grammatical "utility words" like "the"
and "on", but in other cases, these words have no discriminatory value
[@zheng_feature_2018 66]. The list of stopwords used in the current
implementation is included in the appendix. 

Alternatively, instead of excluding stopwords, one might apply weights to the
coefficients of each word, relative to their Inverse Document Frequency, or
rather, how many distinct documents they occur in. This so called
Term-Frequency-Inverse-Document-Frequency (Tfidf) transformation attempts to
reduce the weight of utility words, since they appear in most documents, while
retaining the weight of content words, which are rarer
[@jurafsky_speech_2018 508].

#### Normalization

A second strategy involves normalization of symbols. The simplest normalization
is treating words that are capitalized and uncapitalized as the same, by making
all letters lowercase. If it is significantly important whether or not words
are capitalized, warranting this distinction, lowercasing might be detrimental
to performance, as it removes this information. In many cases, however, it is
not.

The normalization of numbers relates to how numbers are featurized: Since each
distinct number counts as a separate symbol, numbers increase the number of
features disproportionately to their assumed predictive use. To handle this
diversity, numbers can be transformed into a single token, such as `*number*`.
This retains the information that a number is present, while collapsing the
many distinct number-token columns into a single column. The discriminatory
power of having any kind of number in a sentence is expectedly much greater
than the discriminatory power of observing specific numbers, at least in the
context of this classification problem.

Stemming is another kind of normalization that removes the distinction between
symbols in a courser way. Stemmers reduce each word to a root stem, making
distinct words with the same word stem appear the same. This means that the
words "abstraction", "abstracting", "abstracted" and "abstract" would all be
stemmed and represented by the symbol "abstract". While collapsing several such
words into single stems might significantly reduce the number of distinct
symbols, and thereby reduce the dimensionality of the data, it is also a
heavy-handed reduction of the information content of each text unit. The
relevant question when considering to include stemming is; is the
discriminatory value of suffixed words greater than stemmed words
[@porter_algorithm_1980]. This is, in any case, a difficult question to answer.
Here, it is answered empirically, by evaluating the effect of stemming on
classifier performance. 

#### N-gram featurization

A third strategy involves the featurization step: A perhaps striking fact about
the bag-of-words representation of text is that it discards information that is
often vital for human text comprehension: The sequence of symbols. Word
sequence is an important syntactical component in many languages, that
determines the semantic meaning of text. The tabular representation of texts in
terms of symbol occurrence does not retain this information. 

Thus, using a basic bag-of-words approach rests upon the assumption that the
sequence of words is not useful for predicting $y$. It is worthwhile to
evaluate this assumption, by including procedures that vectorize the text in
the form of n-grams. An n-gram is a representation of n number of words in
sequence. Two such n-gram representations are considered here: Bigrams, and
trigrams.

Since we are using statistical techniques to determine the significance of each
feature, why not include as many features as possible and let the classifier
sort them out? Again, this relates to the problem of overfitting
[@bird_natural_2009 225]. If the classifier is allowed to estimate its function
certainly model too much noise, relative to the signal that we are after.

