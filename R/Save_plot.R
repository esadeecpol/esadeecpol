#' @title Funciones de exportación de graficos de EsadeEcPol
#' @description Las funciones de este fichero sirven para hacer mas rapido la exportacion de las visualizaciones de Esade, ya que dejamos valores por defecot
#' 
#' @param plot componente al que asignamos la figura de ggplot
#' @param filename Nombre que se le quiere dar al archivo, incluyendo ruta
#' @param width Ancho de la figura
#' @param height Alto de la figura
#' @param unit Unidades de medida
#' @param dpi Densidad de pixeles por pulgada
#'
#' @return
#' @export

save_to_png <- function(plot, filename = "", width = 18, height = 12, unit = "cm", dpi = 300) {
  ggsave(
    plot = plot,
    filename = filename,
    device = 'png',
    width = width,
    height = height,
    unit = unit,
    dpi = dpi
  )
}

# Función para guardar gráficos en PDF
save_to_svg <- function(plot, filename = "", width = 18, height = 12, unit = "cm", dpi = 300) {
  ggsave(
    plot = plot,
    filename = filename,
    device = 'svg',
    width = width,
    height = height,
    unit = unit,
    dpi = dpi
  )
}
