import SvgFunctions
import Palettes
import Text.Printf


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
genSun :: Int -> [Circle]
genSun n  = [((500,80), r) | m <- [0..fromIntegral (n-1)]]
  where r = 75


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
genRects :: Int -> [Rect]
genRects n  = [((m*(w+gap), 0.0), w, h) | m <- [0..fromIntegral (n-1)]]
  where (w,h) = (200,300)
        gap = 10


-------------------------------------------------------------------------------
-- Geracao de circulos
-------------------------------------------------------------------------------
genCircleInLine :: Int -> [Circle]
genCircleInLine n  = [(((gapx-r*2) - m*(r*2+gap*2),gapy), r) | m <- [0..fromIntegral (n-1)]]
  where r = 8
        gap = 20
        gapx = 100
        gapy = 300


-------------------------------------------------------------------------------
-- Geracao de triangulos
-------------------------------------------------------------------------------
genTriangle :: Int -> [Triangle]
genTriangle n = [((m*(gap/(m+1)),0.0),(gap*2-m*(gap/(m+1)),0.0),(gap,(gap+gap/2)-m*(gap/(m+1)))) | m <- [0..fromIntegral (n-1)]]
  where gap = 100


-------------------------------------------------------------------------------
-- Geracao de trapézios
-------------------------------------------------------------------------------
--genTrapeze n = [((0,0), (50,50), (150,50), (200,0)) | m <- [0..fromIntegral (n-1)]]

genTrapeze :: Int -> [Trapeze]
genTrapeze n = [((inicioX,inicioY), (inicioX + base/4,inicioY+h), (inicioX+(base*3/4),inicioY+h), (inicioX + base,inicioY)) | m <- [0..fromIntegral (n-1)]]
  where inicioX = 350
        inicioY = 700
        base    = 500
        h       = 125



-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG --  CORRIGIR
-------------------------------------------------------------------------------
main :: IO ()
main = do
  
  putStrLn "Digite o turno do dia em que o navio esta navegando (manha, meio-dia, tarde ou noite): "
  turno <- getLine
  {-
  verificaTurno turno, otherwise manha
  
  chama desenho e cor do ceu e o sol
  -}

  putStrLn "Digite o tamanho da base do navio (base menor de um trapezio): "
  base <- getLine
  putStrLn "Digite a posicao do navio (x,y) (Aposicao se refere ao ponto mais a esquerda da base maior do trapezio): "
  (x,y) <- getLine
  putStrLn "Digite a cor principal do navio no formato rgb"
  putStrLn "Digite a cor secundaria do navio no formato rgb"

  {-
  verifica tamanho da base e a posicao
  chama desenho
  -}

  writeFile "t1luizfelipe.svg" $ svgstrs
  where svgstrs   = svgBegin w h ++ svgsky ++ svgsun ++ svgsea ++ svgfigs ++ svgEnd
        
        svgfigs   = svgElements svgTrapeze trapeze (map svgStyleTrapeze palette) 
        trapeze   = genTrapeze ntrapeze
        palette   = rgbPalette ntrapeze
        ntrapeze  = 1

        svgsky    = svgElements svgRect sky (map svgStyleRect palette2)
        sky       = genSky nrect
        palette2  = rgbPaletteSky nrect
        nrect     = 3

        svgsun    = svgElements svgCircle sun (map svgStyleCircle palette3)
        sun       = genSun 1
        palette3  = rgbPaletteSun 3

        svgsea    = svgElements svgRect sea (map svgStyleRect palette4)
        sea       = genSea 1
        palette4  = rgbPaletteSea 1
        
        (w,h) = (1000,1000)
      