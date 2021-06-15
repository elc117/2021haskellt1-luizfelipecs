module GenForms where
import SvgFunctions

-------------------------------------------------------------------------------
-- Geração do ceu
-------------------------------------------------------------------------------
genSky :: [Rect]
genSky = [((0.0, 0.0), w, h)]
  where (w,h) = (1000,500)
        

-------------------------------------------------------------------------------
-- Geração do sol
-------------------------------------------------------------------------------
genSun :: Int -> Int -> [Circle]
genSun hora n  = [((w-gap * abs(fromIntegral(hora)-5),100 + abs(12-fromIntegral(hora))*20), r) | m <- [0..fromIntegral (n-1)]]
  where r = 60
        w = 1000
        gap = 70
        space = (gap - r)/2


-------------------------------------------------------------------------------
-- Geração do mar
-------------------------------------------------------------------------------
genSea :: [Rect]
genSea = [((0.0, 500.0), w, h)]
  where (w,h) = (1000,500)


-------------------------------------------------------------------------------
-- Geração de retângulos
-------------------------------------------------------------------------------
genRectsInLine :: Float -> Float -> Float -> Int -> [Rect]
genRectsInLine base x y n  = [((m*(gap+tam)+x, y-tam), tam, tam) | m <- [0..fromIntegral (n-1)]]
  where gap = 10
        tam = base/(fromIntegral (n))
  

-------------------------------------------------------------------------------
-- Geracao de trapézios
-------------------------------------------------------------------------------
genTrapeze :: Float -> Float -> Float -> Int -> [Trapeze]
genTrapeze base x y n = [((x,y), (x+h,y+h), (x+(base*3/4),y+h), (x+base,y)) | m <- [0..fromIntegral (n-1)]]
  where h = base/4