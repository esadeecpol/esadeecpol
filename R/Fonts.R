#' Fonts_ecpol nos importa todas las fuentes de esade para que no tengamos que importarlas #' de forma manual cada vez que hagamos graficos en R
#'
#' @return Las fuentes de esade cargadas en el global environment de R
#' @export

fonts_ecpol <- function() {
  library(dplyr)
  library(stringr)
  library(systemfonts)
  
  mabry <- system_fonts() %>%
    filter(family == "Mabry Pro") %>%
    transmute(family, style, file = str_extract(path, "[\\w-]+\\.ttf$"))
  
  mabry_light_path <- system_fonts() %>%
    filter(family == "Mabry Pro", style == "Light") %>%
    pull(path)
  
  assign("mabry_light", mabry_light_path, envir = .GlobalEnv)
  systemfonts::register_font(name = "Mabry Pro Light", plain = mabry_light_path)
  
  mabry_med_path <- system_fonts() %>%
    filter(family == "Mabry Pro", style == "Medium") %>%
    pull(path)
  
  assign("mabry_medium", mabry_med_path, envir = .GlobalEnv)
  systemfonts::register_font(name = "Mabry Pro Medium", plain = mabry_med_path)
}