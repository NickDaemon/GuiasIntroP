-- 1.a:Implentar la funcion parcial f definida de la siguiente manera:
fa(1) = 8
fa(4) = 131
fa(16) = 16

f :: Integer -> Integer
f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16

-- 1.b:Implementar la funcion parcial g definida como:
gb(8) = 16
gb(16) = 4
gb(131) = 1

g :: Integer -> Integer
g n | n==8=16
    | n==16=4
    | n==131=1


-- 1.c :A partir de las funciones definidas en los ´ıtems 1 y 2, implementar las funciones parciales h = f ◦ g y k = g ◦ f

h :: Integer -> Integer
h n = f (g n)

j :: Integer -> Integer
j n = g (f n)

-- Especificar e implementar las siguientes funciones, incluyendo su signatura
-- a = absoluto: calcula el valor absoluto de un n´umero entero.

absolut :: Float -> Float
absolut n | n < 0 = (-1)*n
          |otherwise = n

-- b = maximoabsoluto: devuelve el m´aximo entre el valor absoluto de dos n´umeros enteros.

maximoabsoluto :: Float -> Float -> Float
maximoabsoluto n p |absolut n <= absolut p = absolut p
                   |otherwise = absolut n

-- c = maximo3: devuelve el m´aximo entre tres n´umeros enteros.

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n p q = max n (max p q)

-- d = algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0

algunoEs0 :: Float -> Float -> Bool
algunoEs0 n m |n==0 || m==0 = True
              |otherwise = False

-- e = ambosSon0:dados dos n´umeros racionales, decide si ambos son iguales a 0 

ambosSon0 :: Float -> Float -> Bool
ambosSon0 n m |n==0 && m==0 = True
              |otherwise = False

-- f = mismoIntervalo: dados dos n´umeros reales, indica si est´an relacionados considerando la relaci´on de equivalencia en R
-- cuyas clases de equivalencia son: (−∞, 3],(3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo.    

mismoIntervalo :: Integer -> Integer -> Bool
mismoIntervalo n m |n <= 3 && m <= 3 = True
                   |n <= 7 && n > 3 && m <= 7 && m > 3 = True
                   |n > 7 && m > 7 = True
                   |otherwise = False

-- g = sumaDistintos: que dados tres n´umeros enteros calcule la suma sin sumar repetidos (si los hubiera).

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n m p |n/=m && m/=p && n/=p = n + m + p
                    |n/=m && n==p = n + m
                    |n==m && m/=p = n + p
                    |n==m && m==p = 0
                    |n/=m && m==p = n + m

-- h = esMultiploDe: dados dos n´umeros naturales, decidir si el primero es m´ultiplo del segundo. 

esMultiploDe :: Int -> Int -> Bool
esMultiploDe n m |mod n m == 0 = True
                 |otherwise = False

-- i = digitoUnidades: dado un n´umero natural, extrae su d´ıgito de las unidades
i :: Integer -> Integer
i n = mod n 10

-- j = digitoDecenas: dado un n´umero natural, extrae su d´ıgito de las decenas.
js :: Integer -> Integer
js n = mod (div n 10) 10

-- 3) Estan relacionados

estanRela :: Integer -> Integer -> Bool
estanRela n m |mod (n*n) (n*m) == 0 = True
              |otherwise = False 


-- 4) a) prodInt: calcula el producto interno entre dos tuplas R × R.

prodInt :: (Float,Float) -> (Float,Float) -> Float
prodInt (n,m) (p,q) = (n*p) + (m*q)

--b)todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada
--correspondiente de la segunda tupla.

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (n,m) (p,q) |n<p && m<q = True
                      |otherwise = False


--c)distanciaPuntos: calcula la distancia entre dos puntos de R

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (n,m) (p,q) = sqrt ((p - n)^2 + (q - m)^2)   

--d)sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
sumaTerna :: (Int,Int,Int) -> Int
sumaTerna (n,m,p) = n + m + p

--e)sumarSoloMultiplos: dada una terna de n´umeros enteros y un natural, calcula la suma de los elementos de la terna que
--son m´ultiplos del n´umero natural

esM :: Integer -> Integer -> Integer
esM n m |mod n m == 0 = n
        |otherwise = 0

sumaMult :: (Integer,Integer,Integer) -> Integer -> Integer
sumaMult (n,m,p) q = (esM n q) + (esM m q) + (esM p q)



--f)posPrimerPar: dada una terna de enteros, devuelve la posici´on del primer n´umero par si es que hay alguno, y devuelve
--4 si son todos impares.  

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (n,m,p) |mod n 2 == 0 = 0
                     |mod n 2 /= 0 && mod m 2 == 0 = 1
                     |mod n 2 /= 0 && mod m 2 /= 0 && mod p 2 == 0 = 2
                     |otherwise = 4

--g)crearPar:crea un par a partir de sus dos componentes dadas por separado (debe funcionar para
--elementos de cualquier tipo).   

crearPar :: a ->b ->(a, b)
crearPar n m = (n,m)

--invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como par´ametro (debe funcionar para elementos
--de cualquier tipo).

invertir :: (a, b) ->(b, a)
invertir (n,m) = (m,n)

--5)
f2 :: Integer -> Integer
f2 n |n<=7 = n*n
     |otherwise = 2*n - 1

g2 :: Integer -> Integer
g2 n |mod n 2 == 0 = div n 2
     |otherwise = 3*n + 1

todosMenores :: (Integer,Integer,Integer) -> Bool
todosMenores (n,m,p) |(f2 n > g2 n) && (f2 m > g2 m) && (f2 p > g2 p) = True
                     |otherwise = False
--6) Bisiesto

bisiesto :: Integer -> Bool
bisiesto n |mod n 4 /= 0 || mod n 100 == 0 && mod n 400 /= 0 = False
           |otherwise = True


--7) distanciaManhatan

dM :: (Float,Float,Float) -> (Float,Float,Float) -> Float
dM (n,m,p) (r,s,t) = absolut ((n-r) + (m-s) + (p-t))

--8)

suma2 :: Integer -> Integer
suma2 n = (mod n 10) + mod (div n 10) 10

comparar :: Integer ->Integer ->Integer
comparar n m  |suma2 n < suma2 m = 1
              |suma2 n > suma2 m = -1
              |otherwise = 0

--9)a)
f1s :: Float -> Float
f1s n | n == 0 = 1
      | otherwise = 0

-- cuando a f1s le doy como valor 0 me devuelve 1 , cualquier otro valor devolvera 0
--problema :(x:R) :R
--requiere ::true
--asegura  ::res = 1 sii x = 0 otherwise res = 0

--b)
f2s:: Float -> Float
f2s n | n == 1 = 15
      | n == -1 = -15

--cuando a f2s le doy como entrada 1 me devuelve 15 y -15 si le doy como entrada -1

--f2s :(x:r) : R
--requiere :: x = 1 || x=-1
--asegura  :: res = 15 sii x = 1
--asegura  :: res = -15 sii x = -1

--c)
f3s :: Float -> Float
f3s n | n <= 9 = 7
      | n >= 3 = 5

--cuando a f3s le doy un x menor que 3 me devuelve 7 y si le doy un x mayor a 9 me devuelve 5
--x no puede estar en {3,9} 

--f3s :(x:R) : R
--requiere :: x < 3 || x > 9
--asegura  :: res = 7 sii x < 3 otherwise = 5





              
                            






                    




           






