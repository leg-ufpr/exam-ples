library(exams)

dir()

fl <- "media_simples_2.Rmd"
exams2html(fl,
           converter = "pandoc-mathjax",
           edir = "num",
           mathjax = TRUE)
