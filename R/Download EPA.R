#' @title Descarga de los microdatos de la EPA y unificacion de ficheros
#' @description La funcion descarga los ficheros de microdatos de la EPA desde el primer trimestre de 2005 hasta el ultimo trimestre existente
#' 
#' @param start_q Primer trimestre de descarga
#' @param end_q Ultimo trimestre de descarga
#' @param start_y Primer año de descarga
#' @param end_y Ultimo año de descarga
#' 
#' @return Ficheros csv trimestrales en la carpeta EPA
#' @export
download_epa <- function(start_q = 1, end_q = 4, start_y = 5, end_y = 23) {
    library(glue)
    for (i in start_q:end_q){
        for (y in start_y:end_y){

            y <- sprintf("%02d", y)
            url <- glue("https://www.ine.es/ftp/microdatos/epa/datos_{i}t{y}.zip")
            destfile <- glue('data{i}y{y}')
        
            download.file(url, destfile)
            unzip(destfile)
            file.remove(destfile)

            folders <- c('R', 'SAS', 'SPSS')
            for (f in folders){
                dir <- list.dirs(glue('{f}'))
                unlink(dir, recursive = T)
            }

            setwd('STATA')
            file <- list.files(pattern = '\\.dta$')
            df <- haven::read_dta(file)
            name <- sub("\\.dta$", "", file)
            data.table::fwrite(df, glue('{name}.csv'))
            rm(df)
            file.remove(file)
            setwd('../')
            txt <- list.files(pattern = 'txt')
            file.remove(txt)
        }
    }
    oldname <- 'STATA'
    newname <- 'EPA'
    file.rename(oldname, newname)
    rm(list = ls())
}
