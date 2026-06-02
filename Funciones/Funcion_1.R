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
  caja_esferas <- c(rep("Negra", 4), rep("Blanca", 3), rep("Roja", 2))
  
  S_ej3 <- expand.grid(Extrac_1 = caja_esferas, Extrac_2 = caja_esferas, Extrac_3 = caja_esferas)
  
  cardinalidad_ej3 <- nrow(S_ej3)
  
  respuestas$ejercicio_3 <- list(
    Espacio_Muestral = S_ej3,
    Total_Puntos_Muestrales = cardinalidad_ej3
  )
  
  # Ejercicio 4
  palos <- c("Corazones", "Diamantes", "Treboles", "Picas")
  valores <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
  
  S_ej4 <- expand.grid(Valor = valores, Palo = palos)
  
  cardinalidad_ej4 <- nrow(S_ej4) 
  
  evento_D <- subset(S_ej4, Valor %in% c("J", "Q", "K"))
  casos_favorables_ej4 <- nrow(evento_D)
  
  prob_ej4 <- casos_favorables_ej4 / cardinalidad_ej4
  
  respuestas$ejercicio_4 <- list(
    Espacio_Muestral = S_ej4,
    Casos_Favorables = casos_favorables_ej4,
    Probabilidad = prob_ej4
  )
  
  # Ejercicio 5
  # Número de corredores
  n <- 8
  
  # Número de medallas
  r <- 3
  
  # Permutaciones sin repetición
  respuestas$ejercicio5 <- factorial(n) / factorial(n - r)
  
  # Ejercicio 6
  # Número de candidatos
  n <- 12
  
  # Número de analistas requeridos
  r <- 5
  
  # Combinaciones
  respuestas$ejercicio6 <- factorial(n) / (factorial(r) * factorial(n - r))
  
  # Ejercicio 7
  # Canicas
  azules <- 6
  amarillas <- 4
  verdes <- 5
  
  # Total de canicas
  total <- azules + amarillas + verdes
  
  # Canicas que no son verdes
  favorables <- azules + amarillas
  
  # Probabilidad
  respuestas$ejercicio7 <- favorables / total
  
  # Ejercicio 8
  # Casos favorables: elegir 3 cruces de 4 lanzamientos
  favorables <- choose(4, 3)
  
  # Casos posibles
  posibles <- 2^4
  
  # Probabilidad
  respuestas$ejercicio8 <- favorables / posibles
  
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