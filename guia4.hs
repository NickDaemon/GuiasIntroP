import Test.HUnit    
--                             Recursion Sobre Enteros

-- 1)Implementar la sucesion de fibbonacci.
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

--2)Implementar la funcion Parte entera que de un float solo se queda la parte entera.

parteEntera :: Float -> Integer
parteEntera n |n < 1 = 0
              |otherwise = parteEntera (n-1) + 1

testSuiteParteEnt = test [
        "caso sin decimal" ~: (parteEntera 2) ~?= 2 ,
        "caso con decimal" ~: (parteEntera 2.2) ~?= 2 
        ]

correrTests = runTestTT testSuiteParteEnt


--3)Implementar la funcion esDivisible que dados dos n´umeros naturales determinar si el primero
--es divisible por el segundo.

esDivisible :: Integer -> Integer -> Bool
esDivisible n m |(n-m)==0 = True
                |(n-m) < 0 = False
                |otherwise = esDivisible (n-m) m 

testSuiteEsDivisible = test [
        "no es divisible" ~: (esDivisible 10 3) ~?= False,
        "es divisible"    ~: (esDivisible 10 5) ~?= True
        ]
correrTests3 = runTestTT testSuiteEsDivisible                           

--4)Implementar la funcion sumaImpares que dado un n suma los primeros n impares

sumaImpares :: Int -> Int
sumaImpares 1 = 1
sumaImpares n = 2*n - 1 + sumaImpares (n-1)

--5)Implementar la funci´on medioFact que dado un n calcula n!!

medioFact :: Integer -> Integer
medioFact n |n == 0 = 1
            |n == 1 = 1
            |otherwise = n*medioFact (n-2)

testSuiteMedioFactorial = test [
        "caso base 1" ~: (medioFact 0) ~?= 1,
        "caso base 2" ~: (medioFact 1) ~?= 1,
        "caso distinto" ~: (medioFact 2) ~?= 2
        ]

correrTests2 = runTestTT testSuiteMedioFactorial                   

--6)Implementar la funcion sumaDigitos que calcula la suma de d´ıgitos de un n´umero
--natural.     

sumaDigitos :: Integer -> Integer
sumaDigitos n |div n 10 == 0 = n
              |otherwise = mod n 10 + sumaDigitos (div n 10)

--7)Implementar la funcion todosDigitosIguales que determina si todos los digitos de un numero son iguales
digitosIguales :: Integer -> Bool
digitosIguales n 
    |n < 10 = True
    |mod n 10 == mod (div n 10) 10 = digitosIguales (div n 10)
    |otherwise = False

--8)Implementar la funcion iesimoDigito que dado un n0 y un m devuelve la pocision m de n.

cantD :: Integer -> Integer
cantD n |n < 10 = 1
        |otherwise = 1 + cantD (div n 10)

iesimoD :: Integer -> Integer -> Integer
iesimoD n m = mod (div n (10^((cantD n)-m))) 10    

--9)Implementar la funcion esCapicua que determina si un numero n es capicua.

capicua :: Integer -> Bool
capicua n = n == reversoA n

reversoA :: Integer -> Integer
reversoA n |mod n 10 == n = n
           |otherwise = (mod n 10) * 10^((cantD n) - 1) + reversoA (div n 10)

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


--11)a)Implementar una funcion eAprox que aproxima el valor de e.

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / (fromIntegral (fact n))) + eAprox (n-1)  

fact :: Integer -> Integer 
fact 0 = 1
fact n = n * fact (n-1)

--12)Raiz de 2 aprox

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = (sucesionA2 n) - 1.0

sucesionA2 :: Integer -> Float
sucesionA2 n | n <= 1 = 2.0
             | otherwise = 2.0 + (1.0 / sucesionA2 (n-1))


--13)Implementar doble sumatoria simple

fdoble :: Integer -> Integer -> Integer
fdoble n m |n==0=0
           |otherwise = fdoble (n-1) m + fdobleAux n m 

fdobleAux :: Integer -> Integer -> Integer
fdobleAux n m |m==0=0
              |otherwise = n^m + fdobleAux n (m-1)  

--14)Implementar sumapotencias doble

sumaPot :: Integer -> Integer -> Integer -> Integer
sumaPot n m p |n==0=0
              |otherwise = sumaPot (n-1) m p + sumaPotAux n m p

sumaPotAux :: Integer -> Integer -> Integer -> Integer
sumaPotAux n m p |m==0=0
                 |otherwise = p^(n + m) + sumaPotAux n (m-1) p 

--15)Especificar e implementar una funci´on sumaRacionales

sumaRac:: Integer ->Integer ->Float
sumaRac n m |n==0=0
            |otherwise = sumaRac (n-1) m + sumaRacAux n m

sumaRacAux :: Integer -> Integer -> Float
sumaRacAux n m |m==0=0
               |otherwise = fromIntegral n / fromIntegral m + sumaRacAux n (m-1)  

--16)a)Implementar menorDivisor que calcula el menor divisor > 1 de un n 

menorDivisor :: Integer -> Integer
menorDivisor n = encontrarDivisor n 2

encontrarDivisor :: Integer -> Integer -> Integer
encontrarDivisor n k | mod n k == 0 = k
                     | k+1 > n = n
                     | otherwise = encontrarDivisor n (k+1)           
                   
--b)Implementar la funcion esPrimo , que me dice si un n es primo

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n

--c)Implementar la funcion sonCoprimos
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m |mod n m == 0 || mod m n == 0 = False
                |mod n (mod n m) == 0 && mod n (mod m n) == 0 = False
                |otherwise = True

                 

--d)Implementar la funci´on nEsimoPrimo que me devuelve el n esimo primo
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n |n==1=2
              |otherwise = siguientePrimo (nEsimoPrimo (n-1))

siguientePrimo :: Integer -> Integer
siguientePrimo n |esPrimo (n+1) = n + 1
                 |otherwise = siguientePrimo (n+1)              

 --17)
esFib :: Integer -> Bool
esFib n |n==0=False
        |otherwise = esFibAux n n

esFibAux :: Integer -> Integer -> Bool
esFibAux n m |m==0=False
             |fib (m+1) == n = True
             |otherwise = esFibAux n (m-1)

--18)Implementar una funci´on mayorDigitoPar que me devuelve el digito par mas grande de n ,sino tiene devuelve -1

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = auxPar n n

auxPar :: Integer -> Integer -> Integer
auxPar n m |m==0= parImpar n
           |n==0= parImpar m
           |sacarPar (mod n 10) >= sacarPar (mod (div m 10) 10) = auxPar n (div m 10)
           |otherwise = auxPar (div n 10) m
           where parImpar n |mod n 2 == 0 = mod n 10
                            |otherwise = -1
                       
sacarPar :: Integer -> Integer
sacarPar n |mod n 2 == 0 = n
           |otherwise = 0

                      

--19)Implementar la funici´on esSumaInicialDePrimos 
esSumaP :: Integer -> Bool
esSumaP n  = sumaAux n n
           
sumaAux :: Integer -> Integer -> Bool
sumaAux n m |m==1=False
            |n==sumaPrimos m = True
            |otherwise = sumaAux n (m-1)

sumaPrimos :: Integer -> Integer
sumaPrimos n |n==0=0
             |otherwise = (nEsimoPrimo n) + sumaPrimos (n-1) 

--20)Especificar e implementar la funci´on tomaValorMax     

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivAux n n

sumaDivAux :: Integer -> Integer -> Integer
sumaDivAux n m |m == 0 = 0
               |mod n m == 0 = m + sumaDivAux n (m-1)
               |mod n m /= 0 = sumaDivAux n (m-1)

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n m |n==m=m
                 |m==0=n
                 |sumaDivisores n > sumaDivisores m = tomaValorMax n (m-1) 
                 |sumaDivisores n < sumaDivisores m = tomaValorMax (n+1) m   
                 |sumaDivisores n == sumaDivisores m = tomaValorMax n (m-1)  

--21)Implementar funcion Pitagoras
pitagoras :: Integer ->Integer ->Integer ->Integer 
pitagoras n m q |n < 0 = 0
                |otherwise = pitagorasAux n m q + pitagoras (n-1) m q   

pitagorasAux :: Integer -> Integer -> Integer -> Integer 
pitagorasAux n m q |m < 0 = 0
                   |n^2 + m^2 <= q^2 = 1 + pitagorasAux n (m-1) q
                   |otherwise = pitagorasAux n (m-1) q
                               
                                            