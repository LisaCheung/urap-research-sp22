q2 <- read.csv(file = 'URAP-Research-Q.-2.csv')
head(q2)

grad_only <-subset(q2,PatientType == "Student_G", select=c(TestResult, CollectionDate))
head(grad_only) 

install.packages("tidyr")
library("tidyr")

grad_only2 <- grad_only %>%
  separate(CollectionDate, c("CollectionDateMonth", "CollectionDateDay","CollectionDateYear"), "/")
head(grad_only2) 

grad_only2 <- subset (grad_only2, select = -CollectionDateDay)
head(grad_only2)

#total grad pop 
nrow(grad_only2) 

#pos grad pop 
grad_p <-subset(grad_only2,TestResult == "Positive")
nrow(grad_p)

#pos grad pop 
library(dplyr)
grad_p1 <- grad_p %>% group_by(CollectionDateMonth,CollectionDateYear) %>% summarise(count_by_month_yr = n())
grad_p1

#use
grad_p1 <- grad_p1 %>% 
   mutate(count_percent = count_by_month_yr / nrow(grad_p))
grad_p1

#neg grad pop 
grad_n <-subset(grad_only2,TestResult == "Negative")
nrow(grad_n)

#neg grad pop 
library(dplyr)
grad_n1 <- grad_n %>% group_by(CollectionDateMonth,CollectionDateYear) %>% summarise(count_by_month_yr = n())
grad_n1

#use
grad_n1 <- grad_n1 %>% 
   mutate(count_percent = count_by_month_yr / nrow(grad_n))
grad_n1

undergrad_only <-subset(q2,PatientType == "Student_U", select=c(TestResult,CollectionDate))
head(undergrad_only) 

undergrad_only2 <- undergrad_only %>%
  separate(CollectionDate, c("CollectionDateMonth", "CollectionDateDay","CollectionDateYear"), "/")
head(undergrad_only2) 

undergrad_only2 <- undergrad_only %>%
  separate(CollectionDate, c("CollectionDateMonth", "CollectionDateDay","CollectionDateYear"), "/")
head(undergrad_only2) 

#total undergrad pop 
nrow(undergrad_only2) 

#pos undergrad pop 
undergrad_p <-subset(undergrad_only2,TestResult == "Positive")
nrow(undergrad_p)

#neg undergrad pop 
undergrad_n <-subset(undergrad_only2,TestResult == "Negative")
nrow(undergrad_n)

#pos undergrad pop 
library(dplyr)
undergrad_p1 <- undergrad_p %>% group_by(CollectionDateMonth,CollectionDateYear) %>% summarise(count_by_month_yr = n())
undergrad_p1

#use
undergrad_p1 <- undergrad_p1 %>% 
   mutate(count_percent = count_by_month_yr / nrow(undergrad_p))
undergrad_p1

#neg undergrad pop 
library(dplyr)
undergrad_n1 <- undergrad_n %>% group_by(CollectionDateMonth,CollectionDateYear) %>% summarise(count_by_month_yr = n())
undergrad_n1

#use
undergrad_n1 <- undergrad_n1 %>% 
   mutate(count_percent = count_by_month_yr / nrow(undergrad_n))
undergrad_n1


