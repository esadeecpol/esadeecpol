
#' directory_ecpol genera, una vez en el directorio principal del paper, la estructura de carpetas con la que trabajamos y con esta función no tenemos que crear las carpetas de forma manual
#' Además tambien genera el .gitignore para ahorrarnos ese trabajo.
#'
#'
#' @return Las carpetas necesarias para nuestro trabajo
#' @export
#'
#' @examples

directory_ecpol <- function() {
  # Directorio base
  base_dir <- getwd() # Obtenemos el directorio actual
  
  # Lista de carpetas
  folders <- c("code", "input/raw", "input/data", "output/tables", "output/png", "output/svg", "content")
  
  # Crear carpetas
  for (folder in folders) {
    dir.create(file.path(base_dir, folder), recursive = TRUE, showWarnings = FALSE)
  }
  
  # Crear archivo .gitignore
  gitignore_content <- "*.csv\n*.dta\n*.rds"
  cat(gitignore_content, file = file.path(base_dir, ".gitignore"), sep = "\n")
  
  cat("Directorio creado exitosamente.\n")
}


