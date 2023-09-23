--EJERCICIO 1 (PRIMEROS CONCEPTOS DE RECURSION EN LISTAS)
--1)Problema Ultimo devuelve el ultimo elemento de una lista

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

--2)Principio devuelve la misma lista sin el ultimo elemento
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio (xs)

--3)Reverso devuelve la misma lista orden invertido
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = ultimo (x:xs) : reverso (principio (x:xs))

--EJERCICIO 2 (LISTAS GENERAL)
--1)Implementar pertenece que indica si un elemento pertenece a la lista
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece n [] = False
pertenece n (x:xs) |x == n = True
                   |otherwise = pertenece n xs

--2)Implementar todosIguales que indica si todos los elementos de una lista son iguales
todosIguales ::(Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)  

--3)Implementar todosDistintos que es el reverso de todosIguales

todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [x] = True
todosDistintos (x:xs) |x /= ultimo (x:xs) = todosDistintos (principio (x:xs))
                      |otherwise = False    

todosDistintos2 :: (Eq t) => [t] -> Bool
todosDistintos2 [x] = True
todosDistintos2 (x:xs) = not (pertenece x xs) && todosDistintos2 xs 

--4)Implementar hayRepetidos que dice si hay elementos repetidos en una lista
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [x] = False
hayRepetidos (x:xs) |pertenece x xs = True
                    |otherwise = hayRepetidos xs  

--5)implementar quitar que quita la primera aparicion de un elemento en una lista

quitar :: (Eq t) => t -> [t] -> [t] 
quitar n [x] = []
quitar n (x:xs) |pertenece n (x:xs) == False = (x:xs)
                |n /= x = x : quitar n xs
                |n == x = xs
                

--6)Implementar quitarTodos que quita todos los elementos n de una lista si los tuviese

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos n [] = []
quitarTodos n (x:xs)
    |n == x = quitarTodos n xs
    |n /= x = x : quitarTodos n xs

--7)Implementar eliminarRepetidos que solo deja una unica aparicion de cada elem de una lista

elimRepes :: (Eq t) => [t] -> [t]
elimRepes [] = []
elimRepes (x:xs) |pertenece x xs = x : quitarTodos x (elimRepes xs)
                 |otherwise = x : elimRepes xs

--8)Implementar mismosElementos que devuelve true si ambas listas contienen los mismos elem
--sin contar repeticiones
mismosElementos :: (Eq t) => [t] -> [t] -> Bool     
mismosElementos (x:xs) (y:ys) |gotchu (x:xs) (y:ys) && gotchu (y:ys) (x:xs) = True
                              |otherwise = False 
                              
gotchu :: (Eq t) => [t] -> [t] -> Bool
gotchu [] (y:ys) = True
gotchu (x:xs) (y:ys)  |pertenece x (elimRepes (y:ys)) = gotchu xs (y:ys)
                      |otherwise = False 

                                          

--9)esCapicua

capicua ::(Eq t) => [t] -> Bool
capicua [x] = True
capicua [] = True
capicua (x:xs) |x  == ultimo (x:xs) = capicua (principio xs)  
               |otherwise = False  

--EJERCICIO 3 (LISTAS DE ENTEROS) 
--1)Sumatoria
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--2)Productoria

productoria :: [Integer] -> Integer 
productoria [x] = x
productoria (x:xs) = x * productoria xs

--3)Maximo
maximus :: [Integer] -> Integer   
maximus [x] = x
maximus (x:y:xs) 
    |x >= y = maximus (x:xs)
    |otherwise = maximus (y:xs)

--4)Sumar N 

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x + n]
sumarN n (x:xs) = x + n : sumarN n xs

--5)sumar el primero

sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero (x:xs) = sumarN x (x:xs)

--6)sumar el ultimo

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

--7)Pares , solo devuelve la lista con elementos pares contando repes.
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) 
    |mod x 2 == 0 = x : pares xs
    |otherwise = pares xs

--8)idem que pares pero con multiplos de un n
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) 
    |mod x n == 0 = x : multiplosDeN n xs
                      |otherwise = multiplosDeN n xs    

--9)ordenar en forma creciente la lista.
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = mini (x:xs) : ordenar (quitar (mini (x:xs)) (x:xs))

--Aca defino el primer elemento de la lista
mini :: [Integer] -> Integer 
mini [x] = x 
mini (x:xs) |x <= ultimo (x:xs) = mini (principio (x:xs))
            |otherwise = mini xs



--EJERCICIO 4 (LISTAS DE CHAR)
--1)sacarBlancosRepetidos deja solo un espacio blanco entre palabras

--Arreglo que no inicie ni termine con blancos
sacarBRepes :: [Char] -> [Char]
sacarBRepes (x:xs) |head (sacarAux (x:xs)) == ' ' && ultimo (sacarAux (x:xs)) == ' ' = quitar x (principio (sacarAux (x:xs)))
                   |head (sacarAux (x:xs)) == ' ' && ultimo (sacarAux (x:xs)) /= ' ' = sacarAux xs
                   |head (sacarAux (x:xs)) /= ' ' && ultimo (sacarAux (x:xs)) == ' ' = principio (sacarAux (x:xs))
                   |otherwise = sacarAux (x:xs)
                             
--Aca devuelvo la lista con maximo 1 blanco , ya sea iniciando o terminando 
sacarAux :: [Char] -> [Char]
sacarAux [x] = [x]
sacarAux (x:xs) |x == ' ' && head xs == ' ' = sacarAux xs
                |x /= ' ' = x : sacarAux xs
                |otherwise = x : sacarAux xs

--2)contar Palabras
contarPalabras :: [Char] -> Integer
contarPalabras (x:xs) |x == ' ' = contarAux1 (x:xs)
                      |otherwise = contarAux (x:xs)

--Cuenta las palabras sino inicia con blanco
contarAux :: [Char] -> Integer
contarAux [] = 1
contarAux (x:xs)|x == ' ' = 1 + contarAux (sacarBRepes xs)
                |otherwise = contarAux xs

--Cuenta las palabras si inicia con un blanco
contarAux1 :: [Char] -> Integer
contarAux1 [] = 1
contarAux1 (x:xs) = contarAux (x:xs) - 1

--3)Dada una lista arma una nueva lista con las palabras de la lista original.

palabras :: [Char] -> [[Char]] 
palabras [] = []
palabras (x:xs) = listaP (sacarBRepes (x:xs)) : palabras (sacarLista (sacarBRepes (x:xs)))

--Me devuelve la primer palabra que se forma en cualquier lista
listaP :: [Char] -> [Char]
listaP [] = []
listaP (x:xs) |x /= ' ' = x : listaP xs
              |otherwise = []

--Saca la primer Palabra de la lista
sacarLista :: [Char] -> [Char]
sacarLista [] = []
sacarLista (x:xs) |x == ' ' = xs
                  |otherwise = sacarLista xs


--4)Devuelve la palabra mas larga de una lista

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga (x:xs) = maxCadena (palabras (x:xs)) (palabras (x:xs))

--Me devuelve de la cadena la palabra con mas caracteres
maxCadena :: [[Char]] -> [[Char]] -> [Char]
maxCadena (x:xs) [] = x 
maxCadena [] (y:ys) = y
maxCadena (x:xs) (y:ys) |length x >= length (head (y:ys)) = maxCadena (x:xs) ys
                        |otherwise = maxCadena xs (y:ys)

--5)A partir de una lista de palabras arma una lista de caracteres concatenandolas.

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

--6)Aplanar con blancos que inserta un blanco despues de cada lista concatenada

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs)|x /= [' '] = x ++ [' '] ++ aplanarConBlancos xs
                        |otherwise  = aplanarConBlancos xs

--7)aplanar con N blancos (n debe ser positivo)                        

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n |n == 0 = aplanar (x:xs)
                            |x /= [' '] = x ++ aplanarAux n ++ aplanarConNBlancos xs n
                            |otherwise = aplanarConNBlancos xs n

--Defino la cantidad de blancos que van a tener las palabras entre si
aplanarAux :: Integer -> [Char] 
aplanarAux n |n == 1 = [' ']
             |otherwise = [' '] ++ aplanarAux (n-1)  

--EJERCICIO 5 (LISTAS LISTAS Y MAS LISTAS)  
--1)Suma acumulada

--suma todos los elementos de una lista de num
sumaParcial :: (Num t) => [t] -> t
sumaParcial [] = 0
sumaParcial (x:xs) = x + sumaParcial xs

--va agregando las sumas acumuladas a una lista
sumaAux :: (Num t) => [t] -> [t]
sumaAux [] = []
sumaAux (x:xs) = sumaParcial (x:xs) : sumaAux (principio (x:xs))

--Arreglo el orden de la lista.
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada (x:xs) = reverso (sumaAux (x:xs))

--2)Dar una lista de listas con los numeros de la lista original descompuesta en primos

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = separoAux x : descomponerEnPrimos xs

--Arreglo crecientemente
separoAux :: Integer -> [Integer]
separoAux n = reverso (separoEnPrimos n n)

--Separo en una lista la descompocision de primos de cualquier numero
separoEnPrimos :: Integer -> Integer -> [Integer]
separoEnPrimos 1 _ = []
separoEnPrimos n m |mod n (nPrimo m) == 0 = nPrimo m : separoEnPrimos (div n (nPrimo m)) m
                   |otherwise = separoEnPrimos n (m-1)

 --Todas las funciones que necesite para clasificar primos @.@ (estan en guia4.hs)

nPrimo :: Integer -> Integer
nPrimo n |n==1=2
         |otherwise = siguientePrimo (nPrimo (n-1))

siguientePrimo :: Integer -> Integer
siguientePrimo n |esPrimo (n+1) = n + 1
                 |otherwise = siguientePrimo (n+1)

esPrimo :: Integer -> Bool
esPrimo n = encontrarDivisor n 2 == n

encontrarDivisor :: Integer -> Integer -> Integer
encontrarDivisor n k | mod n k == 0 = k
                     | k+1 > n = n
                     | otherwise = encontrarDivisor n (k+1)                             
                      
                 
                                   





                            







                       
                                                 


