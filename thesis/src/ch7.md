
```{R}
knitr::read_chunk('ch7_code.R')
```

```{R setup}
```

# Results 

In this chapter, i present the results of two batches of tests. The first
batch, where i test several different algorithms on the training data using
K-fold cross validation is used to select the "best" algorithm. This algorithm
is then tested on the unseen held-out data, yielding a generalizable result.
The results from testing the text classifier were positive. The best-performing
specification achieved results that demonstrate its usefulness. 

The system has been used in the coding process for several months,  garnering
positive feedback from the coders. It provides fast, reasonably accurate
predictions that have already been used by coders to speed up information
extraction from the text material.

The code that was used to define each step, the test framework and the machine
learning algorithms is released along with this thesis on the MIT license, and
can be found by following links included in the appendix.

## Procedure

Using the data described in chapter 5, several classifier algorithms were
created. The modelling step in each of these procedures is an estimation of the
"manual" procedure that was used to classify the message units as either
relevant or irrelevant, $\hat{f}$, and is used to extrapolate this procedure to
produce predictions of relevance for further coding work. 

Determining what the ideal steps for processing and classifying the text would
be a-priori is not possible [@grimmer_text_2013 3], and so, figuring out what
steps to apply involves testing the performance of the algorithms on coded
data. `r nModels` configuration are presented below. The algorithm that
performs best in the k-fold evaluation step is then used to classify the
held-out data, yielding a set of definitive metrics that indicate how useful
supervised learning might be for relevance-classifying raw text in this
specific problem domain.

What is a good score? This must, in any case, be defined in terms of the task.
There exists no general standard of passable scores for either of the metrics
presented here [@hanna_mpeds_2017 13]. For this domain, however, i would argue
that the results attained by the best approach are quite good, especially
considering the relative simplicity of the classifier, preprocessing and
featurization schemes.

An even more advanced featurization, or classification step might have yielded
even better results, although the results clearly indicate that the attempts to
improve performance through slightly more sophisticated procedures did not pay
off in this case. The combination of parsimony and performance makes the
top-performing procedure a good alternative for the task of ranking the
relevance of sentences for coders, attaining an F1 score of 
`r round(max(resultSum$f1), digits = 2)`. 

## Evaluation 

`r nModels` different classifier configurations were evaluated. The number was,
in part, limited by practicality: The total number of combinations of 
`r ncol(modelConfigs)-1`
different steps is 
`r 2^(ncol(modelConfigs)-1)`
. To facilitate the comparison, i chose to limit the configurations into 
`r length(unique(str_extract(models$name,'[a-z]+(?=-)')))`
"families" of models.  The mean F1 results indicate the performance of the
model. Mean F1 is calculated as the mean of 10 k-fold tests of each classifier. 

```{R modelsTable, include = TRUE, warnings = FALSE}
```

The Alpha family gradually introduces different steps, such as model tuning,
Tfidf-normalization lowercasing, and n-gram featurization. The Beta family
introduces number-word normalization and stopword removal, using the
best-performing combination from Alpha. Finally, Gamma introduces stemming.
Bigram and Trigram tokenization is tested in all of the three groups.

What is immediately apparent from this comparison, is that the different
approaches to modelling are quite similar in terms of performance. Note that
the scale on which the F1 parameter is displayed is heavily compressed: The
F1 parameter varies between 0 and 1, while F1 values displayed here range between
`r round(min(resultSum$f1), digits = 2)` and 
`r round(max(resultSum$f1), digits = 2)`.

Still, there are certainly interesting differences in performance. Most
notably, the attempts to improve performance by including preprocessing and
n-gram featurization are actually detrimental to the F1 score. This not too
surprising, considering the discussion of these steps in the previous chapter:
more advanced preprocessing and vectorization steps might improve performance
in some cases, but are not proven to be effective in all cases: Their
effectiveness rests on certain assumptions about the text.

The best-performing classifiers from each family were also situated in ROC
space.  This plot shows that the performance detriment in the gamma-family
seems to stem from the fact that the model yields slightly more false
positives, while not gaining any significant new amount of true positives. This
is penalized by the balancing parameter F1.

```{R rocPlot, include = TRUE}
```

The top performing classifier, with a mean F1 score of 
`r round(topModel['f1'], digits = 2)`, was 
`r topModel['name']`.
 `r topModel['name']`
thus seems to be the best $\hat{f}$ for predicting $y$ that was attainable with
the techniques attempted here, and the training data that was used. It should,
however, be noted that the difference between the F1 value of the top
performing classifier and the F1 value of the worst performing one, 
`r resultSum[resultSum$f1 == min(resultSum$f1),'name']`, 
is only 
`r round(max(resultSum$f1) - min(resultSum$f1), digits = 4)`.

It is certainly interesting that the procedure that yielded the best scores in
the cross-validation evaluation was the simplest one. This is not easily
interpretable, but should be considered in light of the discussion of these
steps in the previous chapter. Feature selection might be excluding certain
features that are actually relevant, symbol normalization like stemming and
lowercasing might be removing important nuances of information from the
normalized symbols, and n-gram vectorization seems to lead to an
overproliferation of features, that the model is not able to utilize
effectively. Model tuning and Term-frequency-inverse-document-frequency,
however, yield slight improvements over the baseline model.

#### Holdout evaluation

To evaluate the generalizability of 
`r topModel['name']`, 
the procedure was subsequently tested on the held out data; data that has not
been handled during the development and testing of the procedures. The simple
but effective procedure performed very well, largely classifying the results
correctly:

```{R confMat, include = TRUE, results ='asis'}
```

This translates to a precision score of 
`r round(topPrecision, digits = 2)`
, a Recall score of
`r round(topRecall, digits = 2)`
, an accuracy of
`r round(topAccuracy, digits = 2)`%
, and an F1 score of 
`r round(topF1, digits = 2)`.
These scores seem to indicate that the information about whether or not a sentence is
relevant or not for further coding yields itself quite well to classification;
the proposed lower boundary for acceptable F1 values for a similar
classification problem has been suggested as 0.65 [@hanna_mpeds_2017 13].

## Discussion 

The classifier has already been "put to work" in the process of coding the PRIO
ceasefire-dataset. While it is still necessary to manually code the details of
each ceasefire, such as what the parties are, what conflict the ceasefire
pertains to, and the concrete dates on which it begins and ends, the
"reccomendation system" that has been implemented with this classifier helps
coders skim through the material much more efficiently.  While no quantitative
evaluation of the effect of the system on manual coding performance has been
conducted yet, anectodal information from these first trials has been
promising:

Using the top-performing algorithm on the material before starting to code, a
coder would presumably have to go through much less information, while being
confident that relevant material is not being filtered out. The performance of
`r topModel['name']` on the heldout data is sufficiently good to warrant this
trust. In addition to improving the coding of new material, going over already
coded news material with the classifier helps validate the coding, and might
uncover data points that have been missed during the first pass. Due to the
speed with which the system works, the material can be processed very quickly;
even re-processed each time the model is updated with new training data. 

Adding more training data is the most obvious way to increase performance.
Including data from more conflicts and countries would improve the
generalizability of the classifier. Producing training data is laborious, but
pays off in terms of model performance; strategies for producing useful
training data, like using active learning [@rubens_active_2015 809] might be
interesting to explore when creating more training data.  In addition,
exploring the merit of more advanced vectorization and classification
techniques would be interesting. Vectorizing text using sentence embeddings
[@le_distributed_2014] would be particularly interesting to explore.  In
addition, promising results have been attained using Neural Networks
[@beieler_generating_2016]; a much more advanced and computationally intensive
classifier strategy.

Automating the coding process further would require the development of more
sophisticated algorithms for parsing and processing the sentences, and
extracting information. The system presented here is only a single step towards
a fully automated coder, but discerning between relevant and irrelevant text
units is an important first step in this process [@hanna_mpeds_2017 7].
Stepping up the ladder towards fully automated information extraction, masses
of unstructured information might be made intelligible, and open to analysis.
In addition, such a system could be made to create the data in real-time,
updating the data set continuously.

```{R wordCoefs, include = TRUE}
