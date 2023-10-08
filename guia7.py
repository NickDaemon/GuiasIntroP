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

#Se puede buscar un char en un string con un pertenece de tipos genericos.

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

def palindromo(s:list[str]) -> bool:
    if reverso(s) == cadena(s):
        res:bool = True
    else:
        res:bool = False
    return res


#1.7
def password(s:str) -> str:
    if len(s) > 8 and seguridad(s):
        res:bool= "VERDE"  
    elif len(s) < 5:
        res:bool= "ROJA"
    else:
        res:bool= "AMARILLA"
    return res
                         
def seguridad(s:str) -> bool:
    res:bool=False
    for i in s:
        if 'A' <= i <= 'Z':
            for i in s:
                if 'a' <= i <= 'z':
                    for i in s:
                        if '0' <= i <= '9':
                            res:bool=True
    return res                        

def checkear():
    contra = input("Ingrese su password: ")
    print(password(contra))


 



       
        




    



       

   
