#                              GUIA 7 WHAT NOW?

#1.1
def pertenece1(s:list[int],x:int) -> bool:
    if x in s :
        res:bool = True
    else:
        res:bool = False
    return res

def pertenece2(s:list[int], x: int) -> bool:
    res:bool = False
    for i in s:
        if i == x:
            res:bool = True
    return res           

def pertenece3(s:list[int],x:int) -> bool:
    res:bool = False
    indice = 0
    while indice < len(s):
        if s[indice] == x:
            res:bool=True
        indice += 1    
    return res        

def pertenece4(s:list[any], x:any) -> bool:
    if x in s :
        res:bool = True
    else:
        res:bool = False
    return res

'''En pertenece4 veo que se puede buscar un char en un string con un 
   pertenece de tipo generico.'''

#1.2
def divide_a_todos(s:list[int],e:int) -> bool:
    res:bool = True
    for i in s:
        if i%e != 0:
            res:bool = False
    return res   

def divide_a_todos2(s:list[int],e:int) -> bool:
    indice:int = 0
    res:bool = True
    while indice < len(s):
        if s[indice]%e != 0:
            res:bool = False
        indice += 1
    return res  

#1.3
def suma_total(s:list[int]) -> int:
    res:int= 0 
    for i in s:
        res += i
    return res

def suma_total2(s:list[int]) -> int:
    indice:int = 0
    res:int = 0
    while indice < len(s):
        res += s[indice]
        indice += 1    
    return res   

#1.4
def ordenado(s:list[int]) -> bool:
    indice:int = 0
    res:bool = True
    while indice < len(s) - 1:
        if s[indice] > s[indice + 1]:
            res:bool = False
        indice +=1
    return res        

def ordenado2(s:list[int]) -> bool:
    res:bool = True
    for i in range(len(s)-1):
        if s[i] > s[i+1]:
            res:bool = False
    return res

#1.5
def la_tiene_larga(s:list[str]) -> bool:
    res:bool = False
    for i in s:
        if len(i) >= 7:
            res:bool= True
    return res     

def la_tiene_larga_2(s:list[str]) -> bool:
    indice:int = 0
    res:bool = False
    while indice < len(s):
        if len(s[indice]) >= 7:
            res:bool = True
        indice +=1
    return res

#1.6
def palindromo(s:list[str]) -> bool:
    if reverso(s) == cadena(s):
        res:bool = True
    else:
        res:bool = False
    return res

def reverso(s:list[str]) -> list[str]:
    l = []
    for i in range(len(s) - 1 , -1, -1):
        if s[i] != ' ':
            l.append(s[i])
    return l

def cadena(s:list[str]) -> list[str]:
    l = []
    for i in s:
        if i != ' ':
           l.append(i)
    return l    

#1.7
def password(s:str) -> str:
    if len(s) > 8 and es_segura(s):
        res:bool= "VERDE"  
    elif len(s) < 5:
        res:bool= "ROJA"
    else:
        res:bool= "AMARILLA"
    return res
                         
def es_segura(s:str) -> bool:
    res:bool=False
    for i in s:
        if 'A' <= i <= 'Z': # Busco alguna mayuscula.
            for i in s:
                if 'a' <= i <= 'z': # Busco alguna minuscula.
                    for i in s:
                        if '0' <= i <= '9': # Busco algun numero.
                            res:bool=True
    return res                        

def checkear():
    contra = input("Ingrese su password: ")
    print(password(contra))

    
#1.8
def historial(s:list[tuple[str,int]]) -> int: 
    saldo:int = 0
    for i in s:
        if i[0] == "I":
            saldo += i[1] 
        else:
            saldo -= i[1]
    return saldo

#1.9
def mas_de_3(palabra:str) -> bool:
    return len(no_repetidos(palabra)) >= 3
      
def es_vocal(s:str) -> bool:
    if s=='a' or s=='i' or s=='e' or s=='o' or s=='u':
        res:bool=True
    elif s=='A' or s=='E' or s=='I' or s=='O' or s=='U':
        res:bool=True   
    else:
        res:bool = False
    return res

def no_repetidos(palabra: str) -> str:
    nuevo_str:str = ''
    for i in range(len(palabra)):
        if es_vocal(palabra[i]) and palabra[i] not in palabra[i+1:]:
            nuevo_str += palabra[i]   
    return nuevo_str

#2.1
def cero_en_pares_inout(s:list[int]) -> list[int]:
    for i in range(len(s)):
        if i%2 == 0:
            s[i] = 0
    return s 

#2.2
def cero_en_pares_in(s:list[int]) -> list[int]:
    l:list = s.copy()
    for i in range(len(l)):
        if i%2 == 0:
            l[i] = 0
    return l

#2.3
def sin_vocal(palabra:str) -> str:
    nueva:str = ''
    for i in palabra:
        if not es_vocal(i):
            nueva += i
    return nueva   

#2.4
def reemplaza_vocales(palabra:str) -> str:
    guion:str = ''
    for i in palabra:
        if es_vocal(i):
            guion += '-' 
        else:
            guion += i
    return guion

#2.4
def dar_vuelta_str(s:str) -> str:
    reverso:str = ''
    for i in range(len(s)-1,-1,-1):
        reverso += s[i]
    return reverso   

#2.5
def eliminar_repetidos(s:str) -> str:
    norepetidos:str = ''
    for i in range(len(s)):
        if s[i] not in s[i+1:]:
            norepetidos += s[i]
    return norepetidos  

     


            
           


            


      
           
    
 



            
    


                


          
    

      
         
           




 



       
        




    



       

   
