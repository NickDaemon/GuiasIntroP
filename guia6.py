#                                     GUIA 6 LET'S GOOO
import math

#1.1
def imprimir_Hola_mundo() -> None:
    print("Hola Mundo!")

#1.2
def imprimir_verso() -> None:
    print("Brough out the pink lamborghini just to race with chyna\nBrought the wraith to china\nJust to race with Chyna\nBad lil bitch but she mixed with China\nReal thick vagina\nSmuggle bricks to China")

#1.3
def raiz_de_2() -> int:
    res:int = round(math.sqrt(2),4)  
    return res

#1.4
def factorial(x:int) -> int:
    res:int = 1
    for i in range(1,x+1,1):
        res *= i
    return res 

#1.5
def perimetro() -> float:
    res:float = 2*(math.pi)
    return res

#2.1
def imprimir_saludo(nombre:str) -> None:
    print("Hola " + nombre)

#2.2
def raiz_de(numero:float) -> float:
    res:float = math.sqrt(numero)
    return res

#2.3
def fahrenheit_a_celsius(t:float) -> float:
    res:float = ((t-32)*5)/9
    return res

#2.4
def imprimir_dos_veces(estribillo:str) -> str:
    res:str = estribillo*2

#2.5
def es_multiplo_de(x:int,y:int) -> bool:
    res:bool = x%y == 0
    return res

#2.6
def es_par(numero:int) -> bool:
    res:bool = es_multiplo_de(numero,2)
    return res

#2.7
def cantidad_de_pizzas(comensales:int,min_cantidad_de_porciones:int) -> int:
    res:int = math.ceil((comensales*min_cantidad_de_porciones)/8)
    return res

#3.1
def alguno_es_0(x:int,y:int) -> bool:
    res:bool = x == 0 or y == 0
    return res

#3.2
def ambos_son_0(x:int,y:int) -> bool:
    res:bool = x == 0 and y == 0
    return res

#3.3
def es_nombre_largo(nombre:str) -> bool:
    res:bool = len(nombre) >= 3 and len(nombre) <= 8
    return res

#3.4
def es_bisiesto(year:int) -> bool:
    res:bool = (year%400 == 0) or ((year%4 == 0) and (year%100 != 0))
    return res   

#4
def peso_pino(altura:int) -> int:
    if altura <= 3:
        res:int= (altura*100)*3
    else:
        res:int= (300*3) + ((altura*100)-300)*2  
    return res

def es_peso_util(peso:int) -> bool:
    res:bool = 400 <= peso <= 1000
    return res

def sirve_pino(altura:int) -> bool:
    res:bool = es_peso_util(peso_pino(altura))
    return res

#5.1
def devolver_el_doble_si_es_par(x:int) -> int:
    if es_multiplo_de(x,2):
        res:int = x*2
    else:
        res:int = x
    return res

'''
problema devolver_el_doble_si_es_par(in x:int) :Bool{
       requiere : True
       asegura : x mod 2 == 0 => res = 2*x
       asegura : x mod 2 /= 0 => res = x
}
''' 

#5.2
def devolver_valor_si_es_par_sino_el_que_sigue(x:int) -> int:
    if es_multiplo_de(x,2):
        res:int = x
    else:
        res:int = x + 1   
    return res     

def devolver_valor_2(x:int) -> int:
    if es_multiplo_de(x,2):
        if x != 0:
            res:int = x
        else:
            res:int = 0
        res:int = x
    else:
        res:int = x + 1
    return res                

#5.3
def devolver_el_doble_si_es_multiplo_de_3_el_triple_de_9(x:int) -> int:
    if es_multiplo_de(x,9):
        res:int=x*3
    elif es_multiplo_de(x,3):
        res:int=x*2
    else:
        res:int=x
    return res

#5.4
def lindo_nombre(nombre:str) -> str:
    if len(nombre) >= 5:
        res:str = "Tu nombre tiene muchas letras" 
    else:
        res:str = "Tu nombre tiene menos de 5 caracteres"    
    return res

#5.5
def elRango(numero:int) -> None:
    if numero <= 5:
        print("Menor a 5")
    elif 10 <= numero <= 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")     
    

#5.6
def trabajo_o_vacaciones(genero:str,edad:int) -> None: 
    if genero == "F" and (edad <= 18 or edad >= 60):
        print("Anda de vacaciones")
    elif genero == "F" and 18 < edad < 60:
        print("Te toca trabajar")
    elif genero == "M" and (edad <= 18 or edad >= 65):
        print("Anda de vacaciones") 
    else:
        print("Te toca trabajar")  

#6.1
def uno_al_diez() -> None:
    contador = 1
    while contador < 11:
        print(contador)
        contador += 1

#6.2
def diez_al_cuarenta_pares() -> None:
    contador = 10
    while contador < 41:
        print(contador)
        contador += 2

#6.3
def eco_por_diez() -> None:
    contador = 1
    while contador < 11:
        print("eco") 
        contador += 1    

#6.4
def cuenta_regresiva(x:int) -> None:
    contador = x
    while contador >= 0:
        if contador != 0:
            print(contador)
        else:
            print("Despegue!!")    
        contador -= 1    
   
#6.5
def viaje_al_pasado(partida:int,llegada:int) -> None:
    while llegada < partida:
        partida-=1
        print("Viajó un año al pasado, estamos en el año", partida)

#6.6
def conocer_a_Aristoteles(partida: int):
    while partida-20 >= -384:
        partida -=20
        print("Viajó 20 años al pasado, estamos en el año", partida)

#7.1
def seis_uno() -> None:
    for i in range(1,11,1):
        print(i)

#7.2
def seis_dos() -> None:
    for i in range(10,41,2):
        print(i)

#7.3
def seis_tres() -> None:
    for i in range(1,11,1):
        print("eco")

#7.4
def seis_cuatro(x:int) -> None:
    for i in range(x,-1,-1):
        if i != 0:
            print(i)
        else:
            print("Despegue!!")  

#7.5
def seis_cinco(partida:int,llegada:int) -> None:
    for i in range(partida - 1,llegada - 1,-1):
        print("Viajó un año al pasado, estamos en el año", i)

#7.6
def seis_seis(partida:int) -> None:
    for i in range(partida - 20,-383,-20):
        print("Viajó 20 años al pasado, estamos en el año", i)

       



