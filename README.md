# exam-ples

Repositório com exemplos de questões produzidas com o pacote
[exams](https://cran.r-project.org/package=exams) do
[R](http://cran-r.c3sl.ufpr.br/).

## Instalação

Para instalar o pacote no R


```r
install.packages("exams")
```

Depois de instalado, carregue o pacote com


```r
library(exams)
```

## Uso

Depois de criar uma questão no formato apropriado, podemos fazer sua
visualização em HTML com


```r
exams2html("arquivo.Rmd", converter = "pandoc-mathjax", mathjax = TRUE)
```

Isso fará com que a página HTML com a questão apareça automaticamente no
seu navegador padrão.

<div style="background-color:grey;color:black;padding:5px;">
Para verificar o navegador padrão definido no R, faça

```r
getOption("browser")
```
Caso queira mudar, passe o caminho do executável do navegador. Por
exemplo

```r
options(browser = "/usr/bin/firefox")
```

</div>
