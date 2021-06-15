import SvgFunctions
import Palettes
import GenForms
import Text.Printf

{-
FALTA:
  - Receber cor do navio por parâmetro
  - Resolver localização do sol e da lua (não sair dos limites, voltar para o inicio)
  - Limpar o código

  verificar valores fora do limite
-}

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG --  CORRIGIR
-------------------------------------------------------------------------------
main :: IO ()
main = do
  writeFile "t1luizfelipe.svg" $ svgstrs
  where svgstrs  = svgBegin w h ++ svgsky ++ svgsun ++ svgsea ++ svgship ++ svgrect ++ svgEnd
        clock = 16
        --if clock < 0 || clock > 23 then clock = 12 else clock
        --falta o readme a equação do sol
        base = 1000
        posX = 200
        --if posX < 0 || posX > w(1000) then posX = 0(canto esquerdo)
        posY = 800
        --if posY < 500 || posY > h(1000) then posY = 750(metade do mar) 
        shipColor = (255,345,32) : []
        numContainer = 8

        svgship   = svgElements svgTrapeze trapeze (map svgStyleTrapeze palette) 
        trapeze   = genTrapeze base posX posY ntrapeze
        palette   = shipColor
        ntrapeze  = 1

        svgsky    = svgElements svgRect sky (map svgStyleRect palette2)
        sky       = genSky
        palette2  = defineSkyColor clock

        svgsun    = svgElements svgCircle sun (map svgStyleCircle palette3)
        sun       = genSun clock 1
        palette3  = defineSunColor clock
        
        svgsea    = svgElements svgRect sea (map svgStyleRect palette4)
        sea       = genSea
        palette4  = rgbPaletteSea
        
        svgrect   = svgElements svgRect navio (map svgStyleRect palette5)
        navio     = genRectsInLine base posX posY numContainer
        palette5  = rgbPaletteRect numContainer

        (w,h)     = (1000,1000)
      