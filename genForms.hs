module GenForms where
import SvgFunctions

-------------------------------------------------------------------------------
-- Geração do ceu
-------------------------------------------------------------------------------
genSky :: Float -> Float -> [Rect]
genSky width height = [((0.0, 0.0), width, height/2)]
        

-------------------------------------------------------------------------------
-- Geração do sol - terá uma posicao de acordo com o horário 
-------------------------------------------------------------------------------
genSun :: Float -> Float -> Int -> [Circle]
genSun width height clock = [((width - posXSun(clock)*dbhX, maxHeightSun + posYSun(clock)*dbhY),r)]
  where r = width/15 -- raio do sol
        dbhX = width/13 -- intervalo de espaço a cada hora no eixo x (Difference Between Hours eixo x)
        maxHeightSun = height/10 -- posição mais "alta" do sol (12 horas ou 0 hora)
        dbhY = height/50 -- intervalo de espaço a cada hora no eixo y (Difference Between Hours eixo y)


-------------------------------------------------------------------------------
-- Define o calculo realizado para definir a posicao do sol no eixo X
-------------------------------------------------------------------------------
posXSun :: Int -> Float
posXSun clock 
  | clock >=7 && clock <= 18 = abs(fromIntegral(clock)-6) 
  | clock < 7 = abs(fromIntegral(clock)+6) 
  | otherwise = abs(fromIntegral(clock)-18) 


-------------------------------------------------------------------------------
-- Define o calculo realizado para definir a posicao do sol no eixo Y
-------------------------------------------------------------------------------
posYSun :: Int -> Float
posYSun clock 
  | clock >= 1 && clock <= 6 = fromIntegral(clock)
  | clock >= 7 && clock <= 18 = abs(12-fromIntegral(clock)) 
  | clock >= 19 && clock <= 23 = abs(24-fromIntegral(clock))
  | otherwise = fromIntegral 0


-------------------------------------------------------------------------------
-- Geração do mar
-------------------------------------------------------------------------------
genSea :: Float -> Float -> [Rect]
genSea width height = [((0.0, height/2), width, height)]



-------------------------------------------------------------------------------
-- Geração de retângulos
-------------------------------------------------------------------------------
genRectsInLine :: Float -> Float -> Float -> Int -> [Rect]
genRectsInLine base x y n  = [((m*(gap+tam)+x, y-tam), tam, tam) | m <- [0..fromIntegral (n-1)]]
  where gap = tam/(fromIntegral (n))
        tam = if base/(fromIntegral (n+1)) > base/4 then base/4 else base/(fromIntegral (n+1))
  


-------------------------------------------------------------------------------
-- Geracao de trapézios
-------------------------------------------------------------------------------
genTrapeze :: Float -> Float -> Float -> [Trapeze]
genTrapeze base x y = [((x,y), (x+h,y+h), (x+(base*3/4),y+h), (x+base,y))]
  where h = base/4



-------------------------------------------------------------------------------
-- Verifica se o tamanho da base é valido, caso não seja o valor padrão será height/4, 
-- a altura do navio(trapezio) é equivalente a 1/4 do tamanho da base
-- o mar é quivalente a 1/2 da imagem (height/2), sendo assim, o tamanho da base 
-- não pode ser 4x maior (ou mais) que a altura do mar, pois ocuparia quase
-- todo o espaço
-------------------------------------------------------------------------------
verifyBase :: Float -> Float -> Float
verifyBase height base = if base >= 4*height || base <= 0 then height/4 else base


-------------------------------------------------------------------------------
-- Verifica se o horário é valido, caso não seja o valor padrão será 12 (meio-dia)
-------------------------------------------------------------------------------
verifyClock :: Int -> Int
verifyClock clock = if clock < 0 || clock > 23 then 12 else clock


-------------------------------------------------------------------------------
-- Verifica se a posicao inicial do navio é válida, caso não seja o valor
-- padrão será o ponto central do mar x(width/2) e y (height*3/4)
-------------------------------------------------------------------------------
verifyPosX :: Float -> Float -> Float
verifyPosX width posX = if posX < 0 || posX > width then width/2 else posX

verifyPosY :: Float -> Float -> Float
verifyPosY height posY = if posY < height/2 || posY > height then height*3/4 else posY
