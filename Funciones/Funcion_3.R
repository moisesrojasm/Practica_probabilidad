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
  # TODO: Tu código aquí
  
  # --- Ejercicio 21: Exponencial (Fallas sistema informático) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 22: Gamma (Compilar software) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 23: Weibull (Batería IoT) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 24: Log-Normal (Tráfico de red) ---
  # TODO: Tu código aquí
  
  
  return(respuestas)
}