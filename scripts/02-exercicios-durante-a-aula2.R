library(broom)
library(readxl)
library(janitor)
library(MASS)
library(lime)
library(GGally)
library(car)
library(ISLR)
library(tidymodels)
library(tidyverse)


#--------------------------------------------------
# Exercício 15: interações
iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(colour = Species)) +
  geom_smooth(method = "lm", se = FALSE, colour = "black") +
  geom_smooth(method = "lm", aes(colour = Species), se = FALSE) +
  theme(legend.position = "bottom")

glimpse(iris)

# O Modelo abaixo ajusta Sepal.Width explicada por 
# Sepal.Length (variável contínua)
# Species (Variável categórica)
# Interações entre Sepal.Length e Species.
modelo_iris <- lm(Sepal.Width ~ Sepal.Length * Species, data = iris)

# Utilizando o model.matrix(), veja como que fica a matriz do modelo.
# Quantas colunas existem?
model.matrix(Sepal.Width ~ Sepal.Length * Species, data = iris)

#--------------------------------------------------
# Exercício 16: 
# Consultando o summary(modelo_iris) e usando geom_abline(), desenhe 
# no gráfico acima uma reta que coincida com a reta veremelha da setosa. 
# Repita o procedimento para versicolor e virginica.
summary(modelo_iris)
iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(colour = Species)) +
  geom_smooth(method = "lm", se = FALSE, colour = "black") +
  geom_smooth(method = "lm", aes(colour = Species), se = FALSE) +
  geom_abline(intercept = -0.5694 + 2.0157, slope = 0.7985 - 0.5666, colour = "purple") +
  geom_abline(intercept = -0.5694, slope = 0.7985 , colour = "purple") +
  geom_abline(intercept = -0.5694 + 1.4416, slope = 0.7985 -0.4788 , colour = "purple") +
  theme(legend.position = "bottom")

#--------------------------------------------------
# Exercício 17: 
# Interprete os parâmetros.
summary(modelo_iris)

#--------------------------------------------------
# Exercício 18: 
# Dentro do mutate(), use a função fct_relevel() para colocar versicolor 
# como o nível de referência da variável Species.
# Ajuste o modelo novamente e veja se algum termo ficou sem valor-p alto.

iris <- iris %>%
  mutate(
    Species = fct_relevel(Species, "versicolor"),
    Species = if_else(Species == "setosa", "setosa", "versicolor ou virginica")
  )

modelo_iris <- lm(Sepal.Width ~ Sepal.Length * Species, data = iris)
summary(modelo_iris)

#--------------------------------------------------
# Exercício 19: 
# Considerando apenas as colunas  Limit, Age e Rating da tabela Credit:
# 1) ajuste uma regressã linear para Balance.
# 2) calcule os VIFs dos 3 preditores usando a função vif().

# dados: Credit
glimpse(Credit)

modelo_balance <- lm(Balance ~ Age + Rating, data = Credit)
vif(modelo_balance)








