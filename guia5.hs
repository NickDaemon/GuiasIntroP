--EJERCICIO 1 (PRIMEROS CONCEPTOS DE RECURSION)
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
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:xs) |x == head xs = todosIguales xs
                    |otherwise = False   

--3)Implementar todosDistintos que es el reverso de todosIguales

todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [x] = True
todosDistintos (x:xs) |x /= ultimo (x:xs) = todosDistintos (principio (x:xs))
                      |otherwise = False    

todosDistintos2 :: (Eq t) => [t] -> Bool
todosDistintos2 [x] = True
todosDistintos2 (x:xs) |pertenece x xs = False
                       |otherwise = todosDistintos2 xs 

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

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos n [] = []
quitarTodos n (x:xs) |pertenece n (x:xs) == False = (x:xs)
                     |n /= x = x : quitarTodos n xs
                     |n == x = quitarTodos n xs

--7)Implementar eliminarRepetidos que solo deja una unica aparicion de cada elem de una lista

elimRepes :: (Eq t) => [t] -> [t]
elimRepes [] = []
elimRepes (x:xs) |pertenece x xs = x : quitarTodos x (elimRepes xs)
                 |otherwise = x : elimRepes xs

--8)Implementar mismosElementos que devuelve true si ambas listas contienen los mismos elem
--sin contar repeticiones

gotchu :: (Eq t) => [t] -> [t] -> Bool
gotchu [] (y:ys) = True
gotchu (x:xs) (y:ys)  |pertenece x (elimRepes (y:ys)) = gotchu xs (y:ys)
                      |otherwise = False 

mismosElementos :: (Eq t) => [t] -> [t] -> Bool     
mismosElementos (x:xs) (y:ys) |gotchu (x:xs) (y:ys) && gotchu (y:ys) (x:xs) = True
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
maximus (x:xs) |x >= ultimo (x:xs) = maximus (principio (x:xs))
               |otherwise = maximus xs

--4)Sumar N 

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x + n]
sumarN n (x:xs) = x + n : sumarN n xs

--5)sumar el primero

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarAux (x:xs) (x:xs)

sumarAux :: [Integer] -> [Integer] -> [Integer]
sumarAux (x:xs) [] = []
sumarAux (x:xs) (y:ys) = x + y : sumarAux (x:xs) ys

--6)sumar el ultimo

sumarElUltimo:: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarAux2 (x:xs) (x:xs)

sumarAux2 :: [Integer] -> [Integer] -> [Integer]
sumarAux2 (x:xs) [] = []
sumarAux2 (x:xs) (y:ys) = ultimo (x:xs) + y : sumarAux2 (x:xs) ys

--7)Pares , solo devuelve la lista con elementos pares contando repes.
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) |mod x 2 == 0 = x : pares xs
             |otherwise = pares xs

--8)idem que pares pero con multiplos de un n
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) |mod x n == 0 = x : multiplosDeN n xs
                      |otherwise = multiplosDeN n xs    

--9)ordenar en forma creciente la lista.
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = mini (x:xs) : ordenar (sortearRepe (x:xs))

--Aca ayuda a la recursion a ordenar los que sean iguales
sortearRepe :: [Integer] -> [Integer]
sortearRepe (x:xs) = quitar (mini (x:xs)) (x:xs)

--Aca defino el primer elemento de la lista
mini :: [Integer] -> Integer 
mini [x] = x 
mini (x:xs) |x <= ultimo (x:xs) = mini (principio (x:xs))
            |otherwise = mini xs



--EJERCICIO 4 (LISTAS DE CHAR)
--1)sacarBlancosRepetidos deja solo un espacio blanco entre palabras

--Arreglo que no inicie ni termine con blancos
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos (x:xs) |head (sacarAux (x:xs)) == ' ' && ultimo (sacarAux (x:xs)) == ' ' = quitar x (principio (sacarAux (x:xs)))
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
contarPalabras (x:xs) |x == ' ' = contarAux (x:xs)
                      |otherwise = contarAux1 (x:xs)
--Cuenta las palabras sino inicia con blanco
contarAux1 :: [Char] -> Integer
contarAux1 [] = 1
contarAux1 (x:xs)|x == ' ' = 1 + contarAux1 (sacarBlancosRepetidos xs)
                 |otherwise = contarAux1 xs

--Cuenta las palabras si inicia con un blanco
contarAux :: [Char] -> Integer
contarAux [] = 1
contarAux (x:xs) = contarAux1 (x:xs) - 1


                            







                       
                                                 


