# Definir paletas de colores
palettes_ecpol <- list(
  onecolors = c("#00A47D"),
  twocolors = c("#225E9C","#EFB43F"),
  threecolors = c("#225E9C","#00A47D","#EFB43F"),
  redgreen = c("#00A47D","#E05656"),
  greenred = c("#E05656","#00A47D"),
  semaforo_inverted = c("#00A47D","#EFB43F","#E05656"),
  semaforo = c("#00A47D","#EFB43F","#E05656"),
  fourcolors = c("#E05656","#EFB43F","#00A47D","#225E9C")
)

# Función para obtener una paleta específica
#' @export
palette_ecpol <- function(name, n = NULL) {
  pal <- palettes_ecpol[[name]]
  if (is.null(pal))
    stop("De qué me hablas nano")

  if (is.null(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("No hay tanto color")
  }

  out <- pal[1:n]
  structure(out, class = "palette", name = name)
}

# Definir paletas específicas
#' @export
palette_one <- palette_ecpol("onecolors")
#' @export
palette_two <- palette_ecpol("twocolors")
#' @export
palette_semaforoinverted <- palette_ecpol("semaforo_inverted")
#' @export
palette_semaforo <- palette_ecpol("semaforo")
#' @export
palette_redgreen <- palette_ecpol("redgreen")
#' @export
palette_greenred <- palette_ecpol("greenred")
#' @export
palette_three <- palette_ecpol("threecolors")
#' @export
palette_four <- palette_ecpol("fourcolors")

# Definir paletas de gradiente
gradient_palettes <- list(
  gradient_palette_red = c("#E05656", "#F47D7D", "#FCA55F", "#FFCE7A", "#efb43f", "#ddb24c", "#cdb057", "#bcad61", "#adaa69", "#9da66f", "#8fa275", "#809e7a", "#73997e", "#659582", "#589084", "#4b8a86", "#3e8588", "#328088", "#257a89", "#177488", "#0e6f86", "#0f6982", "#0f637e", "#0f5d7a"),
  gradient_palette = c("#efb43f", "#ddb24c", "#cdb057", "#bcad61", "#adaa69", "#9da66f", "#8fa275", "#809e7a", "#73997e", "#659582", "#589084", "#4b8a86", "#3e8588", "#328088", "#257a89", "#177488", "#0e6f86", "#0f6982", "#0f637e", "#0f5d7a", "#0f5776", "#0e5172", "#0e4c6d", "#0d4669", "#0c4065", "#0b3b61", "#0a365c", "#083058", "#072b54", "#05264f", "#04214b", "#021c47", "#001742", "#00113e", "#000a3a"),
  gradient_palette_range = c("#E05656", "#F47D7D", "#FCA55F", "#efb43f", "#cdb057", "#adaa69", "#8fa275", "#73997e", "#4b8a86", "#257a89", "#0f637e", "#0e4c6d", "#0a365c", "#000a3a")
)

#' @export
gradient_palette_red <- colorRampPalette(gradient_palettes$gradient_palette_red)
#' @export
gradient_palette <- colorRampPalette(gradient_palettes$gradient_palette)
#' @export
gradient_palette_range <- colorRampPalette(gradient_palettes$gradient_palette_range)

# Crear múltiples paletas de gradiente
gradient_loop <- 3:20
for (i in gradient_loop) {
  assign(paste0("gradient_palette_", i), colorRampPalette(gradient_palettes$gradient_palette)(i))
  assign(paste0("gradient_palette_red_", i), colorRampPalette(gradient_palettes$gradient_palette_red)(i))
  assign(paste0("gradient_palette_range_", i), colorRampPalette(gradient_palettes$gradient_palette_range)(i))
}

# Función para imprimir paletas
#' @export
print_palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' @export
print_gradient <- outer(1:20, 1:20, function(x, y) sin(sqrt(x * y) / 3))
