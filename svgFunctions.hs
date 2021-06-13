module SvgFunctions where
import Text.Printf

type Point    = (Float,Float)
type Circle   = (Point,Float)
type Rect     = (Point,Float,Float)
type Triangle = (Point,Point,Point)
type Trapeze  = (Point,Point,Point,Point)

-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------
-- Gera string representando retângulo SVG 
-- dadas coordenadas e dimensões do retângulo e uma string com atributos de estilo
svgRect :: Rect -> String -> String
svgRect ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- Gera string representando circulo SVG
svgCircle :: Circle -> String -> String 
svgCircle ((x,y),r) style = 
  printf "<circle cx='%.3f' cy='%.3f' r='%.3f' fill='%s' stroke='black' stroke-width='3'/>\n" x y r style

-- Gera string representando triângulo SVG
svgTriangle :: Triangle -> String -> String
svgTriangle ((x1,y1),(x2,y2),(x3,y3)) style =
  printf "<polygon points = '%.3f,%.3f %.3f,%.3f %.3f,%.3f' style='%s' />\n" x1 y1 x2 y2 x3 y3 style

-- Gera string representando trapézio SVG
svgTrapeze :: Trapeze -> String -> String
svgTrapeze ((x1,y1),(x2,y2),(x3,y3),(x4,y4)) style =
  printf "<polygon points = '%.3f,%.3f %.3f,%.3f %.3f,%.3f %.3f,%.3f' style='%s' />\n" x1 y1 x2 y2 x3 y3 x4 y4 style


-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
svgStyleRect :: (Int,Int,Int) -> String
svgStyleRect (r,g,b) = printf "fill:rgb(%d,%d,%d);" r g b

svgStyleCircle :: (Int,Int,Int) -> String
svgStyleCircle (r,g,b) = printf "rgb(%d,%d,%d)" r g b

svgStyleTriangle :: (Int,Int,Int) -> String
svgStyleTriangle (r,g,b) = printf "fill:rgb(%d,%d,%d); stroke-width:2; stroke:rgb(0,0,0);" r g b

svgStyleTrapeze :: (Int,Int,Int) -> String
svgStyleTrapeze (r,g,b) = printf "fill:rgb(%d,%d,%d); stroke-width:1; stroke:rgb(0,0,0);" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma função geradora de strings SVG, uma lista de círculos/retângulos/triangulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles