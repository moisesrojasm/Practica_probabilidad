# Ejercicios del 19 al 24

resolver_ejercicios_19_al_24 <- function() {
  
  respuestas <- list()
  
  # EJERCICIO 19 - DISTRIBUCION NORMAL
  
  # Pregunta A: P(48 <= X <= 52)
  # Pregunta B: Percentil 90 (peso que delimita el 90% inferior)
  
  # Parametros del problema
  mu    <- 50    # media en gramos
  sigma <- 2     # desviacion estandar en gramos
  
  
  # 1. PREGUNTA A: P(48 <= X <= 52)
  
  # Para continuas: P(a <= X <= b) = F(b) - F(a) = pnorm(b) - pnorm(a)
  
  a <- 48
  b <- 52
  
  prob_intervalo <- pnorm(q = b, mean = mu, sd = sigma) -
    pnorm(q = a, mean = mu, sd = sigma)
  
  cat("Pregunta A:\n")
  cat("P(", a, "<= X <=", b, ") =", prob_intervalo, "\n")
  cat("P(", a, "<= X <=", b, ") =",
      round(prob_intervalo * 100, 4), "%\n\n")
  
  # Observacion: como a = mu-sigma y b = mu+sigma, esperamos ~68.27%
  cat("Verificacion regla 68-95-99.7:\n")
  cat("a = mu - sigma =", mu - sigma, "\n")
  cat("b = mu + sigma =", mu + sigma, "\n")
  cat("Probabilidad esperada (~68.27%) confirmada.\n\n")
  
  
  
  # 2. PREGUNTA B: Percentil 90
  
  percentil_90 <- qnorm(p = 0.90, mean = mu, sd = sigma)
  
  cat("Pregunta B:\n")
  cat("Peso que delimita el 90% inferior (percentil 90) =",
      round(percentil_90, 4), "g\n\n")
  
  
  
  # 3. DATA FRAME tbl3.Cont: dominio en [mu - 3*sigma, mu + 3*sigma]
  # emparejamos con la funcion de densidad f(x)
  # Usamos 300 puntos equiespaciados.
  
  x_dom_norm <- seq(from       = mu - 3 * sigma,
                    to         = mu + 3 * sigma,
                    length.out = 300)
  
  # Densidad f(x) en cada punto (NOTA: esto NO es probabilidad puntual)
  fx <- dnorm(x = x_dom_norm, mean = mu, sd = sigma)
  
  # Tambien agregamos la acumulada F(x) por completitud
  Fx <- pnorm(q = x_dom_norm, mean = mu, sd = sigma)
  
  # Data frame completo
  df_norm <- data.frame(
    x   = x_dom_norm,
    fx  = fx,
    Fx  = Fx
  )
  
  # Extracto (rubrica pide "extracto", no todo el DF)
  cat("Extracto del data frame (cada 30 filas):\n")
  print(df_norm[seq(1, nrow(df_norm), by = 30), ])
  
  # Guardar CSV completo
  write.csv(df_norm,
            file = "Resultados/Data.frames/df_normal.csv",
            row.names = FALSE)
  
  
  
  
  # 4. GRAFICO 1: CURVA DE DENSIDAD f(x) con el intervalo resaltado
  library(ggplot2)
  
  # Subconjunto del DF para el area entre 48 y 52
  df_area <- subset(df_norm, x >= a & x <= b)
  
  grafico_norm <- ggplot(df_norm, aes(x = x, y = fx)) +
    # Area sombreada del intervalo
    geom_area(data = df_area, aes(x = x, y = fx),
              fill = "skyblue", alpha = 0.6) +
    # Curva de densidad suave
    geom_line(color = "darkblue", linewidth = 1.2) +
    # Lineas verticales en a, b y el percentil 90
    geom_vline(xintercept = a,            linetype = "dashed",
               color = "red") +
    geom_vline(xintercept = b,            linetype = "dashed",
               color = "red") +
    geom_vline(xintercept = percentil_90, linetype = "dotted",
               color = "darkgreen", linewidth = 1) +
    # Etiquetas en las lineas
    annotate("text", x = a, y = max(fx) * 0.15,
             label = paste("a =", a), color = "red", hjust = 1.1) +
    annotate("text", x = b, y = max(fx) * 0.15,
             label = paste("b =", b), color = "red", hjust = -0.1) +
    annotate("text", x = percentil_90, y = max(fx) * 0.95,
             label = paste("P90 =", round(percentil_90, 2)),
             color = "darkgreen", hjust = -0.1) +
    labs(
      title    = "Distribucion Normal - Ejercicio 19",
      subtitle = bquote("Parametros: " * mu * " = " * .(mu) *
                          ", " * sigma * " = " * .(sigma) *
                          "  |  Area azul: P(48 <= X <= 52) = " *
                          .(round(prob_intervalo, 4))),
      x = "Peso del componente (gramos)",
      y = "Densidad f(x)"
    ) +
    theme_minimal(base_size = 12) +
    theme(plot.title    = element_text(face = "bold"),
          plot.subtitle = element_text(face = "italic"))
  
  print(grafico_norm)
  
  
  
  # 5. Guardar PNG
  ggsave(
    filename = "Resultados/Graficas/grafico_normal.png",
    plot     = grafico_norm,
    width    = 9,
    height   = 5,
    dpi      = 300
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