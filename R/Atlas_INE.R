#' @name Atlas_INE
#' @title Descarga del Atlas de Renta
#' @description Esta funcion nos genera un csv en formato long de 4 posibles fichero del Atlas de Renta del INE: Renta, Procedencia, Gini, Demografia.
#' @param filename, hay que seleccionar que fichero queremos descargar de los 4 posibles.
#' @examples 
#' download_atlas(filename = "Renta")
#' download_atlas(filename = "Procedencia")
#' download_atlas(filename = "Gini")
#' download_atlas(filename = "Demografia")
#' @return Fichero de csv con 4 posibilidades: Renta, Procedencia de la renta, Gini y Demografica
#' @export

download_atlas <- function(filename){

    codes <- list(
        Renta = 30824,
        Procedencia = 30825,
        Gini = 37677,
        Demografia = 30832)

    file_code <- codes[[filename]]

    if (is.null(file_code)) {
        stop('Ese nombre no es valido meu')
    }

    url <- glue::glue('https://www.ine.es/jaxiT3/files/t/es/px/{file_code}.px?nocab=1')
    destfile <- glue::glue('{filename}.px')
  
    # Descargar el archivo
    download.file(url, destfile)

    suppressWarnings({
        df <- pxR::read.px(destfile) |> as_tibble()
         data.table::fwrite(df, glue::glue('{filename}.csv'))
    })
    
    file.remove(destfile)

}


