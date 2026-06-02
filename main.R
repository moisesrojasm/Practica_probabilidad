rm(list = ls())
cat("Iniciando entorno de trabajo...\n")

if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

datos_historicos <- read.csv("Data/Datos.txt")

cat("Cargando funciones modulares...\n")
source("Funciones/Función_1.R")
source("Funciones/Función_2.R")
source("Funciones/Función_3.R")

cat("Resolviendo ejercicios...\n")
resultados_A <- resolver_ejercicios_1_al_12()
resultados_B <- resolver_ejercicios_13_al_18()
resultados_C <- resolver_ejercicios_19_al_24()

# Exportacion de Data Frames
cat("Exportando Data Frames a la carpeta Resultados...\n")
# Extraccion de las tablas generadas en los scripts y se guardan como CSV
write.csv(resultados_B$tbl1.Sim, "Resultados/Data.frames/tbl1_Sim.csv", row.names = FALSE)
write.csv(resultados_B$tbl2.Disc, "Resultados/Data.frames/tbl2_Disc.csv", row.names = FALSE)
write.csv(resultados_C$tbl3.Cont, "Resultados/Data.frames/tbl3_Cont.csv", row.names = FALSE)

# Gráficos con ggplot2
cat("Generando gráficos solicitados...\n")

cat("\n¡Ejecución exitosa! Revisa la carpeta 'Resultados'.\n")