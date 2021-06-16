## Trabalho 1: Generative Art com Programação Funcional em Haskell
### Apresentação

Um navio cargueiro carregando containers está navegando no mar com um longo percurso e, consequentemente, uma viagem de longa duração. 
A única visão em meio ao oceano é o navio carregando seus containers (que possuem cores predefinidas), o céu e o Sol ou a Lua, sendo assim de acordo com o hora do dia o céu 
vai alterando a sua tonalidade, assim como o sol, que além da tonalidade, vai mudando de posição para quem o a vista da Terra (ou do mar rsrs, 
óbvio que Terra com "T" se refere ao planeta, mas o trocadilho é sempre válido) com o passar do tempo até se pôr, a noite chegar e com ela a lua começar a brilhar, 
além disso, cada navio possui seu tamanho, sua cor e também vai mudando sua localização em meio ao oceano.

### O Programa

A imagem é dividida horizontalmente em duas partes iguais, a  superior representa o céu (que contém o Sol ou a Lua) e a inferior representa o mar (contendo o navio). 
Como já citado acima, há algumas variações ao longo de uma viagem naval, sendo assim, o programa pode ser parametrizado em alguns quesitos, são eles: 
  - O tamanho da imagem (largura, altura);
  - O tamanho do navio;
  - A posição que o navio se encontra;
  - A cor do navio;
  - O número de containers que o navio carrega;
  - O horário do dia;

### Como Usar

No arquivo `Main.hs` os parâmetros podem ser alterados dentro da função `main` para isso, basta atribuir outros valores para alguma(s) das seguintes variáveis:
  - **clock:** variável que recebe a hora do dia (são aceitos os valores de 0 a 23, caso saia deste intervalo, receberá o valor padrão 12, representando 12 horas);
     - Exemplo: `clock = 16`
      
  - **base:** variável que recebe o tamanho da base do navio (o navio é representado por um trapézio e o valor atribuído a base, representa a base menor do trapézio
que neste caso estará "em contato com o água do mar", a altura do navio, será o equivalente a 1/4 do tamanho da base, dessa forma caso o valor da base ultrapasse em ao menos
4x o altura do mar, será atribuído automaticamente o valor da base como `height/4`);
     - Exemplo: `base = 400`
      
  - **(posX,posY):** varíáveis que representam a posição do navio no mar (correspondem ao ponto mais a esquerda do trapézio, caso os valores atribuídos estejam
fora do limite: posY ser maior que a altura da imagem `h` ou menor que a posição onde o mar inicia no eixo Y `(height/2)` e/ou posX ser maior que o tamanho da imagem
`w` ou menor que 0, será atribuída a posição central do mar a posX e/ou posY);
     - Exemplo: `(posX,posY) = (500,500)`
      
  - **shipColor:** vaŕiável que recebe uma tupla de 3 valores inteiros para representar a cor do navio, no formato rgb;
     - Exemplo: `shipColor = (255,45,123)` 
  
  - **numContainer:** variável que recebe o número de containers que o navio carrega;
     - Exemplo: `numContainer = 6`
      
  - **(w,h):** variáveis que representam o tamanho da imagem (largura,altura);
     - Exemplo: `(w,h) = (1200,1100)
      `
### Exemplo de imagem de saída

![imagem_saida](https://github.com/elc117/2021haskellt1-luizfelipecs/blob/master/imgt1luizfelipe.svg)
