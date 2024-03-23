-- Ej 1
relacionesValidas:: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((l,m):xs) | xs == [] = True
                             | componentesIguales (l,m) == True = False
                             |tuplasRepetidas (l,m) xs == True = False
                             |otherwise = relacionesValidas xs
                            


tuplasRepetidas :: (String,String) -> [(String,String)] -> Bool
tuplasRepetidas x [] = False
tuplasRepetidas (l,m) ((x,y):xs)   
                           | (l,m) == (x,y) = True
                           | (l,m) == (y,x) = True
                           | otherwise = tuplasRepetidas (l,m) xs


componentesIguales :: (String,String) -> Bool
componentesIguales (x,y) | x == y = True
                         |otherwise = False

-- Ej 2
personas :: [(String,String)] -> [String]
personas [] = []
personas ((l,m):xs) 
                    |tuplasRepetidas (l,m) xs = personas xs
                    | otherwise = [l,m] ++ personas (xs)

-- Ej 3
amigosDe :: String -> [(String,String)] -> [String]
amigosDe n [] = []
amigosDe n ((l,m):xs) 
                      | n == l = [m] ++ amigosDe n xs
                      | n == m = [l] ++ amigosDe n xs
                      | otherwise = amigosDe n xs

-- Ej 4
personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos [] = "Ninguno"
personaConMasAmigos ((l,m):xs) | xs == [] = personaConMasAmigosAux ((l,m):xs)
                               | personaConMasAmigosAux ((l,m):xs) > personaConMasAmigosAux xs = personaConMasAmigos ((l,m):tail xs)
                               | personaConMasAmigosAux ((l,m):xs) <= personaConMasAmigosAux xs = personaConMasAmigos  xs

personaConMasAmigosAux :: [(String,String)] -> String
personaConMasAmigosAux [] = []
personaConMasAmigosAux ((l,m):xs) | longitud (amigosDe l ((l,m):xs)) >= longitud (amigosDe m ((l,m):xs)) = l
                                  |longitud (amigosDe l ((l,m):xs)) < longitud (amigosDe m ((l,m):xs)) = m

longitud :: [String] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud(xs)