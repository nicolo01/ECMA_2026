rm(list = ls())
#let's clean the environment
library("ggplot2")
#reload the package
data("captures")
View(captures)

#Part 2
#Investigate if heavier individuals have longer feet.
#Create a scatter plot with weight_g on the x-axis and 
#footlength_mm on the y-axis.
ggplot(captures,aes(x=weight_g, y=footlength_mm))+ geom_point()
# WARNING MESSAGE Removed 22 rows containing missing values or values outside the scale range
#(`geom_point()`). 
ggplot(captures,aes(x=weight_g, y=footlength_mm))
#notice that if I don't specify "geom_point" the graph does not have points!

#Color the points by the sex variable.
ggplot(captures,aes(x=weight_g, y=footlength_mm, colour = sex))+ geom_point()

#Add a linear regression line (method = "lm") without the confidence interval.
ggplot(captures,aes(x=weight_g, y=footlength_mm))+ geom_point() + geom_smooth(se=FALSE, method = "lm")

ggplot(captures,aes(x=weight_g, y=footlength_mm, colour = sex))+ geom_point() + geom_smooth(se=FALSE, method = "lm")+ ylim(15,30)
#ho modificato l'asse y per renderlo più "leggibile

#what if we delete geom_points?
ggplot(captures,aes(x=weight_g, y=footlength_mm, colour = sex))+ geom_smooth(se=FALSE, method = "lm")
#very better
#maybe there is a low positive correlation between the 2 variables,

#what if we add the function facet_wrap?
ggplot(captures,aes(x=weight_g, y=footlength_mm, colour = sex))+ geom_point() + facet_wrap(~sex)

#question; is it mandatory to remove the NA values?

#Task 2: Weight Distribution (Histogram) Analyze how weight is distributed across the population
#Create a histogram of the weight_g variable.
hist(captures$weight_g) 
#or the video says
ggplot(captures,aes(x=weight_g))+ geom_histogram()

#Warning message:
#Removed 14 rows containing non-finite outside the scale range (`stat_bin()`).
#are both procedures correct?

#Set the binwidth to 2 for better detail.
ggplot(captures,aes(x=weight_g))+ geom_histogram(binwidth = 2)
#okay

#Use facet_wrap to split the histogram by session (Session I vs. Session II).
ggplot(captures,aes(x=weight_g))+ geom_histogram(binwidth = 2)+ facet_wrap(~session)

#maybe it seems that in Session2 we have had more captures
#Use scale = "free_y" inside facet_wrap if one session has significantly more captures than the other.
ggplot(captures,aes(x=weight_g))+ geom_histogram(binwidth = 2)+ facet_wrap(~session,scale="free_y")
#cosi facendo ogni pannello ha un asse y indipendente, e il grafico diventa
#più leggibile all'interno di ogni sessione

#TASK3
#Task 3: Comparing Sex and Age (Boxplot) Check for sexual dimorphism or 
#differences between adults and juveniles.
#following the course
#Create a boxplot with age (A=Adult, G=Juvenile) on the x-axis and weight_g on the y-axis.
ggplot(captures,aes(x=age,y=weight_g))+ geom_boxplot()
#in other courses we simply use
boxplot(captures$age,captures$weight_g)
#it is different, ask why

#Use the aesthetic fill = sex to compare males and females within 
#each age class.
ggplot(captures,aes(x=age,y=weight_g, fill = sex))+ geom_boxplot()
#warning message, Removed 14 rows containing non-finite outside the scale range
#(`stat_boxplot()

#is it possible or mandatory to remove the NA values?
#Question: Which group is the heaviest? Are there many outliers?
#the heaviest group is the male adults, there are some outliers for the juve
#nile NA group
#maggiore dispersione e presenza di outlier tra i giovani
#si è registrato il peso su poche femmine giovani
#all'inizio sarei stato tentato di eseguire tutti i grafici eliminando i
#valori NA, ma mi chiedo se possa essere utile tenerli per evidenziare 
#delle lacune o effettuare successive analisi.

#Task 4: Customization Choose one of your plots and make it "publication-ready":
#Add a title using ggtitle().
ggplot(captures,aes(x=age,y=weight_g, fill = sex))+ geom_boxplot()+ggtitle("ARVICOLA_CMC")
#Change axis labels using xlab() and ylab().
ggplot(captures,aes(x=age,y=weight_g, fill = sex))+ geom_boxplot()+ggtitle("ARVICOLA_CMC")+ xlab("età")+ ylab("peso")
#okay
#Save your final plot using ggsave("MyPlot.png") 
p= ggplot(captures,aes(x=age,y=weight_g, fill = sex))+ geom_boxplot()+ggtitle("ARVICOLA_CMC")+ xlab("età")+ ylab("peso")
ggsave(filename = "Myplot.png")

#then, if you want, you can export
#le femmine adulte sono più "disperse, perchè possono essere pesate quando sono
#gravide e non, a seconda dei momenti.
