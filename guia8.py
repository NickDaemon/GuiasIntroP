#                              GUIA 8 LETS FUCKING END THIS

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

             




        
               

          


     

    

     
   


    
                        
           
               
     




        

 


                  
