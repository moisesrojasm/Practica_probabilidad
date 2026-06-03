# Ejercicios del 13 al 18

resolver_ejercicios_1_al_18 <- function() {
  
  # Fijar semilla para que las simulaciones den el mismo resultado siempre
  set.seed(123) 
  
  respuestas <- list()
  
  # Ejercicio 13
  # TODO: Generar simulación de 5000 veces
  # TODO: Construir el Data Frame tbl1.Sim comparando frec relativa vs teórica (1/6)
  respuestas$tbl1.Sim <- data.frame(
    # Reemplaza esto con tus vectores reales
    Evento = c("Corazon", "Pica", "Trebol", "Diamante"),
    Frec_Empirica = c(0, 0, 0, 0),
    Prob_Teorica = rep(1/4, 4) # Nota: Verifica el 1/6 de la instrucción del profe, parece un error tipográfico de él si son palos de baraja (son 4 palos).
  )
  
  # Ejercicio 14
  # TODO: Calcular probabilidad exacta y simular 10,000 exámenes
  # TODO: Construir Data Frame tbl2.Disc (Dominio, dbinom, pbinom)
  respuestas$tbl2.Disc <- data.frame(
    # Rellenar con los cálculos correctos
    x = 0:15,
    Prob_Exacta = rep(0, 16),
    Prob_Acumulada = rep(0, 16)
  )
  
  # Ejercicio 15
  # TODO: Tu código aquí
  
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
  
  
  return(respuestas)
}