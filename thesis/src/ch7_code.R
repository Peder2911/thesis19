
## @knitr setup 

models <- read.csv('data/models.csv', stringsAsFactors = FALSE)
modelConfigs <- read.csv('data/configurations.csv', stringsAsFactors = FALSE)
modelResults <- read.csv('data/results.csv',stringsAsFactors = FALSE)

nModels <- nrow(models)

resultSum <- modelResults %>%
   group_by(name) %>%
   summarize(f1 = mean(f1))

annotation <- resultSum %>%
   mutate(annotated_name = paste0(name, ' - F1:', f1)) %>%
   select(name,annotated_name)

topModel <- resultSum[resultSum$f1 == max(resultSum$f1),]

resultSum$fam <- str_extract(resultSum$name,'[a-z]+(?=-)')

bestFam <- resultSum %>%
   group_by(fam) %>%
   top_n(n = 1, wt = f1)

bestModels <- head(arrange(resultSum, -f1), n = 3)
worstModels <- head(arrange(resultSum, f1), n = 3)

bestWorst <- c(bestModels$name,worstModels$name)

bestWorstRes <- modelResults %>%
   filter(name %in% bestWorst)

bestFamRes <- modelResults %>%
   filter(name %in% bestFam$name)

topScore <- bestModels[1,'f1']

## @knitr modelsTable

modelConfigs$name <- factor(modelConfigs$name)
modelGrid <- reshape::melt(modelConfigs, id.vars = 'name') %>% 
   ggplot(aes(x = variable, y = name, alpha = value)) + 
   geom_point(size = 5, color = 'springgreen4') + 
   scale_y_discrete(limits = rev(levels(modelConfigs$name))) +
   labs(x = '', y = '') +
   theme_light()+
   theme(legend.position = 'none', axis.text.x = element_text(angle = 45, hjust = 1))

resultHist <- ggplot(resultSum) + 
   geom_segment(aes(x = name, xend = name, y = 0.7, yend = f1),
                size = 5, color = 'springgreen4') +
   scale_x_discrete(limits = rev(levels(modelConfigs$name))) +
   scale_y_continuous(limits = c(0.7,0.8), expand = c(0,0)) + 
   coord_flip() +
   theme_light()+
   labs (x = '', y = 'Mean F1 score')+
   theme(plot.margin = margin(0.15,0,1.18,0, unit = 'cm'))

grid.arrange(modelGrid,resultHist, ncol = 2) 

## @knitr distPlot 

ggplot(bestWorstRes)+
   geom_density(aes(x = f1, fill= name), 
                alpha = 0.5, color = 'light gray') + 
   scale_x_continuous(limits = c(0.65,0.95)) +
   labs(x = 'F1 scores', y = 'Density', fill = 'Classifier')

## @knitr rocPlot 

inline <- ggplot(bestFamRes, aes(x = fallout, y = recall, color = name)) +
   geom_point()+
   geom_abline(intercept = 0, slope = 1,color = 'dark gray') +
   labs(x = '',
        y = '')

inlineAdjust <- theme_light() + 
   theme(plot.margin = unit(c(0.1,0.1,0,0), "cm"),
         legend.position = "none",
         text = element_text(size = 8))

roc <- inline +
   geom_density2d(alpha = 0.2)+
   scale_x_continuous(limits = c(0,1)) +
   scale_y_continuous(limits = c(0,1)) +
   labs(x = 'False positive rate',
        y = 'True positive rate')

roc + 
   annotation_custom(ggplotGrob(inline + inlineAdjust),xmin = 0.5, xmax = 1, ymin = 0, ymax = 0.5) 

## @knitr confMat

confusionMatrix <- read.csv('data/holdout_matrix.csv', stringsAsFactors = FALSE)
colnames(confusionMatrix) <- c('Negative','Positives')
rownames(confusionMatrix) <- c('Predicted N','Predicted P')

tp <- confusionMatrix[2,2]
fp <- confusionMatrix[2,1]
tn <- confusionMatrix[1,1]
fn <- confusionMatrix[1,2]


topPrecision <- tp / (tp + fp)
topRecall <- tp / (tp + fn)
topF1 <- (2 * tp) / ((2 * tp) + fp + fn)
topAccuracy <- (tp + tn) / (tp+fp+tn+fn)

xtable(confusionMatrix)

## MaliSentences
sents <- readRDS('data/maliClassified.rds')
cfs <- readRDS('data/maliCeasefires.rds')

rat <- sents %>% 
   group_by(year(realdate)) %>% 
   summarize(ratio = sum(pred) / n(), date = mean(realdate))

ratPlot <- ggplot() + 
   geom_col(data = rat, aes(x = date, y = ratio))+ 
   geom_segment(data = cfs, aes(x = date, xend = date, y = 0, yend = 1),
                color = 'blue', size = 2)

## @knitr wordCoefs

dat <- read.csv('data/word_coefficients.csv', stringsAsFactors = FALSE)

rbind(head(dat,n = 10), tail(dat,n = 10)) %>% 
   ggplot(aes(fct_reorder(word,coef), y = coef, fill = factor(coef > 0))) +
      geom_col() +
      coord_flip() +
      theme_light() +
      scale_fill_manual(values = c('violetred4','skyblue2')) +
      labs(x = '', y = 'Coefficient') +
      theme(legend.position = 'none')



## @knitr somethingElse

topwords <- ggplot(head(dat,n = 10), aes(x = fct_reorder(word,coef), y = coef)) +
                   geom_col(fill = 'springgreen4') +
                   coord_flip() +
                   theme_light() +
                   labs(x = '', y = 'Coefficient') +
                   scale_y_continuous(limits = c(0, 6.5))

bottomwords <- ggplot(tail(dat,n = 10), aes(x = fct_reorder(word,-coef), y = coef)) +
                   geom_col(fill = 'violetred4') +
                   coord_flip() +
                   theme_light() +
                   labs(x = '', y = 'Coefficient') +
                   scale_y_continuous(limits = c(-6.5, 0))

grid.arrange(bottomwords,topwords,ncol = 2)
