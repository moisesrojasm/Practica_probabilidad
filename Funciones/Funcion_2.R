# Ejercicios del 13 al 18

resolver_ejercicios_13_al_18 <- function() {
  
  set.seed(123) 
  
  respuestas <- list()
  
  # Ejercicio 13
  
  # Simulación de 5 000 extracciones de un mazo de 52 cartas
  # (con reemplazo). Probabilidad empírica de obtener Corazones.
  
  palos  <- c("Corazones", "Diamantes", "Picas", "Treboles")
  n_sim  <- 5000
  
  muestra_palos <- sample(palos, size = n_sim, replace = TRUE)
  
  # ── tbl1.Sim
  freq <- table(muestra_palos)
  
  tbl1.Sim <- data.frame(
    Palo          = names(freq),
    Frecuencia    = as.numeric(freq),
    Frec_Relativa = as.numeric(freq) / n_sim,
    Prob_Teorica  = 1 / 4            # P(palo) = 13/52 = 0.25
  )
  
  cat("\n")
  cat(" tbl1.Sim | Ejercicio 13\n")
  cat("\n")
  print(tbl1.Sim)
  
  p_corazones_emp <- tbl1.Sim$Frec_Relativa[tbl1.Sim$Palo == "Corazones"]
  cat(sprintf("\nP(Corazones) empírica = %.4f\n", p_corazones_emp))
  cat(sprintf("P(Corazones) teórica  = %.4f\n\n", 1 / 4))
  
  # Gráfica 13: barras de frecuencia relativa por palo 
  graf_ej13 <- ggplot(tbl1.Sim, aes(x = Palo, y = Frec_Relativa, fill = Palo)) +
    geom_col(color = "black", width = 0.6) +
    geom_hline(yintercept = 0.25, color = "red",
               linewidth = 1, linetype = "dashed") +
    annotate("text", x = 0.6, y = 0.265,
             label = "Prob. teórica = 0.25",
             color = "red", size = 3.5, hjust = 0) +
    scale_fill_brewer(palette = "Set2") +
    scale_y_continuous(limits = c(0, 0.32)) +
    labs(
      title    = "Ejercicio 13 — Frecuencia Relativa por Palo (n = 5 000)",
      subtitle = "Distribución uniforme discreta · Extracción con reemplazo",
      x        = "Palo",
      y        = "Frecuencia Relativa",
      fill     = "Palo"
    ) +
    theme_minimal(base_size = 13) +
    theme(legend.position = "top")
  
  print(graf_ej13)
  
  write.csv(tbl1.Sim, "Resultados/Data.frames/tbl1.Sim.csv", row.names = FALSE)
  ggsave("Resultados/Graficas/graf_ej13.png", plot = graf_ej13, width = 7, height = 5)
  
  # Ejercicio 14
  
  # Test de 15 preguntas, 4 opciones por pregunta (p = 1/4).
  # P(acertar exactamente 5). Simulación de 10 000 exámenes.
  
  n14 <- 15
  p14 <- 1 / 4
  
  prob_binom_5 <- dbinom(5, size = n14, prob = p14)
  
  cat("\n")
  cat(" Ejercicio 14 | Distribución Binomial\n")
  cat("\n")
  cat(sprintf("P(X = 5) exacta    = %.6f\n", prob_binom_5))
  
  # Simulación 10 000 exámenes
  sim_examenes <- rbinom(10000, size = n14, prob = p14)
  prob_emp_14  <- mean(sim_examenes == 5)
  cat(sprintf("P(X = 5) empírica  = %.6f  (10 000 simulaciones)\n\n", prob_emp_14))
  
  # tbl2.Disc: dominio completo X = 0 … 15
  x_binom <- 0:n14
  
  tbl2.Disc <- data.frame(
    x           = x_binom,
    P_exacta    = round(dbinom(x_binom, size = n14, prob = p14), 6),
    P_acumulada = round(pbinom(x_binom, size = n14, prob = p14), 6)
  )
  
  cat("\n")
  cat(" tbl2.Disc | Binomial(n = 15, p = 0.25)\n")
  cat("\n")
  print(tbl2.Disc)
  
  # Gráfica 14a: función de masa (barras)
  graf_ej14_masa <- ggplot(tbl2.Disc, aes(x = x, y = P_exacta,
                                          fill = (x == 5))) +
    geom_col(color = "black", width = 0.7) +
    scale_fill_manual(values  = c("TRUE"  = "#E74C3C",
                                  "FALSE" = "steelblue"),
                      labels  = c("TRUE"  = "X = 5",
                                  "FALSE" = "Otros"),
                      name    = "") +
    scale_x_continuous(breaks = 0:n14) +
    labs(
      title    = "Ejercicio 14 — Función de Masa Binomial",
      subtitle = "n = 15, p = 0.25  |  Rojo: P(X = 5)",
      x        = "Número de aciertos (X)",
      y        = "P(X = x)"
    ) +
    theme_minimal(base_size = 13) +
    theme(legend.position = "top")
  
  print(graf_ej14_masa)
  
  # Gráfica 14b: ojiva acumulada
  graf_ej14_ojiva <- ggplot(tbl2.Disc, aes(x = x, y = P_acumulada)) +
    geom_step(color = "steelblue", linewidth = 1.2) +
    geom_point(color = "steelblue", size = 2.5) +
    scale_x_continuous(breaks = 0:n14) +
    scale_y_continuous(limits = c(0, 1)) +
    labs(
      title    = "Ejercicio 14 — Ojiva de Probabilidad Acumulada | Binomial",
      subtitle = "n = 15, p = 0.25",
      x        = "Número de aciertos (X)",
      y        = "P(X \u2264 x)"
    ) +
    theme_minimal(base_size = 13)
  
  print(graf_ej14_ojiva)
  
  write.csv(tbl2.Disc, "Resultados/Data.frames/tbl2.Disc.csv", row.names = FALSE)
  ggsave("Resultados/Graficas/graf_ej14_masa.png", plot = graf_ej14_masa, width = 7, height = 5)
  ggsave("Resultados/Graficas/graf_ej14_ojiva.png", plot = graf_ej14_ojiva, width = 7, height = 5)
  
  # Ejercicio 15
  
  # Servidor web: λ = 12 solicitudes/segundo.
  # P(exactamente 10 solicitudes). Simulación de 5 000 segundos.
  
  lambda15 <- 12
  
  prob_pois_10 <- dpois(10, lambda = lambda15)
  
  cat("\n")
  cat(" Ejercicio 15 | Distribución de Poisson\n")
  cat("\n")
  cat(sprintf("P(X = 10) exacta    = %.6f\n", prob_pois_10))
  
  # Simulación 5 000 escenarios
  sim_pois    <- rpois(5000, lambda = lambda15)
  prob_emp_15 <- mean(sim_pois == 10)
  cat(sprintf("P(X = 10) empírica  = %.6f  (5 000 simulaciones)\n", prob_emp_15))
  
  # Probabilidad P(X > 7)
  p_mayor7 <- ppois(7, lambda = lambda15, lower.tail = FALSE)
  cat(sprintf("P(X > 7)  exacta    = %.6f\n\n", p_mayor7))
  
  # Data Frame para la gráfica (dominio 0 – 25)
  x_pois     <- 0:25
  
  df_poisson <- data.frame(
    x      = x_pois,
    prob   = dpois(x_pois, lambda = lambda15),
    region = ifelse(x_pois > 7, "P(X > 7)", "P(X \u2264 7)")
  )
  
  # Gráfica 15: gráfico de masas con región resaltada
  graf_ej15 <- ggplot(df_poisson, aes(x = x, y = prob, fill = region)) +
    geom_col(color = "black", width = 0.7) +
    scale_fill_manual(
      values = c("P(X > 7)"  = "#E74C3C",
                 "P(X \u2264 7)" = "#3498DB"),
      name   = "Región"
    ) +
    scale_x_continuous(breaks = seq(0, 25, 2)) +
    labs(
      title    = "Ejercicio 15 — Función de Masa de Poisson",
      subtitle = paste0("\u03bb = ", lambda15,
                        " solicitudes/seg  |  Rojo: P(X > 7) = ",
                        round(p_mayor7, 4)),
      x        = "Número de solicitudes (X)",
      y        = "P(X = x)"
    ) +
    theme_minimal(base_size = 13) +
    theme(legend.position = "top")
  
  print(graf_ej15)
  
  write.csv(df_poisson, "Resultados/Data.frames/tbl_poisson.csv", row.names = FALSE)
  ggsave("Resultados/Graficas/graf_ej15.png", plot = graf_ej15, width = 7, height = 5)
  
  # Ejercicio 16
  
  # Un lote de 40 componentes electronicos contiene 8 defectuosos.
  # Se extraen 6 al azar sin reemplazo.
  # Pregunta: P(exactamente 1 defectuoso en la muestra)
  
  # Parametros del problema
  N <- 40   # Tamaño total del lote
  K <- 8    # Defectuosos en el lote (exitos en la poblacion)
  n <- 6    # Tamaño de la muestra
  x <- 1    # Numero de defectuosos que nos interesa
  
  # Calculo de P(X = 1) usando dhyper
  # Notacion R: dhyper(x, m, n, k)
  #   m = exitos en poblacion = K = 8
  #   n = fracasos en poblacion = N - K = 32
  #   k = tamaño de muestra = n = 6
  prob_exacta <- dhyper(x = 1, m = K, n = N - K, k = n)
  
  # Mostrar el resultado en consola
  cat("P(X = 1) =", prob_exacta, "\n")
  cat("P(X = 1) =", round(prob_exacta * 100, 4), "%\n")
  
  
  
  # 2. DATA FRAME: dominio completo de X
  
  
  # Dominio de X: del 0 al 6 (no podemos sacar mas de 6 defectuosos
  # si la muestra es de 6, ni mas de los 8 que hay en el lote)
  x_dom <- 0:6
  
  # Probabilidad puntual P(X = x) para cada valor del dominio
  # Aprovechando vectorizacion: dhyper acepta un vector y devuelve otro
  p_masa <- dhyper(x = x_dom, m = K, n = N - K, k = n)
  
  # Probabilidad acumulada P(X <= x)
  # Dos formas equivalentes; usamos phyper directamente (mas precisa)
  p_acum <- phyper(q = x_dom, m = K, n = N - K, k = n)
  
  # Armar el data frame
  df_hyper <- data.frame(
    x          = x_dom,
    P_X_igual  = p_masa,
    P_X_menor  = p_acum
  )
  
  # Mostrar el data frame en consola
  print(df_hyper)
  
  # Verificacion: la suma de probabilidades debe ser 1
  cat("\nSuma de P(X=x):", sum(df_hyper$P_X_igual), "\n")
  
  # Guardar el data frame como CSV en la carpeta Resultados
  write.csv(df_hyper,
            file = "Resultados/Data.frames/df_hipergeometrica.csv",
            row.names = FALSE)
  
  
  
  # 3. GRAFICO DE MASA DE PROBABILIDAD (ggplot2)
  
  # Cargar la libreria
  library(ggplot2)
  
  # Construir el grafico de barras
  grafico_hyper <- ggplot(df_hyper, aes(x = factor(x), y = P_X_igual)) +
    geom_col(fill = "steelblue", color = "black", width = 0.7) +
    geom_text(aes(label = round(P_X_igual, 4)),
              vjust = -0.5, size = 3.5) +
    labs(
      title    = "Distribucion Hipergeometrica - Ejercicio 16",
      subtitle = paste0("Parametros: N = ", N, ", K = ", K, ", n = ", n),
      x = "Numero de defectuosos en la muestra (x)",
      y = "P(X = x)"
    ) +
    theme_minimal(base_size = 12) +
    theme(plot.title    = element_text(face = "bold"),
          plot.subtitle = element_text(face = "italic"))
  
  
  
  # Mostrar el grafico
  print(grafico_hyper)
  
  
  # Guardar el grafico como PNG
  ggsave(
    filename = "Resultados/Graficas/grafico_hipergeometrica.png",
    plot     = grafico_hyper,
    width    = 8,
    height   = 5,
    dpi      = 300
  )
  
  # Ejercicio 17
  
  # Un jugador de baloncesto tiene 75% de probabilidad de encestar
  # un tiro libre. Pregunta: P(fallar exactamente 2 tiros antes
  # de encestar el primero).
  
  # X = numero de fallos antes del primer exito (version R)
  # p = 0.75 (probabilidad de exito = encestar)
  # Queremos P(X = 2)
  
  
  # Parametros del problema
  p_exito <- 0.75   # probabilidad de encestar
  x_obj   <- 2      # numero de fallos que nos interesa
  
  # --- Calculo de P(X = 2) ---
  prob_exacta_geom <- dgeom(x = x_obj, prob = p_exito)
  
  # Mostrar el resultado
  cat("P(X = 2) =", prob_exacta_geom, "\n")
  cat("P(X = 2) =", round(prob_exacta_geom * 100, 4), "%\n")
  
  # Verificacion manual con la formula
  verificacion <- (1 - p_exito)^x_obj * p_exito
  cat("Verificacion manual: (1-p)^x * p =", verificacion, "\n")
  
  
  
  # DATA FRAME: dominio (truncado) de X
  # El soporte teorico de la Geometrica es {0, 1, 2, ...} infinito.
  # Truncamos hasta x = 10, pues mas alla la probabilidad es ~0.
  
  x_dom_geom <- 0:10
  
  # Probabilidad puntual P(X = x) para cada valor
  p_masa_geom <- dgeom(x = x_dom_geom, prob = p_exito)
  
  # Probabilidad acumulada P(X <= x)
  p_acum_geom <- pgeom(q = x_dom_geom, prob = p_exito)
  
  # Armar el data frame
  df_geom <- data.frame(
    x          = x_dom_geom,
    P_X_igual  = p_masa_geom,
    P_X_menor  = p_acum_geom
  )
  
  # Mostrar el data frame
  print(df_geom)
  
  # Suma de probabilidades (debe acercarse a 1, no llega exacto)
  # porque truncamos la cola infinita)
  cat("\nSuma P(X=x) hasta x=10:", sum(df_geom$P_X_igual), "\n")
  cat("Esto deberia ser aprox 1, porque truncamos la cola.\n")
  
  # Guardar el data frame como CSV
  write.csv(df_geom,
            file = "Resultados/Data.frames/df_geometrica.csv",
            row.names = FALSE)
  
  
  
  # GRAFICO DE MASA DE PROBABILIDAD (ggplot2)
  library(ggplot2)
  
  grafico_geom <- ggplot(df_geom, aes(x = factor(x), y = P_X_igual)) +
    geom_col(fill = "darkorange", color = "black", width = 0.7) +
    geom_text(aes(label = round(P_X_igual, 4)),
              vjust = -0.5, size = 3) +
    labs(
      title    = "Distribucion Geometrica - Ejercicio 17",
      subtitle = paste0("Parametro: p = ", p_exito,
                        " (probabilidad de exito)"),
      x = "Numero de fallos antes del primer exito (x)",
      y = "P(X = x)"
    ) +
    theme_minimal(base_size = 12) +
    theme(plot.title    = element_text(face = "bold"),
          plot.subtitle = element_text(face = "italic"))
  
  print(grafico_geom)
  
  # Guardar el grafico como PNG
  ggsave(
    filename = "Resultados/Graficas/grafico_geometrica.png",
    plot     = grafico_geom,
    width    = 8,
    height   = 5,
    dpi      = 300
  )
  
  # Ejercicio 18
  
  # Un inspector revisa productos. P(defectuoso) = 0.10.
  # Pregunta: P(revisar exactamente 15 productos para encontrar
  # el tercer producto defectuoso).
  
  # Cada "defectuoso" cuenta como exito (es lo que buscamos).
  # - r = 3 (exitos buscados)
  # - p = 0.10 (probabilidad de exito por intento)
  # - Total de intentos = 15
  # - Fallos (los que R llama 'x') = 15 - 3 = 12
  
  
  # 1. Parametros del problema
  r_exitos    <- 3      # numero de exitos buscados (defectuosos)
  p_exito     <- 0.10   # probabilidad de exito (defectuoso) en cada intento
  total_int   <- 15     # total de intentos (lo que dice el enunciado)
  x_obj       <- total_int - r_exitos   # fallos = 12 (lo que R espera)
  
  # Calculo de P(X = 12)
  prob_exacta_nb <- dnbinom(x = x_obj, size = r_exitos, prob = p_exito)
  
  # Mostrar
  cat("Numero de fallos antes del 3er exito: x =", x_obj, "\n")
  cat("P(X = 12) =", prob_exacta_nb, "\n")
  cat("P(X = 12) =", round(prob_exacta_nb * 100, 4), "%\n")
  
  # Verificacion manual con la formula
  verificacion_nb <- choose(x_obj + r_exitos - 1, x_obj) *
    (1 - p_exito)^x_obj *
    p_exito^r_exitos
  cat("Verificacion manual: C(14,12)*(0.9)^12*(0.1)^3 =",
      verificacion_nb, "\n")
  
  
  
  # 2. DATA FRAME: dominio truncado de X
  
  # La Binomial Negativa tambien tiene soporte infinito: {0, 1, 2, ...}
  # Truncamos en x = 50 porque mas alla la probabilidad es ~0.
  # (con p=0.1 y r=3 la media es r*(1-p)/p = 27 fallos, asi que 50 es suficiente)
  
  x_dom_nb <- 0:50
  
  # Probabilidad puntual y acumulada (vectorizado)
  p_masa_nb <- dnbinom(x = x_dom_nb, size = r_exitos, prob = p_exito)
  p_acum_nb <- pnbinom(q = x_dom_nb, size = r_exitos, prob = p_exito)
  
  # Data frame
  df_nb <- data.frame(
    x          = x_dom_nb,
    P_X_igual  = p_masa_nb,
    P_X_menor  = p_acum_nb
  )
  
  # Mostrar primeras y ultimas filas (es muy largo para imprimir todo)
  cat("\nPrimeras 6 filas del data frame:\n")
  print(head(df_nb))
  cat("\nUltimas 6 filas:\n")
  print(tail(df_nb))
  
  # Suma de probabilidades (cercana a 1)
  cat("\nSuma P(X=x) hasta x=50:", sum(df_nb$P_X_igual), "\n")
  
  # Guardar CSV
  write.csv(df_nb,
            file = "Resultados/Data.frames/df_binomial_negativa.csv",
            row.names = FALSE)
  
  
  
  # 3. GRAFICO DE MASA DE PROBABILIDAD (ggplot2)
  
  library(ggplot2)
  
  grafico_nb <- ggplot(df_nb, aes(x = x, y = P_X_igual)) +
    geom_col(fill = "seagreen", color = "black", width = 0.7) +
    # Resaltamos la barra de x = 12 (la del problema) en otro color
    geom_col(data = subset(df_nb, x == x_obj),
             aes(x = x, y = P_X_igual),
             fill = "firebrick", color = "black", width = 0.7) +
    labs(
      title    = "Distribucion Binomial Negativa - Ejercicio 18",
      subtitle = paste0("Parametros: r = ", r_exitos,
                        ", p = ", p_exito,
                        " | Barra roja: x = ", x_obj,
                        " (15 intentos totales)"),
      x = "Numero de fallos antes del r-esimo exito (x)",
      y = "P(X = x)"
    ) +
    theme_minimal(base_size = 12) +
    theme(plot.title    = element_text(face = "bold"),
          plot.subtitle = element_text(face = "italic"))
  
  print(grafico_nb)
  
  # 4. Guardar PNG
  ggsave(
    filename = "Resultados/Graficas/grafico_binomial_negativa.png",
    plot     = grafico_nb,
    width    = 9,
    height   = 5,
    dpi      = 300
  )
  
  # Corrección
  respuestas$tbl1.Sim <- tbl1.Sim
  respuestas$tbl2.Disc <- tbl2.Disc
  
  return(respuestas)
}