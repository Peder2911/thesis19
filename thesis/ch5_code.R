
## @knitr sentencesSetup 

training <- read.csv('data/tr90.csv', stringsAsFactors = FALSE)
holdout <- read.csv('data/ho10.csv', stringsAsFactors = FALSE)

positives <- readLines('data/positives')
negatives <- readLines('data/negatives')

pos <- tibble(txt = positives, val = 1)
neg <- tibble(txt = negatives, val = 0)
all <- rbind(pos,neg)
all$doc <- row.names(all)

training$doc <- row.names(training)

tokens <- unnest_tokens(training,word,txt, to_lower = FALSE)

nTokens <- group_by(tokens, doc) %>%
	summarize(cnt = n())

saveRDS(nTokens,'ntokens.rds')
saveRDS(tokens,'tokens.rds')

perdoc <- tokens %>%
   filter(!word %in% stop_words$word) %>%
   group_by(doc, word) %>%
   summarize(cnt = n()) 

wordPerDoc <- mean(perdoc$cnt)

## @knitr trHoSummary

corpSum <- read.csv('data/corpusSummaries.csv', stringsAsFactors = FALSE) %>%
   dplyr::rename(n = len, 
          `Mean number of tokens` = ntoken, 
          `Mean number of characters` = nchar, 
          `Relevant sentences` = npos, 
          `Irrelevant sentences` = nneg, 
          `Unique tokens` = utoken)

row.names(corpSum) <- c('Training','Holdout')
corpSum <- corpSum[c(3,4,5,1,2,6)]%>% t() %>% as.data.frame()
xtable(corpSum, caption = 'Data characteristics')

## @knitr sentenceLength

ggplot(nTokens, aes(x = cnt)) +
	geom_histogram(binwidth = 1, fill = "#0072B2") + 
	scale_y_continuous(expand = c(0,0), limits = c(0,130)) +
	labs(x = 'Number of words',
		  y = 'Count') + 
	theme(panel.grid.major.x = element_blank(),
		panel.grid.minor.x = element_blank()) 

## @knitr wordFreq

snowb <- filter(stop_words, lexicon == 'snowball')

makeCount <- function(data, n = 35, clean = TRUE){

   data <- data %>%
      group_by(word) %>%
      summarize(cnt = n())

   data$prop <- data$cnt / sum(data$cnt)

   if(clean){
      data <- data %>%
         filter(! str_to_lower(word) %in% snowb$word,
                ! str_detect(word, '(ceasefire|truce|armistice|cease|fire)'),
                ! str_detect(word,'[^A-Za-z]'))
   }

   
   arrange(data, -cnt)[1:n,]
}

makePlot <- function(data){
   ggplot(data, aes(x = fct_reorder(word,cnt), y = prop * 100)) +
   geom_col(fill = "#0072B2")+
   coord_flip() +
   theme(axis.text.y = element_text(size = 8), 
         panel.grid.major.y = element_blank(),
         panel.grid.minor.y = element_blank()) +
   labs(y = '%', x = '') +
   scale_y_continuous(breaks = seq(0,1,0.1), expand = c(0,0))#, limits = c(0,1))
}

pos <- tokens[tokens$val == 1,] %>%
   makeCount() %>%
   makePlot() + labs(title = 'Relevant sentences')

neg <- tokens[tokens$val == 0,] %>%
   makeCount() %>% 
   makePlot() + labs(title = 'Irrelevant sentences')

grid.arrange(pos,neg,ncol = 2)
