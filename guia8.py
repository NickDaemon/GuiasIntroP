#                              GUIA 8 LETS FUCKING END THIS
from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

#                                       ARCHIVOS

#1.1
def contar_lineas(archivo:str) -> int:
    texto = open(archivo,'r')
    contenido = texto.readlines()
    texto.close()
    return len(contenido)

#1.2
def existe_palabra(archivo:str,palabra:str) -> bool:
    texto = open(archivo,'r')
    contenido = texto.read()
    texto.close()
    res:bool = False
    if palabra in contenido:
            res:bool = True
    return res    

#1.3
def cantidad_apariciones(archivo:str,word:str) -> int:
    texto = open(archivo,'r')
    contenido = texto.read()
    text = contenido.split()
    texto.close()
    res:int = 0
    for palabra in text:
         if palabra == word:
              res +=1
    return res

#2
def empieza_con(linea:str,caracter:str) -> bool:
     for c in linea:
          if c == " ":
               continue
          elif c == caracter:
               return True
          else:
               return False
          
def no_comments(archivo:str) -> str:
    original = open(archivo,'r')
    contenido = original.readlines()
    modif:list = []
    original.close()
    for linea in contenido:
         if not empieza_con(linea,'#'):
              modif.append(linea)
    clon = open('noComments.txt','w')
    clonado = clon.writelines(modif)
    return clonado          
              
             
#3
def reverso(archivo:str) -> str:
     original:str = open(archivo,'r')
     contenido = original.readlines()
     original.close()
     modif:list = []
     for i in range(len(contenido)-1,-1,-1):
          modif.append(contenido[i])
     reverso = open('reverso.txt','w')
     reverso.writelines(modif)
     return reverso

#4
def agregar_final(archivo:str,frase:str) -> str:
     file = open(archivo,'a')
     file.writelines(frase + '\n')
     return file

def agregar_final2(archivo:str,frase:str) -> str:
     file = open(archivo,'r')
     contenido = file.readlines()
     contenido.append(frase)
     file.close()
     file = open(archivo,'w')
     file.writelines(contenido)
     file.close()
     return file

#5
def agregar_inicio(archivo:str,frase:str) -> str:
     file = open(archivo,'r')
     contenido = file.read()
     file.close()
     file = open(archivo,'w')
     file.write(frase + '\n' + contenido)
     return file

#6
def palabrasLegiblesEnBinario(nombre_archivo: str) -> list:

    archivo = open(nombre_archivo, 'rb') 
    contenido = archivo.read()

    palabras_legibles = []
    palabra_actual = ""

    for byte in contenido:
        caracter = chr(byte)
        if caracter.isalnum() or caracter == " " or caracter == "_":
            palabra_actual += caracter
        elif len(palabra_actual) >= 5:
            palabras_legibles.append(palabra_actual)
            palabra_actual = ""
        else:
            palabra_actual = ""
    
    if len(palabra_actual) >= 5:
        palabras_legibles.append(palabra_actual)
    
    return palabras_legibles

#7
def promedio_estudiante(file:str,LU:str) -> float:
     archivo = open(file,'r')
     contenido = archivo.read()
     ordenar = contenido.split('\n')
     notas:list = []
     for linea in ordenar:
          datos = linea.split(',')
          if datos[0] == LU:
               notas.append(float(datos[3]))
     archivo.close()        
     return sum(notas)/len(notas)    

#                                   PILAS(LIFOQUEUE)

#8
def generar_azar(n:int,desde:int,hasta:int) -> Pila:
     pila = Pila()
     contador = 0

     while contador < n:
          pila.put(random.randint(desde,hasta))
          contador +=1

     print(pila.queue)     
     return pila

#9
def len_pila(pila:Pila) -> int:
     contador = []  

     while not pila.empty():
          elemento = pila.get()
          contador.append(elemento)

     for i in range(len(contador)-1,-1,-1):
          pila.put(contador[i]) 
             
     return len(contador)

#10
def max_pila(pila:Pila) -> int:
     elementos = []
     
     while not pila.empty():
          elemento = pila.get()
          elementos.append(elemento)

     for i in range(len(elementos)-1,-1,-1):
          pila.put(elementos[i]) 

     return max(elementos) 

#11
def balanceada(formula:str) -> bool:
     pila = Pila()
     res:bool = True
     for caracter in formula:
        if caracter == '(':
            pila.put(caracter)
        elif caracter == ')':
            if pila.empty() or pila.get() != '(':
                res:bool = False
     return res          
                  
#12
def polaca_inversa(cuenta:str) -> int:
      postfix = cuenta.split()
      pila = Pila()
      print(postfix)
      for token in postfix:
         if token not in ['+','-','*','/']:
              pila.put(token)
         elif token == '+':
              elemento = int(pila.get()) 
              elemento += int(pila.get())
              pila.put(elemento)
         elif token == '-':
              segundo = int(pila.get()) 
              primero = int(pila.get())
              elemento = primero - segundo
              pila.put(elemento)
         elif token == '*':
              elemento = int(pila.get()) 
              elemento *= int(pila.get())
              pila.put(elemento) 
         elif token == '/':
              segundo = int(pila.get()) 
              primero = int(pila.get())
              elemento = primero/segundo
              pila.put(elemento)        
      return pila.get()            
             
 
#                             C0LAS(FIF0)
#13
def cola_azar(n:int,desde:int,hasta:int) -> Cola:
     cola = Cola()
     contador = 0
     while contador < n:
          elementos = random.randint(desde,hasta)
          cola.put(elementos)
          contador +=1
     print(cola.queue)     
     return cola

#14
def len_cola(cola:Cola) -> int:
     elementos = []
     while not cola.empty():
          sale = cola.get()
          elementos.append(sale)
     for i in elementos:
          cola.put(i)
     return len(elementos)

     
#15
def max_cola(cola:Cola) -> int:
     elementos = []
     while not cola.empty():
          sale = cola.get()
          elementos.append(sale)
     for i in elementos:
          cola.put(i)   
     return max(elementos)  

#16
def bolillero() -> Cola[int]:
     bolillas = Cola()
     sin_repetidos = []
     while len_cola(bolillas) < 100:
          numeros = random.randint(0,99)
          if numeros not in sin_repetidos:
               bolillas.put(numeros)
               sin_repetidos.append(numeros)
     return bolillas

def jugar_bingo(carton:list[int],bolillero:Cola[int]) -> int:
     jugadas = 0
     llenado = []
     bolilleroAux:Cola = Cola()
    
     while len(llenado) != len(carton):
          numero:int = bolillero.get()
          bolilleroAux.put(numero)
          jugadas +=1 
          if numero in carton:
               llenado.append(numero)

     while not bolillero.empty():
          num:int = bolillero.get()
          bolilleroAux.put(num)

     while not bolilleroAux.empty():
          num:int = bolilleroAux.get() 
          bolillero.put(num)              
   
     return jugadas

#17
def pacientes_urgentes(pacientes:Cola[int,str,str]) -> int:
     urgencias = []
     pacientesAux = Cola()
     
     while not pacientes.empty():
          paciente = pacientes.get()
          pacientesAux.put(paciente)
          if paciente[0] in [1,2,3]:
               urgencias.append(paciente[0])

     while not pacientesAux.empty():
          paciente = pacientesAux.get()
          pacientes.put(paciente) 
     
     return len(urgencias) 

#18
def atencion_clientes(llegada:Cola[str,int,bool,bool]) -> Cola[str,int,bool,bool]:
     orden = Cola()
     prioridad1 = []
     prioridad2 = []
     prioridad3 = []
     clientes = []
     
     while not llegada.empty():
          cliente = llegada.get()
          clientes.append(cliente)
          if cliente[3] == True:
               prioridad1.append(cliente)
          elif cliente[2] == True:
               prioridad2.append(cliente)
          else:
               prioridad3.append(cliente) 

     for datos in prioridad1:
          orden.put(datos)
     for datos in prioridad2:
          orden.put(datos)
     for datos in prioridad3:
          orden.put(datos)  
     
     for datos in clientes:
          llegada.put(datos)
    
     return orden  

#Especificacion
'''
problema atencion_clientes(in llegada:Cola[str,int,bool,bool]) : Cola[str,int,bool,bool] {
     requiere:|llegada| /= 0
     asegura: |res| = |llegada|
     asegura:(0 <= i < |res| - 1):res[i] pertenece llegada
     asegura:(0 <= i < |res| - 1):if res[i][3] = True then prioridad1(res,i)
                                  else 
                                   if res[i][2] = True then prioridad2(res,i)
                                   else prioridad3(res,i)
                                   fi   
                                  fi
     asegura: ordenados(llegada,res)
     }

    pred prioridad1(res:Cola[str,int,bool,bool],i:int) {
          res[i+1][3] = True or prioridad2(res,i)
     }

    pred prioridad2(res:Cola[str,int,bool,bool],i:int) {
          res[i+1][3] = False and 
               if res[i+1][2] = False then 
                  prioridad3(res,i+1)
               else 
                  res[i+1][2] = True 
               fi
    }

    pred prioridad3(res:Cola[str,int,bool,bool],i:int) {
          (i <= j < |res|):res[j][3] and res[j][2] = False
    }
'''
     



















          


     


    




  
     


   



             




        
               

          


     

    

     
   


    
                        
           
               
     




        

 


                  
