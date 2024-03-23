-- Ej 1
fibonacci :: Int -> Int
fibonacci x | x == 0 = 0
            | x == 1 = 1
            | x >1 = (fibonacci(x-1) + fibonacci (x-2))

-- Ej 2
parteEntera :: Float -> Int
parteEntera x | x<0 && x > (-1) = 0
              | x >= 0 && x< 1 = 0
              | x>= 1 = 1 + parteEntera(x-1)
              | otherwise = (-1) + parteEntera (x+1)

-- Ej 3
esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True
                | x < y = False
                |otherwise = esDivisible (x-y) y

-- Ej 4
sumaImpares :: Int -> Int
sumaImpares n | n <= 0 = 0
              | n == 1 = 1
              |otherwise = sumaImpares(n -1)+ 2*n-1

-- Ej 5

medioFact :: Int -> Int
medioFact n | n <= 0 = 1
            | otherwise = n * medioFact(n-2)

-- Ej 6
sumaDigitos :: Int -> Int
sumaDigitos n | n == 0 = 0
              | otherwise = sumaDigitos(div n 10) + mod n 10 

-- Ej 7
todosDigitosIguales :: Int -> Bool
todosDigitosIguales n | n < 10 = True
                      |n > 10 =  digitosIguales (mod n 10) (div n 10)
                        
digitosIguales :: Int -> Int -> Bool
digitosIguales n m | m<10 = n == m
                   | otherwise = (n == mod m 10) && digitosIguales n (div m 10)

-- Ej 8

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = (mod(div n x)10)
    where x = 10 ^((cantDigitos n)-i)


cantDigitos :: Int -> Int
cantDigitos x | div x 10 == 0 = 1
              | otherwise = 1 + cantDigitos(div x 10)

-- Ej 9
esCapicua :: Int -> Bool
esCapicua x = x == invertir x

invertir :: Int -> Int
invertir x | x < 10 = x
           | otherwise = mod x 10 * 10 ^(( cantDigitos x )-1) + invertir (div x 10)

-- Ej 10
--a

f1 :: Int -> Int
f1 x | x <= 0 = 2^x
     |otherwise = 2^x + f1(x-1)

--b

f2 :: Int -> Int -> Int
f2 x y | x <= 1 = y^x
       | otherwise = y^x + f2 (x-1) y

-- Ej 11
--a
eAprox :: Int ->Float
eAprox x | x == 0 = 1
         | otherwise = 1 / fromIntegral (factorial x) + eAprox(x-1)

factorial :: Int -> Int
factorial x | x<= 0 = 1
            | otherwise = x * factorial(x-1)
--b
e :: Float
e = eAprox 10

-- Ej 12
raiz2Aprox :: Int -> Float
raiz2Aprox n = (sucesion2 n) -1

sucesion2 :: Int -> Float
sucesion2 n | n<=1 = 2
            | otherwise = 2 +(1/sucesion2 (n - 1))

-- Ej 13
sumaInterna :: Int -> Int -> Int
sumaInterna _ 0 = 0
sumaInterna n m = n^m + sumaInterna n (m -1)

sumaDoble :: Int -> Int -> Int
sumaDoble 0 m = m
sumaDoble n m = (sumaInterna n m) + sumaDoble (n-1) m

-- ?????????

-- Ej 14

sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q n m | n == 0 = 0
                    | otherwise = sumaPotenciasAux q n m + sumaPotenciasAux q (n-1) m

sumaPotenciasAux :: Int -> Int -> Int -> Int
sumaPotenciasAux q n m | m == 0 = 0
                       | otherwise = q^(n+m) + sumaPotenciasAux q n (m-1)

-- Ej 16
--a
menorDivisor :: Int -> Int
menorDivisor n | n == 1 = 1
               | otherwise = encontrarDiv n 2

encontrarDiv :: Int -> Int->Int
encontrarDiv n q | mod n q == 0 = q
                 | otherwise = encontrarDiv n (q+1)
--b
esPrimo :: Int -> Bool
esPrimo n | n == 1 = False
          | menorDivisor n == n = True
          |otherwise = False

--c
sonCoprimos :: Int -> Int -> Bool
sonCoprimos n q | n == 1 = True
                | q == 1 = True
                | esPrimo n && esPrimo q = True
                | (mod n q == 0 )|| (mod q n == 0) = False
                | n > q = sonCoprimos n (q-1)
                | q > n = sonCoprimos (n-1) q

--Ej 17
esFibonacci :: Int -> Bool
esFibonacci n = esFibonacciAux n 0

esFibonacciAux :: Int -> Int -> Bool
esFibonacciAux n i | n == fibonacci i = True
                   | fibonacci i > n = False
                   | otherwise = esFibonacciAux n (i+1)

--Ej 18
mayorDigitoPar :: Int -> Int
mayorDigitoPar n | n == 0 = -1
                 |n < 10 && even n = n
                 | (mod n 10 == 0 )|| mod(mod n 10 ) 2 /= 0 = mayorDigitoPar (div n 10)
                 |otherwise = max (mod n 10) (mayorDigitoPar (div n 10)) 
                 

-- Ej 19
esSumaInicialDePrimos :: Int ->Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 2

esSumaInicialDePrimosAux :: Int -> Int -> Bool
esSumaInicialDePrimosAux p q | p == sumaPrimosHasta 2 q = True
                             | p < sumaPrimosHasta 2 q = False
                             | otherwise = esSumaInicialDePrimosAux p (q+1)

sumaPrimosHasta :: Int -> Int -> Int
sumaPrimosHasta m n  | esPrimo n && n == m = m
                     | n == m = 0
                     | esPrimo m = m + sumaPrimosHasta (m + 1) n
                     | otherwise = sumaPrimosHasta (m+1) n