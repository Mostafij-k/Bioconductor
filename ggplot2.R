#simple polt using ggplot
ggplot(gapminder, aes(continent)) +
        geom_bar()
# use of pipe in ggplot
gapminder %>%
      filter(year==1952)%>%
      ggplot(aes(continent)) +
       geom_bar()
#plot populations
head(gapminder)
gapminder %>%
  filter(year==1952)%>%
  ggplot(aes(continent, pop))+
     geom_bar(stat="identity")

#same result different way
gapminder %>%
  filter(year==1952)%>%
  ggplot(aes(continent, pop))+
    geom_col()
#stacked bar
gapminder %>%
  filter(year>=1952 & year<=1970) %>%
    ggplot(aes(year, pop))+
     geom_bar(stat= "identity")
# fill continent with color
gapminder %>%
  filter(year>=1952 & year<=1970) %>%
  ggplot(aes(year, pop))+
  geom_bar(stat= "identity", aes(fill=continent))
#facet function scatter plot
ggplot(gapminder, aes(lifeExp, gdpPercap))+
      geom_point()+
      facet_grid(.~continent)
# another way
ggplot(gapminder, aes(lifeExp, gdpPercap))+
  geom_point()+
  facet_grid(continent~.)
# facet_wrap()

#coordinate flip
ggplot(gapminder, aes(continent, lifeExp))+
      geom_boxplot()+
      coord_flip()
#show color
ggplot(gapminder, aes(continent, lifeExp, fill=continent))+
  geom_boxplot()
# change theme
#theme_bw classic
ggplot(gapminder, aes(continent, lifeExp, fill= continent))+
  geom_boxplot()+
  theme_bw()

ggplot(gapminder, aes(continent, lifeExp, fill= continent))+
  geom_boxplot()+
  theme_classic()

ggplot(gapminder, aes(continent, lifeExp, fill= continent))+
  geom_boxplot()+
  theme_bw(base_size=16)

ggplot(gapminder, aes(continent, lifeExp, fill= continent))+
  geom_boxplot()+
  theme_bw(base_family=16)



