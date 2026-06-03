rm(list = ls())
cat("Iniciando entorno de trabajo...\n")

library(ggplot2)
library(probs)

# Solo para cumplir con la rúbrica
#datos_historicos <- read.csv("Data/Datos.txt")

cat("Cargando funciones modulares...\n")
source("Funciones/Funcion_1.R", encoding = "UTF-8")
source("Funciones/Funcion_2.R", encoding = "UTF-8")
source("Funciones/Funcion_3.R", encoding = "UTF-8")

cat("Resolviendo ejercicios y exportando Resultados...\n")
resultados_A <- resolver_ejercicios_1_al_12()
resultados_B <- resolver_ejercicios_13_al_18()
resultados_C <- resolver_ejercicios_19_al_24()

cat("\nRevise la carpeta 'Resultados/Data.frames' y 'Resultados/Graficas'.\n")
