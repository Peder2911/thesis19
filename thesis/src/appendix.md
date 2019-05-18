
\newpage

# Appendix

## Countries, sentences and ceasefires

```{R,include = TRUE,results = 'asis'}
data <- readRDS('data/sent_per_cf.rds')
xtable(data,caption = 'Sentences and ceasefires')
```
\newpage
## Codebook for sentences

Basic criterion:
\begin{itemize}
\item Sentence contains any of the words "([Cc]ease-?fire|[Tt]ruce|[Aa]rmistice)" 
In the following, "ceasefire" is understood as either "ceasefire", "truce" or "armistice"
\end{itemize}

Sentences containing any of the following are interesting:
\begin{itemize}
\item ceasefire was declared
\item ceasefire was announced 
\item ceasefire was extended 
\item ceasefire went into effect 
\item *actor* is now observing ceasefire
\item A peace deal includes a ceasefire
\item ceasefire started/starts at *time*
\end{itemize}

Any of the following disqualify sentences as irrelevant:
\begin{itemize}
\item ceasefire provides for... (no time)
\item *actor* calls to respect ceasefire
\item *actor* calls for a ceasefire
\item *actor* offers a ceasefire
\item *actor* wants a ceasefire
\item References to an ongoing ceasefire 
\end{itemize}

\newpage
# Bibliography
