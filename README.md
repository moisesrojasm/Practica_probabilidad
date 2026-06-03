# Modelado Estocástico y Análisis de Distribuciones

## 📖 Descripción del Proyecto

Este repositorio contiene el código fuente, los datos y los resultados de nuestra práctica final de la materia de Probabilidad. El proyecto aborda la resolución algorítmica de 24 ejercicios probabilísticos, abarcando desde espacios muestrales clásicos y el Teorema de Bayes, hasta el modelado de variables aleatorias mediante distribuciones discretas y continuas. 

Todo el sistema está diseñado para cumplir con los tres rubros principales de evaluación académica: **precisión matemática computacional** utilizando R base, **visualización científica dinámica** con `ggplot2`, y la generación de evidencias exportables para nuestro reporte final estructurado bajo la filosofía **IMRAD**.

---

## Características Principales

* **Arquitectura Modular:** El código está dividido en scripts independientes (`Funcion_1.R`, `Funcion_2.R`, etc.) orquestados por un controlador maestro, lo que evita la saturación del entorno global de R.
* **Reproducibilidad Rigurosa:** Implementación de semillas pseudoaleatorias (`set.seed()`) para garantizar que las simulaciones de probabilidad empírica arrojen exactamente los mismos resultados asintóticos en cualquier computadora.
* **Visualización Avanzada:** Renderizado automatizado de funciones de masa de probabilidad (fmp), ojivas acumuladas y curvas de densidad poblacional resaltando áreas de interés.
* **Automatización de Salidas:** El script exporta automáticamente todos los Data Frames requeridos (`.csv`) y los gráficos (`.png`) a directorios específicos sin requerir intervención manual ni imprimir "basura" en la consola.

---

## Estructura del Proyecto

El repositorio está organizado de manera estricta mediante rutas relativas para garantizar el orden de los resultados y el trabajo colaborativo sin conflictos:

```plaintext
Practica_probabilidad/
├── Proyecto_Final.Rproj
├── main.R
├── Data/
│   └── Datos.txt
├── Funciones/
│   ├── Funcion_1.R
│   ├── Funcion_2.R
│   └── Funcion_3.R
└── Resultados/
    ├── Data.frames/
    └── Graficas/