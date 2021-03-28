# Práctica 6

# Autor
Anayara Moreno Merino

# Descripción
El programa cuenta con dos filtros que se pueden aplicar a la cámara. Hay 3 modos: invertido, normal y random. Las teclas son:
  * Modo normal: tecla n
  * Modo invertido: tecla i
  * Modo random: tecla r
  
# Decisiones tomadas
Se ha optado por hacer filtros sencillos sin utilizar librerías para ello. En el caso del filtro de píxeles random se escoge aleatoriamente entre un valor de 0 y 2 y se multiplica por el valor actual de cada canal. De esta forma los valores de los píxeles pueden aumentar o disminuir. Para el caso del modo invertido a los píxeles originales se les resta un valor de 255 para obtener su opuesto.
