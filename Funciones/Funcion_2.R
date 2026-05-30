# ==============================================================================
# ANALISTA B: Probabilidad Empírica y Distribuciones Discretas
# Ejercicios del 13 al 18
# ==============================================================================

resolver_ejercicios_1_al_18 <- function() {
  
  # Fijar semilla para que las simulaciones den el mismo resultado siempre
  set.seed(123) 
  
  respuestas <- list()
  
  # --- Ejercicio 13: Uniforme Discreta Empírica (Cartas) ---
  # TODO: Generar simulación de 5000 veces
  # TODO: Construir el Data Frame tbl1.Sim comparando frec relativa vs teórica (1/6)
  respuestas$tbl1.Sim <- data.frame(
    # Reemplaza esto con tus vectores reales
    Evento = c("Corazon", "Pica", "Trebol", "Diamante"),
    Frec_Empirica = c(0, 0, 0, 0),
    Prob_Teorica = rep(1/4, 4) # Nota: Verifica el 1/6 de la instrucción del profe, parece un error tipográfico de él si son palos de baraja (son 4 palos).
  )
  
  # --- Ejercicio 14: Binomial (Test opción múltiple) ---
  # TODO: Calcular probabilidad exacta y simular 10,000 exámenes
  # TODO: Construir Data Frame tbl2.Disc (Dominio, dbinom, pbinom)
  respuestas$tbl2.Disc <- data.frame(
    # Rellenar con los cálculos correctos
    x = 0:15,
    Prob_Exacta = rep(0, 16),
    Prob_Acumulada = rep(0, 16)
  )
  
  # --- Ejercicio 15: Poisson (Servidor web) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 16: Hipergeométrica (Componentes electrónicos) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 17: Geométrica (Tiro libre) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 18: Binomial Negativa (Inspector de calidad) ---
  # TODO: Tu código aquí
  
  
  return(respuestas)
}