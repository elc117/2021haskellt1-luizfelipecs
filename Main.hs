import SvgFunctions
import Palettes
import GenForms
import Text.Printf

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------
main :: IO ()
main = do
  writeFile "imgt1luizfelipe.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgsky ++ svgsun ++ svgsea ++ svgship ++ svgrect ++ svgEnd
        -- PARÂMETROS
        --horario do dia (0 a 23)
        clock = 22
        --base do navio (base menor de um trapezio)
        base = 250
        --posicao inicial do navio nos eixo x e y (ponto mais a esquerda do trapezio)
        (posX,posY) = (150,300)
        --cor do navio
        shipColor    = (255,345,132)
        --numero de containers que o navio carrega
        numContainer = 8
        --tamanho da imagem (largura x altura)
        (w,h)        = (500,500)

        --verificação dos valores (se não forem válidos, assumem um  valor padrão)
        clock' = verifyClock clock
        base'  = verifyBase h base
        posX'  = verifyPosX w posX
        posY'  = verifyPosY h posY
        shipColor' = shipColor : []

        --criação das formas geométricas que compõem a imagem
        svgship           = svgElements svgTrapeze trapeze (map svgStyleTrapeze paletteShip) 
        trapeze           = genTrapeze base' posX' posY'
        paletteShip       = shipColor'

        svgsky            = svgElements svgRect sky (map svgStyleRect paletteSky)
        sky               = genSky w h
        paletteSky        = defineSkyColor clock'

        svgsun            = svgElements svgCircle sun (map svgStyleCircle paletteSun)
        sun               = genSun w h clock'
        paletteSun        = defineSunColor clock'
        
        svgsea            = svgElements svgRect sea (map svgStyleRect paletteSea)
        sea               = genSea w h
        paletteSea        = rgbPaletteSea
        
        svgrect           = svgElements svgRect container (map svgStyleRect paletteContainer)
        container         = genRectsInLine base' posX' posY' numContainer
        paletteContainer  = rgbPaletteRect numContainer

      