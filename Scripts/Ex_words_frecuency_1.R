library(httr)
library(tidyverse)
library(tokenizers)



# Ejemplo 

# leemos la letra de la cancion we are the champions de la siguiente url

url <- "https://www.letraseningles.es/letrascanciones/traduccionesPR/Queen-WeAreTheChampions.html"
html <- GET(url) 
content <- content(html, as = "text") # codigo html de la pagina
parsedHtml <- htmlParse(content, asText = TRUE)

xpathSApply(parsedHtml, "//title", xmlValue)
letra <- xpathSApply(parsedHtml, "//section[2]", xmlValue)

letra <- read_lines(letra)
letra <- letra[3:38]
class(letra)


# Determinar stopwords
# son palabras que funcionan como estructura ej: el, y, la, ....
# descargamos una lista de stopwords del lenguaje ingles basada en:
# https://countwordsfree.com/stopwords/english/txt

url_stop <- "https://countwordsfree.com/stopwords/english/txt"
stopwords_en <- read.csv(url_stop, stringsAsFactors = F,
                         header = F )
stopwords_en <- stopwords_en$V1
class(stopwords_en)


### segmentacion de palabras ####

texto <- paste(letra, collapse = " ")
texto

palabras <- tokenize_words(texto, stopwords = stopwords_en)
palabras

length(palabras) # muestra 1 dado que es una lista
class(palabras)

length(palabras[[1]])
# [1] 51


# convertir la lista en tabla 
# observamos cada palabra unica y las veces que se repite en el texto

tabla <- table(palabras[[1]])
tabla <- data_frame(palabra = names(tabla), recuento = as.numeric(tabla))


# Organizar la tabla

tabla <- arrange(tabla, desc(tabla$recuento))
















