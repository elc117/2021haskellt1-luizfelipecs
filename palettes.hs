module Palettes where

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(155,0,0)]

rgbPaletteSky :: Int -> [(Int,Int,Int)]
rgbPaletteSky n = take n $ cycle [(135,206,235),(0,191,255),(65,105,225),(25,25,112)]

rgbPaletteSun :: Int -> [(Int,Int,Int)]
rgbPaletteSun n = take n $ cycle [(255,215,0),(255,140,0),(255,69,0)]

rgbPaletteSea :: Int -> [(Int,Int,Int)]
rgbPaletteSea n = take n $ cycle [(25,25,112)]
--rgbPaletteSea = [(25,25,112)]