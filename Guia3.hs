f:: Int -> Int
f x | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16

g:: Int -> Int
g x | x == 8 = 16
    | x == 16 = 4
    | x == 131 = 1

h:: Int -> Int
h x = f (g x)

max3:: Int -> Int -> Int -> Int 
max3 x y z |x > y && x>z = x
            |y > x && y>z = y
            |z > x && z>y = z

alges0:: Float -> Float -> Bool
alges0 x y | x == 0 || y == 0 = True
            | otherwise = False

suma :: Int -> Int -> Int -> Int
suma x y z |(div x y) == 1 = x+z
            |(div x z) == 1 = x+y
            |(div y z) == 1 = y+x
            |otherwise = x+y+z 
--Ej 3
ej3 :: Int -> Int -> Bool
ej3 x y | (mod x y)== 0 = True
        | otherwise = False 

multi :: Int-> Int-> Bool
multi x y | (mod x y)==0 = True
          | otherwise = False

--Ej 4

prodInt :: (Int,Int) -> (Int,Int) -> Int
prodInt (a,b) (c,d) = (a*b + c*d)

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (a,b)(c,d) = sqrt ((a-c)*(a-c) + (b-d)*(b-d))

sumaTerna :: (Int,Int,Int) -> Int
sumaTerna (a,b,c) = a+b+c

siEsMultiplo :: Int ->Int -> Int
siEsMultiplo x y | mod x y == 0 = x
                 | otherwise = 0

sumarSoloLosMultiplos :: (Int,Int,Int) -> Int -> Int
sumarSoloLosMultiplos (a,b,c) d = siEsMultiplo a d + siEsMultiplo b d + siEsMultiplo c d

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (x,y,z) | esPar x = 1
             | esPar y = 2
             | esPar z = 3
             |otherwise = 4

crearPar :: t -> t -> (t,t)
crearPar a b = (a,b)



--Ej 5

esPar :: Int -> Bool
esPar x = mod x 2 == 0 

f5 :: Int -> Int
f5 x | x <= 7 = (x * x)
     |x > 7 = (2*x - 1)

g5 :: Int -> Int 
g5 y | esPar y = (div y 2)
     | otherwise = (3*y + 1)

todosMenores :: (Int,Int,Int) -> Bool
todosMenores (x,y,z) |(f5 x > g5 x) && (f5 y > g5 y) && (f5 z > g5 z) = True
                   | otherwise = False

-- Ej 6
bisiesto :: Int -> Bool
bisiesto x | not(mod x 4 == 0) || ((mod x 100 == 0)&& not(mod x 400 == 0)) = False
           | otherwise = True

-- Ej 7
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) -> Float
distanciaManhattan  (a,b,c) (d,e,f) = sqrt((d-a)*(d-a)) + sqrt((e-b)*(e-b)) + sqrt((f-c)*(f-c))

--Ej 8
sumaUltimos2digitos :: Int -> Int
sumaUltimos2digitos x = (mod x 10) + (mod (div x 10) 10)

comparar :: (Int,Int) -> Int
comparar (x,y) | sumaUltimos2digitos x < sumaUltimos2digitos y = 1
               | sumaUltimos2digitos x > sumaUltimos2digitos y = -1
               | sumaUltimos2digitos x == sumaUltimos2digitos y = 0
