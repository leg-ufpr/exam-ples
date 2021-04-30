library("exams")
## exams_skeleton(markup = "markdown", encoding = "UTF-8",
##                 writer = c("exams2html", "exams2moodle"))

## Capital do Paraná com 5 alternativas
exams2html("capital_pr1.Rmd")
t1 <- stresstest_exercise("capital_pr1.Rmd")
plot(t1)
## For non-numeric choice questions, the rank is based on the
## lexicographical order of the answerlist.
## Aqui o rank será sempre 2, pois Curitiba vem depois de Cascavel

## Capital do Paraná com 10 alternativas, selecionando apenas 5
exams2html("capital_pr2.Rmd")
t2 <- stresstest_exercise("capital_pr2.Rmd")
plot(t2)
## Aqui o rank é variável pois vai depender das outras alternativas
str(t2)
t2$rank[1]
t2$position[1,]
## Confere se alguma vez nao teve a verdadeira
any(apply(t2$position, 1, sum) == 0)

## Cidades do Paraná - múltipla escolha
set.seed(1)
exams2html("capital_pr3_mchoice.Rmd")
t3 <- stresstest_exercise("capital_pr3_mchoice.Rmd")
plot(t3)
str(t3)
set.seed(1)
exams2html("capital_pr3_mchoice.Rmd")
t3$rank[1,]
t3$position[1,]
## Confere se alguma vez nao teve a verdadeira
any(apply(t3$position, 1, sum) == 0)
any(t3$ntrue == 0)

## Média estático
exams2html("media_schoice1.Rmd")
t4 <- stresstest_exercise("media_schoice1.Rmd")
plot(t4)

## Média estático com R
exams2html("media_schoice2.Rmd")
t5 <- stresstest_exercise("media_schoice2.Rmd")
plot(t5)

## Média sampling com R
exams2html("media_schoice3.Rmd")
t6 <- stresstest_exercise("media_schoice3.Rmd")
plot(t6)

## Média sampling com R e rnorm
exams2html("media_schoice4.Rmd", converter = "pandoc-mathjax")
t7 <- stresstest_exercise("media_schoice4.Rmd")
plot(t7)

## Média mchoice basico
exams2html("media_mchoice1.Rmd", converter = "pandoc-mathjax")
t8 <- stresstest_exercise("media_mchoice1.Rmd")
plot(t8)
plot(t8, type = "solution")

## Média mchoice elaborado
exams2html("media_mchoice2.Rmd", converter = "pandoc-mathjax")
t9 <- stresstest_exercise("media_mchoice2.Rmd")
plot(t9)
## PROBLEMA: não tem controle sobre quantidade de verdadeiras e falsas
## Confere todas falsas
any(t9$ntrue == 0)
sum(t9$ntrue == 0)
which(t9$ntrue == 0)
## Exemplo tudo falso
set.seed(5)
exams2html("media_mchoice2.Rmd", converter = "pandoc-mathjax")
## Confere todas verdadeiras
any(t9$ntrue == 5)
sum(t9$ntrue == 5)
which(t9$ntrue == 5)
## Exemplo tudo verdadeiro
set.seed(15)
exams2html("media_mchoice2.Rmd", converter = "pandoc-mathjax")

## Média mchoice elaborado e WHILE
exams2html("media_mchoice3.Rmd", converter = "pandoc-mathjax")
t10 <- stresstest_exercise("media_mchoice3.Rmd")
plot(t10)
any(t10$ntrue == 0)
any(t10$ntrue == 5)


## Mais alguns exemplos
exams2html("exemplos_testados/randu.Rmd",
           converter = "pandoc-mathjax")
exams2html("exemplos_testados/teorica.Rmd",
           converter = "pandoc-mathjax")
exams2html("exemplos_testados/dist_amostral.Rmd",
           converter = "pandoc-mathjax")
exams2html("exemplos_testados/num-calculo-juros.Rmd",
           converter = "pandoc-mathjax")

## Exporta questão no formato do Moodle
exams2moodle("media_mchoice3.Rmd",
             n =  3,
             converter = "pandoc-mathjax")
