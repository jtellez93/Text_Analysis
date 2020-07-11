
library(tidyverse)
library(tokenizers)


# Ejemplo 

### segmentacion de palabras ####

texto <- paste("También entiendo que como es temporada de elecciones, las expectativas para lo que lograremos este año son bajas. Aún así, señor Presidente de la Cámara de Representantes, aprecio el enfoque constructivo que usted y los otros líderes adoptaron a finales del año pasado para aprobar un presupuesto, y hacer permanentes los recortes de impuestos para las familias trabajadoras. Así que espero que este año podamos trabajar juntos en prioridades bipartidistas como la reforma de la justicia penal y ayudar a la gente que está luchando contra la adicción a fármacos de prescripción. Tal vez podamos sorprender de nuevo a los cínicos.")
texto

palabras <- tokenize_words(texto)
palabras

length(palabras) # muestra 1 dado que es una lista
class(palabras)

length(palabras[[1]])
# [1] 101



# convertir la lista en tabla 
# observamos cada palabra unica y las veces que se repite en el texto

tabla <- table(palabras[[1]])
tabla <- data_frame(palabra = names(tabla), recuento = as.numeric(tabla))


# Organizar la tabla

arrange(tabla, desc(tabla$recuento))



### Detectar oraciones ####

oraciones <- tokenize_sentences(texto)
oraciones


# tammbien podemnos dividir cada oracion por palabra
oraciones_palabras <- tokenize_words(oraciones[[1]])
oraciones_palabras

# numero de palabras en cada oracion
sapply(oraciones_palabras, length)
# [1] 18 40 34  9














