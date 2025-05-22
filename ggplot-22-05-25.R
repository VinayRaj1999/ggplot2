install.packages("ggplot2")
library(ggplot2)
library(tidyverse)


mtcars
iris

ggplot(data=mtcars %>% head(),aes(x=disp,y=hp))+# x-axis,y-axis and data 
  geom_point() # wat kind of plot

tibble(age=c(21,23,22,24),
       height=c(160,170,175,180)) ->df
ggplot(df,aes(x=age,y=height))+
  geom_point()

ggplot(df,aes(x=age,y=height))+
  geom_line()


read.csv("sample_sales_data.csv")->sale

ggplot(sale,aes(x=Product,y=Quantity))+
  geom_bar(stat="identity")


# Basics of ggplot syntex

# syntex: ggplot(data,aes(x,y))+geom_type()
mtcars

# 1.scatter plot 
ggplot(data=mtcars,aes(x=mpg,y=hp))+
  geom_point()


# 2.line_plot
ggplot(data=mtcars,aes(x=mpg,y=hp))+
  geom_line()

# 3.bar chart 
ggplot(data=iris,aes(x=Species))+
  geom_bar()

# 4.histogram 
mtcars
ggplot(data = mtcars,aes(x=wt))+
  geom_histogram(binwidth = 2)



# Example-1 Titles and axis labels 
ggplot(data=mtcars,aes(x=mpg,y=hp))+
  geom_point()+
  labs(title = "Mileage vs Weight",x="Weight",y="Miles per gallon")

# Example-2.line_plot
ggplot(data=mtcars,aes(x=mpg,y=hp))+
  geom_line()+
  labs(title = "Sepal Dimensions",subtitle="Grouped by Species",
       caption="Source:iris dataset")


# --------------------------------------------------------------------------

read.csv("sample_sales_data.csv")->sale
sale %>% colnames()

ggplot(sale,aes(x=UnitPrice,y=TotalPrice,
                shape = Product,colour = Product))+
  geom_point(size=2)+
  scale_color_manual(values = c("blue","red","yellow","black","green"))



# Example-1:Add colour by category 
ggplot(data = iris,aes(x=Sepal.Length,
                       y=Sepal.Width,colour=Species))+
  geom_point()


# Example-2: Change size by a variable 
ggplot(data = mtcars,aes(x=wt,y=mpg))+
  geom_point(size=3,shape=2)+
  geom_line(size=0.4)


# ---------------------------------------------------------
read.csv("sample_sales_data.csv")->sale
sale %>% colnames()

ggplot(sale,aes(x=UnitPrice,y=TotalPrice))+
  geom_point(size=3)+
  labs(title = "Price comparision")+
  scale_color_brewer(palette = "Set2")+
  scale_x_continuous(breaks = seq(250,500,by=25),
                     limits = c(250,500))+
  scale_y_continuous(breaks = seq(2000,5000,by=250),
                     limits = c(2000,5000))



# ----------------------------------------------------------
students <- tibble(
  Name = c("Asha", "Ben", "Chitra", "Dev", "Esha", "Farhan", "Geeta", "Hari", "Isha", "Jay"),
  Gender = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  Score = c(78, 85, 69, 92, 88, 76, 83, 95, 70, 80),
  Hours = c(5, 7, 4, 9, 6, 5, 8, 10, 3, 6),
  Department = c("Math", "Science", "Math", "Math", "Science", "Science", "Math", "Science", "Math","Science")
)
# task-1
# 1.plot score vs hours with both points and a line 
ggplot(data=students,aes(x=Score,y=Hours,colour = Gender,shape = Gender))+
  geom_point(size=4)+
  facet_wrap(Gender~Department)

