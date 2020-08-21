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
# Exercício 1: calcule o EQM da melhor reta e compare com a saída do `summary(melhor_reta)`
# EQM = mean((y - yh)^2)

# Os dados

# cars
glimpse(cars)
ggplot(cars) + 
  geom_point(aes(x = speed, y = dist))

# ajuste de uma regressão linear simples
melhor_reta <- lm(dist ~ speed, data = cars)

# tabela com as predições junto
cars_com_predicoes <- augment(melhor_reta)

glimpse(cars_com_predicoes)

y <-
yh <- 

EQM <- 

summary(melhor_reta) # compare o resultado obtido com essa saída


#--------------------------------------------------
# Exercício 2: calcule beta0 e beta1

x <- cars$speed
y <- cars$dist

xbarra <-  #média de X
ybarra <-  #média de y

beta1 <- 
beta0 <- 




#--------------------------------------------------
# Exercício 3: tire as informações do objeto `melhor_reta`
# para decidir se speed está associado com dist.
# Use a função summary().


#--------------------------------------------------
# Exercício 4: Interprete o parâmetro `speed` (beta 1).


#--------------------------------------------------
# Exercício 5: calcule o R2 para a `melhor reta` e depois
# compare com o valor da saída do `summary()`.
r2 <- 

summary(melhor_reta)
#--------------------------------------------------
# Exercício 6: calcule o R2 ajustado para a `melhor reta` e depois
# compare com o valor da saída do `summary()`.
N <- 
r2aj <- 

#--------------------------------------------------
# Exercício 7: Estude os gráficos que saem do `plot(melhor_reta)`.
# Procure por outliers.
plot(melhor_reta)


#--------------------------------------------------
# Exercício 8: Interprete os parametros do modelo abaixo
# Balance: Saldo no Cartão de Crédito
# Gender: Masculino ou Feminino
glimpse(Credit)

modelo_balance <- lm(Balance ~ Gender, data = Credit)
summary(modelo_balance)


#--------------------------------------------------
# Exercício 9: calcule as médias de `Balance` para cada `Gender`. 
# Compare os resultados com o exercício anterior.



#--------------------------------------------------
# Exercício 10: Explore como usar a função model.matrix().
# Use a função model.matrix() no lugar de lm() do exercício 8 e 
# veja sua saída.


#--------------------------------------------------
# Exercício 11: Repita os exercícios 8, 9 e 10, mas agora
# usando Ethnicity no lugar de Gender.


#--------------------------------------------------
# Exercício 12: Crie um boxplot de Balance para cada Ethnicity
# e avalie se a análise visual é compatível com o que os valores-p
# indicam.
Credit %>%
  ggplot() +
  geom_boxplot(aes(x = Ethnicity, y = Balance)) +
  coord_flip()

#--------------------------------------------------
# Exercício 13: Use os dados simulados `y_x` abaixo:

# dados:
set.seed(1)
y_x <- tibble(
  x = runif(60),
  y = 10 + 0.5*log(x) + rnorm(30, sd = 0.1)
) %>%
  mutate(
    x2 = log(x)
  )

ggplot(y_x) + geom_point(aes(x = x2, y = y))

# use lm() para ajustar os seguintes modelos:
# 1) y ~ x, data = y_x
# 2) y ~ log10(x), data = y_x
# Avalie qual modelo é melhor quanto ao EQM e quanto ao R^2.

modelo_lin <- 
modelo_log <- 

summary(modelo_log)
summary(modelo_lin)


#--------------------------------------------------
# Exercício 14: 

# dados
set.seed(1)
y_x_poly <- tibble(
  x = runif(30, 0, 20),
  y = 500 + 0.4 * (x-10)^3 + rnorm(30, sd = 50)
)

# Explore a saída de model.matrix() e lm() utlizando as fórmulas:
# a) y ~ x
# b) y ~ x + I(x^2) + I(x^3)
# c) y ~ poly(x, 2, raw = TRUE)
# d) y ~ poly(x, 3, raw = TRUE)

a_mm <- model.matrix(y ~ x, data = y_x_poly)
a_lm <- model.matrix(y ~ x, data = y_x_poly)
summary(a_lm)

b_mm <- 
b_lm <-
summary(b_lm)
  
c_mm <- 
c_lm <-
summary(c_lm)

d_mm <- 
d_lm <-
summary(d_lm)

# Compare o número de parâmetros com o número de colunas. 
# Qual conclusão?









