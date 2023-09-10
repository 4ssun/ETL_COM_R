if (!require(dplyr)) install.packages("dplyr")
if (!require(readxl)) install.packages("readxl")
if (!require(tidyr)) install.packages("tidyr")
library(dplyr) # Baixar pacotes caso não estejam já baixados préviamente
library(readxl)
library(tidyr)
setwd("C:\\Users\\4na4Sun\\3D Objects\\ETlcomR\\")
base_vitamina <- read_excel("Base_vitamina_D.xlsx")


# Renomeando as colunas para Português, ja que a base está em espanhol. Todas as colunas que possuírem no final do nome B: Atrela um valor qualitativo e os que possuem Cod: Atrela um valor quantitativo. Afim de facilitar a interpretação desses dados pela associação numérica e qualificativa para leitura dos resultados.

base_vitamina_clean <- rename(base_vitamina,
    Nome_participante = "Iniciales del nombre y apellido del participante",
    Idade = "Edad(en años cumplidos)", ,
    Faixa_etaria = "Edad_Rango",
    Municipio_de_residencia = "Municipio de nacimiento",
    Nivel_Socioeconomico_cod = "Estrato socioeconómico",
    Nivel_Socioeconomico_B = "Estrato_B",
    Atividades_baixa_exposicao = "Oficio u ocupación relacionado con baja o normal exposición al sol", # nolint: line_length_linter.
    Atividades_alta_exposicao = "Oficio u ocupación relacionado con alta exposición al sol", # nolint: line_length_linter.
    Grupo_de_estudo = "Grupo de estudio",
    Nivel_serico = "Valor sérico VD",
    Valor_serico_B = "Valor_Sérico_B",
    Valor_Vitamina_D_ng_ml = "Valor V D ng/mL",
    Ingestao_vitD = "Ingesta VD_(UI)",
    IMC = "IMC_(Kg/m2)",
    Classificacao_IMC = "Clasificación _IMC",
    Uso_protetor_solar_B = "Uso_protector_dia",
    Uso_protetor_solar_cod = "Uso_protector_dia2",
    Fator_UV_protetor_solar = "Nivel de protección del protector solar",
    Fator_UV_protetor_solar_cod = "Nivel de protección del protector solar2",
    Cores_da_roupa = "Color_ropa",
    Cores_da_roupa_cod = "Color_ropa2",
    Extremidades_exposta = "Exposición de extremidades al sol",
    Extremidades_exposta_cod = "Expo_extremidades_sol2",
    Tempo_de_exposicao = "Tiempo de exposición del sol en el día",
    Tempo_de_exposicao_2 = "Tiempo de exposición del sol en el día2",
    Enfermidades = "Enfermedad de base",
    Tratamento_de_enfermidade = "Tratamiento que recibe"
)

base_vitamina_clean <- select(base_vitamina_clean, -c(31:34, 37:45)) # limpando colunas que não serão úteis para minha pesquisa.

sapply(base_vitamina_clean, function(x) sum(is.na(x)))
sapply(base_vitamina_clean, function(x) sum(is.nan(x)))
base_vitamina_mutate <- replace(x = base_vitamina_clean, list = is.na(base_vitamina_clean), values = 0)
