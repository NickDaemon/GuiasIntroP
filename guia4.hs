-- 1)Implementar la sucesion de fibbonacci.
fib :: Integer -> Integer 
fib n |n == 0 = 0
      |n == 1 = 1
      |otherwise = fib (n-1) + fib (n-2)

--2)Implementar la funcion Parte entera que de un float solo se queda la parte entera.

parteEntera :: Float -> Integer
parteEntera n |n < 1 = 0
              |otherwise = parteEntera (n-1) + 1

--3)Implementar la funcion esDivisible que dados dos n´umeros naturales determinar si el primero
--es divisible por el segundo.

esDivisible :: Integer -> Integer -> Bool
esDivisible n m |(n-m)==0 = True
                |(n-m) < 0 = False
                |otherwise = esDivisible (n-m) m    

--4)Implementar la funci´on sumaImpares que dado un n suma los primeros n impares

impares :: Integer -> Integer
impares n = 2*n - 1

sumaImpares :: Integer -> Integer
sumaImpares n |n == 1 = 1
              |otherwise = impares n + sumaImpares (n-1)

--5)Implementar la funci´on medioFact que dado un n calcula n!!

medioFact :: Integer -> Integer
medioFact n |n == 0 = 1
            |n == 1 = 1
            |otherwise = n*medioFact (n-2)

--6)Implementar la funci´on sumaDigitos que calcula la suma de d´ıgitos de un n´umero
--natural.     

sumaDigitos :: Integer -> Integer
sumaDigitos n |div n 10 == 0 = n
              |otherwise = mod n 10 + sumaDigitos (div n 10)

--7)Implementar la funci´on todosDigitosIguales que determina si todos los digitos de un numero son iguales

primerDigito :: Integer -> Integer
primerDigito n |div n 10 == 0 = n
               |otherwise = primerDigito (div n 10)

todosDiguales :: Integer -> Bool
todosDiguales n |div n 10 == 0 = True
                |mod n 10 == primerDigito n = todosDiguales (div n 10)
                |otherwise = False

--8)Implementar la funci´on iesimoDigito que dado un n0 y un m devuelve la pocision m de n.

cantD :: Integer -> Integer
cantD n |div n 10 == 0 = 1
        |otherwise = 1 + cantD (div n 10)

iesimoD :: Integer -> Integer -> Integer
iesimoD n m = mod (div n (10^((cantD n)-m))) 10      

--9)Implementar la funcion esCapicua que determina si un numero n es capicua.

--a completar T-T

--10)a)

f1 :: Integer -> Integer
f1 n |n==0 = 1
     |otherwise = 2^n + f1 (n-1)

--b)
f2 :: Integer -> Integer -> Integer
f2 n m |n==1=m
       |otherwise = m^n + f2 (n-1) m

--c)
f3 :: Integer -> Integer -> Integer
f3 n q = f2 (2*n) q

--d)
f4 :: Integer -> Float -> Float
f4 n q = f4Aux (2*n) n q

f4Aux :: Integer -> Integer -> Float -> Float
f4Aux n i q | i == n = q^n
            | otherwise = q^n + f4Aux (n-1) i q


--11)a)Implementar una funci´on eAprox que aproxima el valor de e.

fact :: Float -> Float
fact n |n == 0 = 1
       |n == 1 = 1
       |otherwise = n*fact (n-1)


eAprox :: Float -> Float
eAprox n |n==0=1
         |otherwise= (1 / fact n) + eAprox (n-1)

--12)Raiz de 2 aprox

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = (sucesionA2 n) - 1.0

sucesionA2 :: Integer -> Float
sucesionA2 n | n <= 1 = 2.0
             | otherwise = 2.0 + (1.0 / sucesionA2 (n-1))


            





