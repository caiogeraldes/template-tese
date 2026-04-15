# Template de tese de doutoramento

**Caio Geraldes <[caio.geraldes@usp.br](mailto:caio.geraldes@usp.br)>**

Este template foi desenvolvido para a diagramação de teses de doutorado
seguindo as normas ABNT, com inclusão de diversos pacotes e macros preparados
especificamente para a diagramação de teses nas áreas de linguística e estudos
clássicos. Decisões estéticas de cunho pessoal foram tomadas e podem ser
facilmente modificadas para acomodar as preferências da autora/do autor e de
sua instituição. Diversos `avisos` são produzidos, sobretudo por conta dos
pacotes `microtype` e `datatool`. Por motivos técnicos, este template não
funciona de maneira fácil no OverLeaf (sobretudo por conta das fontes
personalizadas).

## Como iniciar um projeto utilizando este template

- Clone este repositório:

```
git clone https://github.com/caiogeraldes/templates-tese
```

- Desvincule o .git do repositório online:

```
git remote remove origin
```

- (Opcional): crie seu próprio repositório!

- Escreva a tese!

## Como escrever a tese

Tentei mostrar no template todos os usos básicos, mas se empacar, cheque a
documentação dos pacotes utilizados em `./tesecaiera.cls`. Os pacotes são
importados por `\RequirePackage`. A documentação para eles pode ser encontrada em 
[CTAN](ctan.org/).

Cheque como cada entrada do índice, glossário e bibliografia foi preparada nos
documentos `.bib` incluídos neste template. Imagino que sejam relativamente
autoexplicativos. Caso não o sejam, sinta-se a vontade de entrar em contato
comigo. Não dou garantias, mas tendo tempo tento responder.

## Como compilar a tese

Se você for utilizar os glossários e índices remissivos siga a seguinte
`pipeline`, ela costuma dar mais certo e empacar menos em erros bestas:

```
lualatex --interaction=batchmode --draftmode main.tex
bib2gls main -g --support-unicode-script --quiet
biber main --quiet
lualatex --interaction=batchmode --draftmode main.tex
bib2gls main -g --support-unicode-script --quiet
lualatex --interaction=batchmode --draftmode main.tex
lualatex --interaction=batchmode  main.tex
```

Se você não for utilizar, basta seguir:


```
lualatex --interaction=batchmode --draftmode main.tex
biber main --quiet
lualatex --interaction=batchmode --draftmode main.tex
lualatex --interaction=batchmode  main.tex
```

## Problemas com a compilação:

Se os documentos `.tex` estiverem corretos e ainda assim houver problemas de
compilação, recomendo deletar todos os artefatos produzidos pela compilação e
começar novamente. Às vezes se a compilação para no meio, esses artefatos podem
ser danificados.

Na pior das hipóteses, abra uma Issue nesse projeto e eu vejo o que está
acontecendo se tiver tempo.
Como esse projeto é voluntário, não garanto soluções, mas podendo eu tento.

## Usou o template e deu tudo certo

Me escreva, adoraria ver o resultado desse template rodando o mundo.

