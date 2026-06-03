# Ejercicios del 19 al 24

resolver_ejercicios_19_al_24 <- function() {
  
  respuestas <- list()
  
  # Ejercicio 19
  
  # X ~ Normal(mu = 50, sigma = 2) gramos
  # Pregunta A: P(48 <= X <= 52)
  # Pregunta B: Percentil 90
  
  # Parametros del problema
  mu    <- 50    # media en gramos
  sigma <- 2     # desviacion estandar en gramos
  
  # Pregunta A: P(48 <= X <= 52) = F(52) - F(48)
  a <- 48
  b <- 52
  prob_intervalo <- pnorm(q = b, mean = mu, sd = sigma) -
    pnorm(q = a, mean = mu, sd = sigma)
  
  # Pregunta B: Percentil 90 (cuantil inverso)
  percentil_90 <- qnorm(p = 0.90, mean = mu, sd = sigma)
  
  # Guardar las respuestas escalares en la lista
  respuestas$ej19_prob_intervalo <- prob_intervalo
  respuestas$ej19_percentil_90   <- percentil_90
  
  # Data Frame tbl3.Cont: dominio en [mu - 3*sigma, mu + 3*sigma]
  # con la funcion de densidad f(x). 300 puntos para curva suave.
  x_seq <- seq(from = mu - 3 * sigma,
               to   = mu + 3 * sigma,
               length.out = 300)
  fx    <- dnorm(x_seq, mean = mu, sd = sigma)
  
  respuestas$tbl3.Cont <- data.frame(
    incognita   = x_seq,
    densidad_fx = fx
  )
  
  # --- Ejercicio 20: Uniforme Continua (Tiempo de espera servidor) ---
  
  ##límites del intervalo
  minimo20 <- 5
  maximo20 <- 15
  x_tiempo20 <- 12
  
  ## 1. Calculo de la probabilidad (en decimales)
  prob_decimal20 <- punif(q = x_tiempo20, min = minimo20, max = maximo20, lower.tail = FALSE)
  
  ## 2. Convercion a porcentaje
  prob_porcentaje20 <- prob_decimal20 * 100
  
  ##Resultado:
  print(paste0("La probabilidad de que la petición tarde más de 12 ms es de ", prob_decimal20, " o ", prob_porcentaje20, "%"))
  
  # --- Ejercicio 21: Exponencial (Fallas sistema informático) ---
  
  ##parámetros
  lambda21 <- 0.1
  tiempo21 <- 15
  
  ## 1. Calculo la probabilidad
  prob_decimal21 <- pexp(q = tiempo21, rate = lambda21, lower.tail = FALSE)
  
  ## 2. Convercion a porcentaje
  prob_porcentaje21 <- prob_decimal21 * 100
  
  ##Resultados:
  print(paste0("La probabilidad de que el sistema opere más de 15 días sin fallas es de ",round(prob_decimal21, 4), " o ", round(prob_porcentaje21, 2), "%"))
  
  # --- Ejercicio 22: Gamma (Compilar software) ---
  ##Datos que nos da el problema
  alfa22 <- 3
  beta22 <- 2
  tiempo_limite22 <- 5
  
  ## 1. Calculo del término común (x/beta) que es 5/2 = 2.5
  prob_decimal22 <- pgamma(q = tiempo_limite22, shape = alfa22, scale = beta22, lower.tail = TRUE)
  
  ## 2. Convercion a porcentaje
  prob_porcentaje22 <- prob_decimal22 * 100
  
  ## Resultado:
  print(paste0("La probabilidad de que la compilación termine en menos de 5 min es de ",round(prob_decimal22, 4), " o ", round(prob_porcentaje22, 2), "%"))
  
  # --- Ejercicio 23: Weibull (Batería IoT) ---
  ##Datos que nos da el problema
  k23 <- 1.5
  lambda23 <- 500
  tiempo_x23 <- 600
  
  ## 1. Calculo de probabilidad
  prob_decimal23 <- pweibull(tiempo_x23, shape = k23, scale = lambda23, lower.tail = FALSE)
  
  ## 2. Convercion a porcentaje
  prob_porcentaje23 <- prob_decimal23 * 100
  
  ##Resultado:
  print(paste0("La probabilidad de que la batería dure más de 600 horas es de ",round(prob_decimal23, 4), " o ", round(prob_porcentaje23, 2), "%"))
  
  # --- Ejercicio 23 (GRAFICA): ---
  library(ggplot2)
  ##Datos que nos da el problema
  k23g <- 1.5
  lambda23g <- 500
  
  ## 1. Crear el Data Frame con el dominio (eje X) y la densidad (eje Y) (todo esto generando 1000 puntos entre 0-1500)
  datos_weibull <- data.frame(horas = seq(0, 1500, length.out = 1000))
  datos_weibull$densidad <- dweibull(datos_weibull$horas, shape = k23g, scale = lambda23g)
  
  # 2. Se corrige la graficación con ggplot
  grafico_weibull <- ggplot(datos_weibull, aes(x = horas, y = densidad)) + 
    geom_line(color = "darkblue", linewidth = 1) +
    labs(
      title = "Curva de Densidad - Distribución de Weibull (Batería IoT)",
      subtitle = paste0("Parámetros Teóricos: k = ", k23g, ", lambda = ", lambda23g),
      x = "Tiempo de vida útil (Horas)",
      y = "Densidad de Probabilidad"
    ) +
    theme_minimal()
  
  # 3. GUARDAR EL GRÁFICO AUTOMÁTICAMENTE
  ggsave("Resultados/Graficas/graf_ej23_weibull.png", plot = grafico_weibull, width = 8, height = 5)
  
  
  # --- Ejercicio 24: Log-Normal (Tráfico de red) ---
  ## Datos que nos da el problema
  mu24 <- 3
  sigma24 <- 0.5
  trafico_limite24 <- 15
  
  ## 1. usamos el plnorm
  prob_decimal24 <- plnorm(15, meanlog = mu24, sdlog = sigma24, lower.tail = TRUE)
  
  ## 3. Convertir a porcentaje
  prob_porcentaje24 <- prob_decimal24 * 100
  
  ## Mostramos el resultado
  print(paste0("La probabilidad de que el tráfico sea inferior a 15 GB es de ",round(prob_decimal24, 4), " o ", round(prob_porcentaje24, 2), "%"))
  
  
  return(respuestas)
}