# Ejercicios del 1 al 12

resolver_ejercicios_1_al_12 <- function() {
  
  # Inicializar una lista para guardar las respuestas de este bloque
  respuestas <- list()
  
  # --- Ejercicio 1: Moneda y dado ---
  opciones_moneda <- c("Cara", "Cruz")
  opciones_dado <- 1:6
  
  S_ej1 <- expand.grid(Moneda = opciones_moneda, Dado = opciones_dado)
  
  cardinalidad <- nrow(S_ej1)
  
  
  
  
  # --- Ejercicio 2: Suma de 3 dados ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 3: Esferas con reemplazo ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 4: Carta de baraja ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 5: Medallas de atletismo ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 6: Analistas de proyecto ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 7: Canicas de colores ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 8: Moneda 4 veces (3 cruces) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 9: Dos dados (suma 7 dado un 4) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 10: Baraja (Espadas dado que es figura) ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 11: Teléfonos sin reemplazo ---
  # TODO: Tu código aquí
  
  # --- Ejercicio 12: Teorema de Bayes (Proveedor C) ---
  # TODO: Tu código aquí
  
  return(respuestas)
}