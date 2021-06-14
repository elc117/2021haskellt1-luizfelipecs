import SvgFunctions
import Palettes
import Text.Printf

{-
FALTA:
  - Desenhar navio (retângulos e círculos)
  - Receber cor do navio por parâmetro
  - Resolver localização do sol e da lua (não sair dos limites, voltar para o inicio)
  - Resolver getLine (passagem de parâmetros do usuário)
  - Limpar o código
-}

--  Muita coisa por corrigir aqui
-------------------------------------------------------------------------------
-- Geração do ceu
-------------------------------------------------------------------------------
genSky :: Int -> [Rect]
genSky n  = [((m*(w+gap), 0.0), w, h) | m <- [0..fromIntegral (n-1)]]
  where (w,h) = (1000,500)
        gap = 10

-------------------------------------------------------------------------------
-- Geração do sol
-------------------------------------------------------------------------------
genSun :: Float -> Int -> [Circle]
genSun hora n  = [((w-gap * abs(hora-5),100 + abs(12-hora)*20), r) | m <- [0..fromIntegral (n-1)]]
  where r = 60
        w = 1000
        gap = 70
        space = (gap - r)/2


-------------------------------------------------------------------------------
-- Geração do mar
-------------------------------------------------------------------------------
genSea :: Int -> [Rect]
genSea n  = [((0.0, 500.0), w, h) | m <- [0..fromIntegral (n-1)]]
  where (w,h) = (1000,500)
        gap = 10


-------------------------------------------------------------------------------
-- Geração de retângulos
-------------------------------------------------------------------------------
genRectsInLine :: Float -> Float -> Float -> Int -> [Rect]
genRectsInLine base x y n  = [((m*(gap+tam)+x, y-tam), tam, tam) | m <- [0..fromIntegral (n-1)]]
  where gap = 10
        tam = base/10

-------------------------------------------------------------------------------
-- Geracao de trapézios
-------------------------------------------------------------------------------
--genTrapeze n = [((0,0), (50,50), (150,50), (200,0)) | m <- [0..fromIntegral (n-1)]]

genTrapeze :: Float -> Float -> Float -> Int -> [Trapeze]
genTrapeze base x y n = [((x,y), (x + base/4,y+h), (x+(base*3/4),y+h), (x + base,y)) | m <- [0..fromIntegral (n-1)]]
  where h = base/4


defineSkyColor :: Int -> [(Int,Int,Int)]
defineSkyColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSky2 : [] -- manha
  | hora == 12               = head (tail rgbPaletteSky2) : []
  | hora > 12 && hora <= 17  = head (tail (tail rgbPaletteSky2)) :[]
  | otherwise                = last rgbPaletteSky2 : []


defineSunColor :: Int -> [(Int,Int,Int)]
defineSunColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSun2 : []
  | hora == 12               = head (tail rgbPaletteSun2) :[]
  | hora > 12 && hora <= 17  = last rgbPaletteSun2 : []
  | otherwise                = rgbPaletteMoon
  

stringToInt :: String -> Int
stringToInt str = read str 

stringToFloat :: String -> Float
stringToFloat str = read str 

--stringToRGB :: String -> (Int,Int,Int)
--stringToRGB str = read str
-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG --  CORRIGIR
-------------------------------------------------------------------------------
main :: IO ()
main = do
  
  putStrLn "Digite o horario do dia em que o navio esta navegando: "
  hora' <- getLine -- o que eu faço aqui?
  hora  =  read hora'
  putStrLn "Digite o tamanho da base do navio (base menor de um trapezio): "
  base' <- getLine
  let base = stringToFloat base'
  putStrLn "Digite a posicao do navio (x,y) (Aposicao se refere ao ponto mais a esquerda da base maior do trapezio): "
  
  putStrLn "Digite a cor do navio no formato rgb"
  
  
  {-
  defineSkyColor turno, otherwise manha
  
  chama desenho e cor do ceu e o sol
  -}

  
  --base <- getLine
  
  --(x,y) <- getLine
  


  {-
  verifica tamanho da base e a posicao
  chama desenho
  -}

  writeFile "t1luizfelipe.svg" $ svgstrs
  where svgstrs   = svgBegin w h ++ svgsky ++ svgsun ++ svgsea ++ svgfigs ++ svgrect ++ svgEnd
        
        svgfigs   = svgElements svgTrapeze trapeze (map svgStyleTrapeze palette) 
        trapeze   = genTrapeze base 100 700 ntrapeze
        palette   = rgbPalette ntrapeze
        ntrapeze  = 1

        svgsky    = svgElements svgRect sky (map svgStyleRect palette2)
        sky       = genSky 1
        palette2  = defineSkyColor 20
        

        svgsun    = svgElements svgCircle sun (map svgStyleCircle palette3)
        sun       = genSun hora 1
        palette3  = defineSunColor hora

        svgsea    = svgElements svgRect sea (map svgStyleRect palette4)
        sea       = genSea 1
        palette4  = rgbPaletteSea
        
        svgrect    = svgElements svgRect navio (map svgStyleRect palette5)
        navio       = genRectsInLine base 100 700 4
        palette5  = rgbPaletteRect 4

        (w,h) = (1000,1000)
      