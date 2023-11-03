#                                 GUIA 7 WHAT NOW??
import random
import numpy as np
import copy

#1.1
def pertenece(lista:list[any],x:any) -> bool:
    res:bool=False
    for i in lista:
        if i == x:
            res:bool=True
    return res

#1.2
def divide_a_todos(lista:list[int],x:int) -> bool:
    res:bool=True
    for i in lista:
        if i%x != 0:
            res:bool=False
    return res

#1.3
def suma_total(lista:list[int]) -> int:
    res:int=0
    for i in lista:
        res+=i
    return res

#1.4
def ordenados(lista:list[int]) -> bool:
    res:bool=True
    for i in range(len(lista)-1):
        if lista[i] > lista[i+1]:
            res:bool=False
    return res  

#1.5
def la_tiene_larga(palabras:list[str]) -> bool:
    res:bool=False
    for palabra in palabras:
        if len(palabra) >= 7:
            res:bool=True
    return res

#1.6
def palindromo(text:str) -> bool:
    texto = text.split()
    palabra = ''
    reverso = ''
    for i in texto:
        palabra += i
    palabras = palabra.lower()
    for i in range(len(palabra)-1,-1,-1):
        reverso += palabra[i]
    rever = reverso.lower()
    return rever == palabras

#1.7
def fortaleza(password:str) -> str:
    if len(password) > 8 and es_segura(password):
        return "VERDE"
    elif len(password) < 5:
        return "ROJA"
    else:
        return "AMARILLA"
                

def es_segura(password:str) -> bool:
    res:bool=False
    for i in password:
        if 'A' <= i <= 'Z':  #Busco una mayuscula
            for i in password:
                if 'a' <= i <= 'z':  #Busco una minuscula
                    for i in password:
                        if '0' <= i <= '9':  #Busco un numero
                            res:bool=True
    return res 

#1.8
def saldo_actual(historial:list[tuple[str,int]]) -> int:
    saldo:int=0
    for movimiento in historial:
        if movimiento[0] == "I":
            saldo += movimiento[1]
        else:
            saldo -= movimiento[1]
    return saldo

#1.9
def es_vocal(letra:str) -> bool:
    if letra in ['a','e','i','o','u']:
        return True
    else:
        return False   

def es_variada(palabra:str) -> str:
    vocales:list[str] = []
    for i in palabra.lower():
        if es_vocal(i) and i not in vocales:
            vocales.append(i)
    return len(vocales) >= 3

#2.1
def cero_en_pares_inout(lista:list[any]) -> list[any]:
    for i in range(len(lista)):
        if i%2 != 0:
            lista[i] = 0
    return lista        

#2.2
def cero_en_pares_in(lista:list) -> list:
    nueva_lista:list = lista.copy()  
    for i in range(len(nueva_lista)):
        if i%2 == 0:
            nueva_lista[i] = 0
    return nueva_lista

#2.3
def no_vocales(palabra:str) -> str:
    sinvocal=''
    for i in palabra:
        if i not in ["A","E","I","O","U"] and not es_vocal(i): 
            sinvocal+=i
    return sinvocal

#2.4
def reemplaza_vocales(palabra:str) -> str:
    hyphen:str=''
    for letra in palabra:
        if letra in ["A","E","I","O","U"] or es_vocal(letra):
            hyphen += '-'
        else:
            hyphen += letra    
    return hyphen

#2.5
'''es funcion reverso que hize en #1.6 lol.'''

#2.6
def eliminar_repetidos(palabra:str) -> str:
    nueva = ''
    for pal in palabra:
        if pal not in nueva:
            nueva+= pal
    return nueva

#3.0
def buen_promedio(notas:list[int]) -> bool:
    res:bool=True
    for nota in notas:
        if nota < 4:
            res:bool=False
    return res  

def promociona_o_recursa(notas:list[int]) -> int:
    if buen_promedio(notas):
        if (suma_total(notas)/len(notas)) >= 7:
            res:int=1
        else:
            res:int=2
    else:
        res:int=3
    return res

#4.1
def mis_alumnes() -> list[str]:
    continuar: bool = True
    alumnxs: list[str] = []
    while continuar:
        entrada = input("Alumnos (escribe 'listo' para salir):")
        if entrada.lower() != "listo":
            alumnxs.append(entrada)
        else:
            continuar = False  
    return alumnxs

#4.2
def SUBE() -> list[tuple]:
    historial = []
    contador = True
    saldo = 0
    while contador :
        entrada = input("Que desea hacer?\nPresione 'C' para cargar creditos\nPresione 'D' para descontar creditos\nPresione 'X' si desea salir:\n")
        if entrada == 'C':
            operacion = input("Que monto desea cargar?:")
            historial.append((entrada,int(operacion)))
            saldo += int(operacion)
            print(f"Movimientos hasta ahora:{historial}")

        elif entrada == 'D':
            operacion= input("Que monto desea descontar?:")
            historial.append((entrada,int(operacion)))
            saldo -= int(operacion)
            print(f"Movimientos hasta ahora:{historial}")

        elif entrada == 'X':
            print(f"Su saldo actual es:{saldo} y Su historial es:{historial}") 
            contador = False 
         
    return historial 

#4.3
def siete_y_medio() -> list:
    cartas:list = [1,2,3,4,5,6,7,10,11,12]
    verificador:bool = True
    jugadas:list = []
    contador:float = 0
    carta = random.choice(cartas) 
    if carta in [10,11,12]:
        contador += 0.5
        jugadas.append(carta)
    else:
        contador += carta    
        jugadas.append(carta)
    
    while verificador:
        jugada = input("Que desea hacer?\n'A' si quiere sacar otra carta:\n'B' si desea plantarse:\n")
        if jugada == 'A':
            carta = random.choice(cartas)
            if carta in [10,11,12]:
                jugadas.append(carta)
                contador += 0.5
            else:
                jugadas.append(carta)
                contador += carta
        if jugada == 'B':
            if contador < 7.5:
                print(f"Buena jugada! tus cartas fueron:{jugadas}")
            elif contador == 7.5:
                print(f"Ganaste!! sacaste 7 y medio! tus cartas fueron:{jugadas}")
            else:
                print(f"Lo siento perdiste! tus cartas fueron {jugadas}") 
            verificador = False
    return jugadas    

#5.1
def pertenece_a_cada_uno(lista:list[list[int]],num:int,res:list) -> None:
    res.clear()
    for i in lista:
        if pertenece(i,num):
            res.append(True)
        else:
            res.append(False) 
    print(res)           

#5.2
def es_matriz(lista:list[list[int]]) -> bool:
    res:bool = True
    for i in range(len(lista) - 1):
        if len(lista[i]) != len(lista[i+1]):
            res = False
    return res

#5.3
def filas_ordenada(matriz:list[list[int]],res:list) -> None:
    res.clear()
    for fila in matriz:
        if ordenados(fila):
            res.append(True)
        else:
            res.append(False) 
    print(res)

#5.4
'''Version sin usar nada "Desconocido"'''

def matriz_potencia(p:int,d:int) -> list[list[int]]:
    matriz:list[list[int]] = np.random.randint(-10,10,(d,d))
    print(matriz)
    mfinal = []
    for fila in matriz:
        columna=[]
        for elem in fila:
            columna.append(elem)
        mfinal.append(columna)
    for _ in range(p-1):
        mtemp = []
        for i in range(d):
            filas = []
            for j in range(d):
                res = 0
                for k in range(d):
                    res += mfinal[i][k]*matriz[k][j]
                filas.append(res)
            mtemp.append(filas) 
        mfinal = mtemp
    print(mfinal)    
    return mfinal


''' Version Extra '''
def matriz_potencia2(p:int,d:int) -> list[list[int]]:
    matriz:list[list[int]] = np.random.randint(-10,10,(d,d))
    maux = copy.deepcopy(matriz)
    for _ in range(p - 1):
            m2 = [[None] * d for _ in range(d)]
            for i in range(d):
                for j in range(d):
                    res:int = 0
                    for k in range(d):
                        res += maux[i][k] * matriz[k][j]
                    m2[i][j] = res
            maux = m2        
    return maux           


              












            
  




   

            











             
      

         



        







      



    
        
           

   

            


                       
  
                      
         
           




              
        


           
























       
    
         




        


                
















      


       









    


            


                






#1.7




  

       
    
        
        
