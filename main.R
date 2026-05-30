# ==============================================================================
# PROYECTO FINAL: PROBABILIDAD Y ESTADÍSTICA
# Archivo Principal de Integración (main.R)
# ==============================================================================

# 1. Preparación del Entorno
rm(list = ls()) # Limpia variables previas
cat("Iniciando entorno de trabajo...\n")

# Cargar librerías necesarias
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Cargar el dataset de prueba (Solo para cumplir con la estructura de la práctica)
datos_historicos <- read.csv("Data/Datos.txt")

# 2. Carga de Módulos (Scripts de los analistas)
cat("Cargando funciones modulares...\n")
source("Funciones/Función_1.R")
source("Funciones/Función_2.R")
source("Funciones/Función_3.R")

# 3. Ejecución de Cálculos
cat("Resolviendo ejercicios...\n")
resultados_A <- resolver_ejercicios_1_al_12()
resultados_B <- resolver_ejercicios_13_al_18()
resultados_C <- resolver_ejercicios_19_al_24()

# 4. Exportación de Data Frames Obligatorios
cat("Exportando Data Frames a la carpeta Resultados...\n")
# Se extraen las tablas generadas en los scripts y se guardan como CSV
write.csv(resultados_B$tbl1.Sim, "Resultados/Data.frames/tbl1_Sim.csv", row.names = FALSE)
write.csv(resultados_B$tbl2.Disc, "Resultados/Data.frames/tbl2_Disc.csv", row.names = FALSE)
write.csv(resultados_C$tbl3.Cont, "Resultados/Data.frames/tbl3_Cont.csv", row.names = FALSE)

# 5. Generación de Gráficos con ggplot2 (Espacio para el Analista 4)
cat("Generando gráficos solicitados...\n")

# --- EJEMPLO DE ESTRUCTURA PARA EL EXPERTO EN GGPLOT2 ---
# (El código real del gráfico de Poisson irá aquí o en un script separado)
# grafico_poisson <- ggplot(...) + geom_col(...)
# ggsave("Resultados/Graficas/01_Poisson_Mas_de_7.png", plot = grafico_poisson)

# (El código para la ojiva Binomial irá aquí)
# ggsave("Resultados/Graficas/02_Ojiva_Binomial.png", plot = grafico_ojiva)

# (El código para densidad Normal y Weibull irá aquí)
# ggsave("Resultados/Graficas/03_Densidad_Normal.png", plot = grafico_normal)
# ggsave("Resultados/Graficas/04_Densidad_Weibull.png", plot = grafico_weibull)

cat("\n¡Ejecución exitosa! Revisa la carpeta 'Resultados'.\n")