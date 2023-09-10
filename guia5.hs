--Funciones basicas para practicar listas
longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs



--EJERCICIO 1
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

--EJERCICIO 2
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

                              
                                                 


