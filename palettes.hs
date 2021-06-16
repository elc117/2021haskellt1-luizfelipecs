module Palettes where

-- Cores do retângulo
rgbPaletteRect :: Int -> [(Int,Int,Int)]
rgbPaletteRect n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255),(255,255,0)]

-- Cores do Céu
rgbPaletteSky :: [(Int,Int,Int)]
rgbPaletteSky =  [(135,206,235),(0,191,255),(65,105,225),(28,28,28)]

-- Cores do Sol
rgbPaletteSun :: [(Int,Int,Int)]
rgbPaletteSun =  [(255,215,0),(255,140,0),(255,69,0)]

-- Cor da Lua
rgbPaletteMoon :: [(Int,Int,Int)]
rgbPaletteMoon =  [(220,220,220)]

-- Cor do mar
rgbPaletteSea :: [(Int,Int,Int)]
rgbPaletteSea =  [(25,25,112)]

-- Define qual será a cor do ceu dentre as possibilidades de acordo com o horario
defineSkyColor :: Int -> [(Int,Int,Int)]
defineSkyColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSky : []
  | hora >= 12 && hora <= 15 = head (tail rgbPaletteSky) : []
  | hora > 15 && hora <= 18  = head (tail (tail rgbPaletteSky)) :[]
  | otherwise                = last rgbPaletteSky : []

-- Define qual será a cor do sol dentre as possibilidades de acordo com o horario
defineSunColor :: Int -> [(Int,Int,Int)]
defineSunColor hora 
  | hora >= 7 && hora < 12   = head rgbPaletteSun : []
  | hora >= 12 && hora <= 15 = head (tail rgbPaletteSun) :[]
  | hora > 15 && hora <= 18  = last rgbPaletteSun : []
  | otherwise                = rgbPaletteMoon