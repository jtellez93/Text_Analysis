
library(tidyverse)
library(stringdist)

?stringdist # tringdist calcula distancias de cadena por pares 
# entre elementos de a y b, donde se recicla el argumento con menos 
# elementos. stringdistmatrix calcula la matriz de distancia de la cadena 
# con filas según a y columnas según b.

# el metodo de la distancia de Jaro (método = 'jw', p = 0), 
# es un número entre 0 (coincidencia exacta) y 1 (completamente diferente) 
# que mide la diferencia entre cadenas. 

