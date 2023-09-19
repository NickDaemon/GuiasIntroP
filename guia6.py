import math
#                                   GUIA 6 INTRO A PYTHON

# Ejercicio 1.1)
def raizDe2():
    raizDe2: float = round(math.sqrt(2),4)
    return raizDe2

#EJERCICIO 1.2)
def imprimir_hola():
    return "hola"

print (imprimir_hola())

#EJERCICIO 1.3)   
def imprimir_verso():
    verso: str = " Brought out the pink Lamborghini just to race with Chyna\n Brought the Wraith to Chyna\n just to race in China\n Lil' bad Trini bitch but she mixed with China\n Real thick vagina, smuggle bricks to China"
    return verso
    
print (imprimir_verso())

#EJERCICIO 1.4)
# Ejercicio 1.4)
def factorial(x: int) -> int:
    res: int = 1
    for i in range(1, x+1, 1):
        res *= i
    return res

def factorial_de_dos() -> int:
    return factorial(2)

#EJERCICIO 1.5)
def factorial_3() -> int:
    return factorial(3)

#EJERCICIO 1.6)
def factorial_4() -> int:
    return factorial(4)

#EJERCICIO 1.7)
def factorial_5() -> int:
    return factorial(5)






 


    



  




