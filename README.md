# Proyecto Final de Probabilidad

Este repositorio contiene el código fuente, los datos y los resultados de nuestra práctica final de la materia de Probabilidad. El proyecto está diseñado para cumplir con los tres rubros principales de evaluación: precisión matemática utilizando `R`, visualización científica dinámica con `ggplot2` y la generación de evidencias para nuestro reporte académico bajo la filosofía IMRAD.

```plaintext
Practica_probabilidad/
├── Data/
│   └── Datos.txt
├── Funciones/
│   ├── Función_1.R
│   ├── Función_2.R
│   └── Función_3.R
├── Resultados/
│   ├── Data.frames/
│   └── Graficas/
└── main.R
```

---

## Estructura del Directorio

El proyecto está organizado de manera estricta para garantizar la reproducibilidad y el orden de los resultados:

* **Data/**: Almacena un archivo base `Datos.txt`. No es requerido para la inicialización del sistema.
* **Funciones/**: Contiene los scripts analíticos (`Función_1.R`, `Función_2.R`, `Función_3.R`) con la resolución en código puro de los 24 ejercicios planteados.
* **Resultados/Data.frames/**: Directorio de salida automatizado para las tablas de simulación y distribuciones discretas/continuas (`tbl1.Sim`, `tbl2.Disc`, `tbl3.Cont`).
* **Resultados/Graficas/**: Directorio de salida automatizado para las visualizaciones científicas generadas (Ojivas, histogramas y curvas de densidad).
* **main.R**: Archivo central y controlador principal del proyecto.

---

## Metodología de Ejecución

Para ejecutar este proyecto y reproducir los resultados en su computadora local, siga estos pasos:

1.  Abra su entorno de RStudio.
2.  Establezca la carpeta raíz `Practica_probabilidad` como su Directorio de Trabajo (Working Directory).
3.  Abra el archivo `main.R`.
4.  Ejecute el script completo. Este archivo se encargará de cargar automáticamente los archivos de la carpeta `Funciones/`, realizar los cálculos y exportar los productos finales a las subcarpetas de `Resultados/` sin imprimir basura en la consola.

