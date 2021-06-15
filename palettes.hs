module Palettes where

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(155,0,0)]

rgbPaletteRect :: Int -> [(Int,Int,Int)]
rgbPaletteRect n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255),(255,255,0)]
--rgbPaletteSky :: Int -> [(Int,Int,Int)]
--rgbPaletteSky n = take n $ cycle [(135,206,235),(0,191,255),(65,105,225),(25,25,112)]

rgbPaletteSky :: [(Int,Int,Int)]
rgbPaletteSky =  [(135,206,235),(0,191,255),(65,105,225),(28,28,28)]

--rgbPaletteSun :: Int -> [(Int,Int,Int)]
--rgbPaletteSun n = take n $ cycle [(255,215,0),(255,140,0),(255,69,0)]

rgbPaletteSun :: [(Int,Int,Int)]
rgbPaletteSun =  [(255,215,0),(255,140,0),(255,69,0)]

rgbPaletteMoon :: [(Int,Int,Int)]
rgbPaletteMoon =  [(220,220,220)]

rgbPaletteSea :: [(Int,Int,Int)]
rgbPaletteSea =  [(25,25,112)]
--rgbPaletteSea = [(25,25,112)]

defineSkyColor :: Int -> [(Int,Int,Int)]
defineSkyColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSky : []
  | hora >= 12 && hora <= 15 = head (tail rgbPaletteSky) : []
  | hora > 15 && hora <= 17  = head (tail (tail rgbPaletteSky)) :[]
  | otherwise                = last rgbPaletteSky : []


defineSunColor :: Int -> [(Int,Int,Int)]
defineSunColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSun : []
  | hora >= 12 && hora <= 15 = head (tail rgbPaletteSun) :[]
  | hora > 15 && hora <= 17  = last rgbPaletteSun : []
  | otherwise                = rgbPaletteMoon