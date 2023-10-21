#' @title Descarga de ECV
#' @description Funcion de descarga de los ficheros anuales de la Encuesta de Condiciones de Vida
#' 
#' @param start Años desde el 8 hasta el numero 22
#' @param end Años desde el 8 hasta el numero 22
#' 
#' @examples
#' download_ecv(start = 9, end = 22)
#' download_ecv(start = 9, end = 9)
#' 
#' @return Ficheros csv de los años seleccionados en una carpeta llamada ECV
#' @export
download_ecv <- function(start = 16, end = 22) {
    library(glue)
    for (y in start:end) {

        y <- sprintf("%02d", y)
        url <- glue("https://www.ine.es/ftp/microdatos/ecv/ecv_b2013/datos_20{y}.zip")
        destfile <- glue('data_20{y}')

        download.file(url, destfile)
        unzip(destfile)
        file.remove(destfile)

        zip_files <- list.files(pattern = "\\.zip$")
        for (zip_file in zip_files) {
            unzip(file.path(zip_file))
            file.remove(zip_file)
        }

        folders <- c('R', 'SAS', 'SPSS')
        for (f in folders){
            dir <- list.dirs(glue('{f}'))
            unlink(dir, recursive = T)
        }

        txt <- list.files(pattern = 'txt|.doc|.xlsx|7z')
        file.remove(txt)

        setwd('STATA')
        files <- list.files(pattern = '\\.dta$')
        files        
        for (file in files){
            df <- haven::read_dta(file)
            name <- sub("\\.dta$", "", file)
            data.table::fwrite(df, glue('{name}.csv'))
            file.remove(file)
            rm(df)
        }
        setwd('../')
    }
    oldname <- 'STATA'
    newname <- 'ECV'
    file.rename(oldname, newname)
    rm(list = ls())
}

