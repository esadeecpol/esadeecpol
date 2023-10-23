# esadeecpol

Un paquete de R desarrollado por Esade Center for Economic Policy para mejorar la velocidad de ejecución.

## Sobre este paquete

El paquete de esadeecpol, desarrollado por Esade Center for Economic Policy contiene una serie de funcinoes que pueden ayudar a la descarga de diferntes fuentes de microdatos y a mejorar la eficiencia de la parte de visualización por parte del equipo de datos de EsadeEcPol. La versión actual del paquete es la 1.0, la cual se irá actualizando a medida que se generen nuevas funciones con el objetivo de automatizar funciones que el equipo escribe de forma repetitiva a lo largo de sus proyectos.

El paquete actual contiene información detalla y ejemplos de las funciones en los ficheros .Rd.

## Instrucciones

La instalación del paquete esadeepcol se hará a través de github con el siguiente codigo proporcionado

<pre>
devtools::install_github('esadeecpol/esadeecpol', force = TRUE)
</pre>

Una vez ejecutado ese comando se descargará el paquete de esadeecpol y varios paquetes que necesitan las funciones para poder ejecutarse, unicamente en el caso de que no estén instalados previamente. 
<pre>library(esadeecpol)</pre>
Una vez importamos el paquete como una libreria más en R, este tambiém importa una serie de paquetes que utiliamos siempre en R. Asi no habría que importar manualmente: **tidyverse, haven, glue, readxl, ggtext**

## Usos del paquete

El paquete esadeecpol cuenta varias funciones, divididas en dos grandes bloques: **Automatización** y **Visualización**, que ayudan al usuario a escribir menos codigo en sus proyectos.

### Visualización

<pre>
theme_ecpol()

palette_one to palette_four
palette_semaforo and palette_semaforoinverted
palette_redgreen and palette_greenred

gradient_palette(n)         # Numero del 3 al 20
gradiente_palette_red(n)    # Numero del 3 al 20
gradiente_palette_range(n)  # Numero del 3 al 20

save_to_png(plot, filename)
save_to_svg(plot, filename)

print_colors()
</pre>

La función <code>theme_ecpol()</code> es el tema predeterminado para todos los gráficos de esadeecpol. Unicamente hay que añadirlo al final de cada gráfico generado con ggplot para añadir las caracteristicas propias de nuestras visualizaciones.

Las "funciones" <code>palette_one, palette_two, palette_three y palette_four</code> son paletas de colores discretas que tienen de uno a cuatro colores discretos respectivamente y se utilizan para agregar diferentes colores a las visualizaciones generadas en ggplot2.

Lo mismo con las funciones <code>gradient_palette(n), gradiente_palette_red(n) y  gradiente_palette_range(n)</code>. En este caso son paletas continuas que hacemos discretas a través del parametro <code>n</code> que tienen las funciones, el cual hay que cambiar por el numero entero de 3 a 20 que necesitemos para una visualización determinada.

Una vez terminadas las visualizaciones contamos con dos funciones para guardar los gráficos <code>save_to_png(plot, filename) y save_to_svg(plot, filename)</code>. Estas funciones tienen varios parametros por defecto como <code>width = 18 y height = 12</code> que se pueden cambiar añadiendo dicho parametro al código. Para figuras estandar unicamente hay que completar plot con el grafico que generamos en R y el filename con la ruta y nombre que le damos al gráfico en nuestro Finder.

Por último tenemos <code>print_colors()</code> que unicamente sirve para que nos devuelva una lista de hexadecimales con el nombre de ese color. Muchas veces jorge nos dice "Usa azul esade" y nadie sabe que Hexadecimal es ese. Ahora utilizando esta función lo podrás saber al momento.

### Automatización

<pre>
directory_ecpol()
fonts_ecpol()
download_epa(start_q, end_q, start_y, end_y)
download_ecv(start, end)
download_atlas(filename)
</pre>

La primera función <code>directory_epcol()</code> nos genera de forma automatica el sistema de carpetas que estamos utilizando actualmente para un proyecto simple. Unicamente hay que abrir R, establecernos en la carpeta del proyecto vacía y ejecutar el código.

La función <code>fonts_ecpol()</code> nos importa la tipografía de esade a nuestro entorno global de R. Es una forma de evitar escribir el largo código de importación de fuentes que utilizamos actualmente.

La tercera función es <code>download_epa(start_q, end_q, start_y, end_y)</code>, que nos genera una carpeta llamada EPA en el directorio principal donde se encuentran los microdatos de la EPA. Como veis esta función tiene 4 parametros que hay que completar para poder ejecutar dicha función. Estos corresponden con el trimestre inicial y final y el año inicial y final de los ficheros que queremos descargar.

Siguiendo con las funciones de descarga está <code>download_ecv(start, end)</code> que nos descarga los ficheros de microdatos de la ECV. Igual que la anterior tiene parametros que hay que competar, en este caso el año inicial y final de las encuestas que queremos descargar.

Por último tenemos <code>download_atlas(filename)</code> que nos descarga un fichero csv del Atlas de Renta del INE. El parametro que nos solicita esta función tiene 4 posibles valores: "Renta", "Procedencia", "Gini" o "Demografía" ya que son los cuatro ficheros mas descargados del Atlas de Renta.

## Referencia al paquete

Esade Center for Economic Policy, 2023, "esadeecpol" Disponible en: github.com/esadeecpol/esadeecpol.

## Sobre EsadeEcPol

Esade Center for Economic Policy (EsadeEcPol) es el Think Tank de economía de referencia en España.