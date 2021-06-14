module Palettes where

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(155,0,0)]

rgbPaletteRect :: Int -> [(Int,Int,Int)]
rgbPaletteRect n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255),(255,255,0)]
--rgbPaletteSky :: Int -> [(Int,Int,Int)]
--rgbPaletteSky n = take n $ cycle [(135,206,235),(0,191,255),(65,105,225),(25,25,112)]

rgbPaletteSky2 :: [(Int,Int,Int)]
rgbPaletteSky2 =  [(135,206,235),(0,191,255),(65,105,225),(28,28,28)]

--rgbPaletteSun :: Int -> [(Int,Int,Int)]
--rgbPaletteSun n = take n $ cycle [(255,215,0),(255,140,0),(255,69,0)]

rgbPaletteSun2 :: [(Int,Int,Int)]
rgbPaletteSun2 =  [(255,215,0),(255,140,0),(255,69,0)]

rgbPaletteMoon :: [(Int,Int,Int)]
rgbPaletteMoon =  [(220,220,220)]

rgbPaletteSea :: [(Int,Int,Int)]
rgbPaletteSea =  [(25,25,112)]
--rgbPaletteSea = [(25,25,112)]