# Ejercicios del 1 al 12

resolver_ejercicios_1_al_12 <- function() {
  
  respuestas <- list()
  
  # Ejercicio 1
  opciones_moneda <- c("Cara", "Cruz")
  opciones_dado <- 1:6
  
  S_ej1 <- expand.grid(opciones_moneda, opciones_dado)
  
  cardinalidad_ej1 <- nrow(S_ej1)
  
  evento_ej1 <- subset(S_ej1, opciones_moneda == "Cara", opciones_dado = c(2,4,6))
  
  casos_favorables_ej1 <- nrow(evento_ej1)
  
  prob_ej1 <- casos_favorables_ej1 / cardinalidad_ej1
  
  respuestas$ej1 <- list(
    Espacio_Muestral = S_ej1,
    Probabilidad = prob_ej1
  )
  
  # Ejercicio 2
  caras_dado <- 1:6
  S_ej2 <- expand.grid(Dado1 = caras_dado, Dado2 = caras_dado, Dado3 = caras_dado)
  
  # Suma de los 3 dados para cada escenario del S
  S_ej2$Suma_Total <- rowSums(S_ej2)
  
  cardinalidad_ej2 <- nrow(S_ej2)
  
  evento_ej2 <- subset(S_ej2, Suma_Total == 10)
  casos_favorables_ej2 <- nrow(evento_ej2)
  prob_ej2 <- casos_favorables_ej2 / cardinalidad_ej2
  
  respuestas$ej2 <- list(
    Espacio_Muestral = S_ej2,
    Casos_Favorables = casos_favorables_ej2,
    Probabilidad = prob_ej2
  )
  
  # Ejercicio 3
  # Tu código aquí
  
  # Ejercicio 4
  # Tu código aquí
  
  # Ejercicio 5
  # Tu código aquí
  
  # Ejercicio 6
  # Tu código aquí
  
  # Ejercicio 7
  # Tu código aquí
  
  # Ejercicio 8
  # Tu código aquí
  
  # Ejercicio 9
  # Tu código aquí
  
  # Ejercicio 10
  # Tu código aquí
  
  # Ejercicio 11
  # Tu código aquí
  
  # Ejercicio 12
  # Tu código aquí
  
  return(respuestas)
}