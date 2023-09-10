if (!require(dplyr)) install.packages("dplyr")
if (!require(readxl)) install.packages("readxl")
library(dplyr) # Baixar pacotes caso não estejam já baixados préviamente
library(readxl)
setwd("C:\\Users\\4na4Sun\\3D Objects\\ETlcomR\\")
base_vitamina <- read_excel("Base_vitamina_D.xlsx")
View(base_vitamina)

# Renomeando as colunas para Português, ja que a base está em espanhol.

base_vitamina_clean <-  rename(base_vitamina,Nome_participante = 'iniciales del nombre y apellido del participante')
View(base_vitamina_clean)