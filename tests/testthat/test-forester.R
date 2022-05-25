test_that("forester png works", {
  output <- file.path(tempdir(), "example.png")
  output <- file.path("../outputs","example.png")

  forester(left_side_data=df_ex[,1:3],
           estimate=df_ex$Estimate,
           ci_low=df_ex$`CI low`,
           ci_high=df_ex$`CI high`,
           ci_sep = " to ",
           right_side_data = NULL,
           estimate_precision = 1,
           ggplot_width = 30,
           null_line_at = NULL,
           file_path = output,
           dpi = 600,
           display = F,
           font_family = "mono",
           estimate_col_name = "Estimate",
           stripe_colour = "#eff3f2",
           background_colour = "white",
           x_scale_linear = TRUE,
           xlim = NULL,
           xbreaks = NULL,
           nudge_y = 0,
           nudge_x = 1,
           nudge_height = 0,
           nudge_width = 0,
           justify = 0,
           arrows = FALSE,
           arrow_labels = c("Lower", "Higher"),
           add_plot = NULL,
           add_plot_width = 1,
           add_plot_gap = FALSE,
           add_plot_white = TRUE,
           point_sizes = 3,
           point_shapes = 16,
           center_ggplot = NULL,
           lower_header_row = FALSE,
           render_as = "png")

  expect_true(file.exists(output))
})


test_that("forester + bar plot png works", {
  output <- file.path(tempdir(), "example_bar.png")
  output <- file.path("../outputs","example_bar.png")


  df_ex$Index <- rev(0:(nrow(df_ex)-1))
  df_bar <- df_ex[!is.na(df_ex$Inclisiran),]
  add_plot <- ggplot(df_bar, aes(x=Inclisiran, y=Index)) + geom_col(orientation="y") +
      ggplot2::theme_classic() + # base theme
      ggplot2::theme(text = ggplot2::element_text(family="mono", size=12),
                     axis.line.x = ggplot2::element_line(colour="black"),
                     axis.ticks.length.x = grid::unit(.07, "in"),
                     axis.title.y = ggplot2::element_blank(),
                     axis.text.y = ggplot2::element_blank(),
                     axis.ticks.y = ggplot2::element_blank(),
                     axis.line.y = ggplot2::element_blank(),
                     panel.background = ggplot2::element_rect(fill = "transparent"),
                     plot.background = ggplot2::element_rect(fill = "transparent", color = NA),
                     panel.grid.major = ggplot2::element_blank(),
                     panel.grid.minor = ggplot2::element_blank(),
                     legend.background = ggplot2::element_rect(fill = "transparent"),
                     legend.box.background = ggplot2::element_rect(fill = "transparent"),
                     legend.position = "none")

  forester(left_side_data=df_ex[,1:3],
           estimate=df_ex$Estimate,
           ci_low=df_ex$`CI low`,
           ci_high=df_ex$`CI high`,
           ci_sep = " to ",
           right_side_data = NULL,
           estimate_precision = 1,
           ggplot_width = 30,
           null_line_at = -50,
           file_path = output,
           dpi = 600,
           display = F,
           font_family = "mono",
           estimate_col_name = "Estimate",
           stripe_colour = "#eff3f2",
           background_colour = "white",
           x_scale_linear = TRUE,
           xlim = c(-75, 0),
           xbreaks = NULL,
           nudge_y = 0,
           nudge_x = 1,
           nudge_height = 0,
           nudge_width = 0,
           justify = 0,
           arrows = TRUE,
           arrow_labels = c("Lower", "Higher"),
           add_plot = add_plot,
           add_plot_width = 15,
           add_plot_gap = FALSE,
           add_plot_white = TRUE,
           point_sizes = 3,
           point_shapes = 16,
           center_ggplot = NULL,
           lower_header_row = F,
           render_as = "png")
  expect_true(file.exists(output))
})
