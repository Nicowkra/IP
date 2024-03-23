import Data.Bits (Bits(xor))
--Ej 1.1


longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

-- Ej 1.2
ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo (xs)

-- Ej 1.3
principio :: [t] -> [t]
principio (x:xs) | longitud(x:xs)==1 = []
                 | otherwise = x : principio(xs)

-- Ej 1.4
reverso :: (Eq t) => [t] -> [t]
reverso (x:xs) | xs == [] = [x] 
               | otherwise = reverso xs ++ [x]

-- Ej 2.1 
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l | longitud l == 0 = False
              | e == head l = True
              | otherwise = pertenece e (tail l)

-- Ej 2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:xs) | longitud xs == 0 = True
                    | x /= head(xs) = False
                    | otherwise = todosIguales(xs)

-- Ej 2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos(x:xs) | xs == [] = True
                     | pertenece x xs = False
                     | otherwise = todosDistintos xs

-- Ej 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos x | todosDistintos x == True = False
               | otherwise = True

-- Ej 2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar t (x:xs) |t == x = xs
                |otherwise = x : quitar t xs

-- Ej 2.6
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos t (x:xs) | t == x = quitarTodos t xs
                     | otherwise = x : quitarTodos t xs

-- Ej 2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | xs == [] = []
                         | pertenece x xs = [x] ++ quitarTodos x (eliminarRepetidos xs)
                         | otherwise = [x] ++ eliminarRepetidos xs

-- Ej 2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos (x:xs) (y:ys) | xs == [] && ys == [] = True
                              | pertenece x (y:ys) && pertenece y (x:xs) = mismosElementos xs ys
                              |otherwise = False

-- Ej 2.9

capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) | longitud xs == 1 = True
               | x /= ultimo xs = False
               | otherwise = capicua (tail (reverso xs))

-- Ej 3.1
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- Ej 3.2
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- Ej 3.3
maximo :: [Integer] -> Integer
maximo (x:xs) | xs == [] = x
              | x >= (head xs) = maximo (x: (tail xs))
              | otherwise = maximo xs

-- Ej 3.4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n (x:xs) | xs == [] = [x+n]
                |otherwise = (x+n):sumarN n xs

-- Ej 3.5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero l | l == [] = []
                 |otherwise = sumarN (head l) l

-- Ej 3.6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo l | l == [] = []
                | otherwise = sumarN (last l )l

-- Ej 3.7
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | even x = x:(pares xs)
             | otherwise = pares xs

-- Ej 3.8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      |otherwise = multiplosDeN n xs

-- Ej 3.9
ordenar :: [Integer] -> [Integer] 
ordenar [] = []
ordenar t = (minimo t) : ordenar (quitar (minimo t) t)

minimo :: [Integer] -> Integer
minimo (x:xs) | xs == [] = x
              | x <= (head xs) = minimo (x: (tail xs))
              | otherwise = minimo xs

-- Ej 4.1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = [x]
sacarBlancosRepetidos (x:xs) | (x ==' ') && (head xs == ' ') = sacarBlancosRepetidos xs
                             | otherwise = x : sacarBlancosRepetidos xs

-- Ej 4.2
contarPalabras :: [Char] -> Int
contarPalabras l = contarPalabrasAux (empiezaBlanco (sacarBlancosRepetidos l))

empiezaBlanco :: [Char] -> [Char]
empiezaBlanco l | head l == ' ' = tail l
                | otherwise = l

contarPalabrasAux :: [Char] -> Int
contarPalabrasAux [] = 0
contarPalabrasAux [x] = 1
contarPalabrasAux (x:xs) | x == ' ' = 1 + contarPalabrasAux xs
                      | otherwise = contarPalabrasAux xs

-- Ej 4.3
palabras :: [Char] -> [[Char]]
palabras x = extraerPalabras x []

extraerPalabras:: [Char] -> [Char] -> [[Char]]
extraerPalabras [] [] = []
extraerPalabras [] l = [l]
extraerPalabras (x:xs) [] | esEspacio x = extraerPalabras xs []
extraerPalabras (x:xs) l | esEspacio x = l : extraerPalabras xs []
                         |otherwise = extraerPalabras xs (l ++ [x]) 

esEspacio :: Char -> Bool
esEspacio x = x == ' '

--Ej 4.5
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

--Ej 4.6
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) | xs == [] = x
                         | otherwise = x ++ [' '] ++ aplanar xs

-- Ej 4.7
aplanarConNBlancos :: [[Char]] -> Int -> [Char]
aplanarConNBlancos [] n = []
aplanarConNBlancos (x:xs) n |xs == [] = x
                            |otherwise = x ++ generaNBlancos n ++ aplanarConNBlancos xs n

generaNBlancos :: Int -> [Char]
generaNBlancos 0 = []
generaNBlancos n = ' ' : generaNBlancos (n-1)

-- Ej 5.1

sumaAcumulada :: (Num t) => [t] -> [t] 
sumaAcumulada [] = []
sumaAcumulada l = sumaAcumuladaAux 0 l

sumaAcumuladaAux:: (Num t) => t -> [t] -> [t]
sumaAcumuladaAux _ [] = []
sumaAcumuladaAux n (x:xs) = (n+x) : sumaAcumuladaAux (n+x) xs 

-- Ej 5.2
