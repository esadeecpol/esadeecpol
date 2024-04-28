#' @title Lista de colores EsadeEcPol
#' @description Esta función nos devuelve una tabla con los nombres de los colores y su hexadecimal
#' 
#' 
#' @examples 
#' print_colors()
#' 
#' @return Tabla con el nombre y el hexadecimal de los colores básicos de esade
#' @export
#' 

print_colors <- function() {

    name <- c('Azul', 'Azul Esade', 'Rojo', 'Verde', 'Amarillo', 'Magenta','fucsia','Morado', 'Naranja', 'gris oscuro', 'negro')
    hexa <- c('#225E9C', '#030B3D','#E05656','#00A47D', '#EFB43F', '#952EA0', '#E6007E', '#4B2991',  '#F27200', '#404040', '#1a1a1a')

    color_table <- data.frame(Name = name, Hexadecimal = hexa)

    knitr::kable(color_table)
}

print_colors()



#' @title Lista de colores EsadeEcPol para usar en ggploot
#' @description Esta función sirve para usar los colores en español en vez de en hexa
#' 
#' 
#' @examples 
#' colors()
#' 
#' @return vector con el nombre y el hexadecimal que representa
#' @export
#' 

names <- c('azul', 'azul_esade', 'rojo', 'verde', 'amarillo', 'magenta', 'fucsia', 'morado',
'naranja', 'gris_oscuro', 'negro')

hexas <- c('#225E9C', '#030B3D','#E05656','#00A47D', '#EFB43F', '#952EA0', '#E6007E', '#4B2991',  '#F27200', '#404040', '#1a1a1a')

# FUncion para crear el vector de colores
color_vector <- function(names, hexas) {
    colors <- setNames(hexas, names)
    return(colors)
}

color_vector <- color_vector(name, hexa)
