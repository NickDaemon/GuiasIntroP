type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

--EJERCICIO 1

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = proyectarNombres (usuarios red)

proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (u:us) = nombreDeUsuario u : proyectarNombres us


--EJERCICIO 2

amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe red u = amigosDeAux (relaciones red) u

amigosDeAux :: [Relacion] -> Usuario  -> [Usuario]
amigosDeAux [] u  = []
amigosDeAux ((u1,u2):rels) u 
    |u1 == u = u2 : amigosDeAux rels u
    |u2 == u = u1 : amigosDeAux rels u
    |otherwise = amigosDeAux rels u


--EJERCICIO 3

cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = cuantosAmigos (amigosDe red u) 

cuantosAmigos :: [Usuario] -> Int
cuantosAmigos [] = 0
cuantosAmigos (u:us) = 1 + cuantosAmigos us  

--EJERCICIO 4

usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos red = popular red (usuarios red)

popular :: RedSocial -> [Usuario] -> Usuario
popular red [u] = u
popular red (u1:u2:us) 
    |cantidadDeAmigos red u1 >= cantidadDeAmigos red u2 = popular red (u1:us)
    |cantidadDeAmigos red u1 < cantidadDeAmigos red u2 = popular red (u2:us)

--EJERCICIO 5

estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = cantidadDeAmigos red (usuarioConMasAmigos red) > 1000000
                   
--EJERCICIO 6

publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red u = publicacionAux (publicaciones red) u

publicacionAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionAux [] u = []
publicacionAux (p:ps) u 
    |usuarioPub u p = p : publicacionAux ps u
    |otherwise = publicacionAux ps u

usuarioPub :: Usuario -> (Usuario,String,[Usuario]) -> Bool
usuarioPub u (u1,_ , _) 
    |u == u1 = True
    |otherwise = False

--EJERCICIO 7

publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red u = meGusta (publicaciones red) u

meGusta :: [Publicacion] -> Usuario -> [Publicacion]
meGusta [] u = []
meGusta (pub:pubs) u 
    |leGusta u pub = pub : meGusta pubs u
    |otherwise = meGusta pubs u

leGusta :: Usuario -> (Usuario, String, [Usuario]) -> Bool
leGusta u (_, _, listaUsuarios) = elem u listaUsuarios

--EJERCICIO 8

lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 
    |publicacionesQueLeGustanA red u1 == publicacionesQueLeGustanA red u2 = True
    |otherwise = False

--EJERCICIO 9

tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red u = rideOrDie red (usuarios red) u

rideOrDie :: RedSocial -> [Usuario] -> Usuario -> Bool
rideOrDie red [] u = False
rideOrDie red (u1:us) u 
    |esAmigo red u1 u && dioLike (publicacionesDe red u) u1 = True
    |otherwise = rideOrDie red us u

dioLike :: [Publicacion] -> Usuario -> Bool
dioLike [] u1 = False
dioLike (pub:pubs) u1  
    |leGusta u1 pub = True
    |otherwise = dioLike pubs u1 

esAmigo :: RedSocial -> Usuario -> Usuario -> Bool
esAmigo red u1 u = elem u1 (amigosDe red u)

--EJERCICIO 10

existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red u1 u2 | u1 == u2 && amigosDe red u1 /= [] = True
existeSecuenciaDeAmigos red u1 u2 = relacionadosDirecto u1 u2 red || existeSecuenciaDeAmigosAux (sacarLasRelacionesDe red u1) (amigosDe red u1) u2

existeSecuenciaDeAmigosAux :: RedSocial -> [Usuario] -> Usuario -> Bool
existeSecuenciaDeAmigosAux red [] u2 = False
existeSecuenciaDeAmigosAux red (u:us) u2 = existeSecuenciaDeAmigos red u u2 || existeSecuenciaDeAmigosAux red us u2

relacionadosDirecto :: Usuario -> Usuario -> RedSocial -> Bool
relacionadosDirecto u1 u2 red = pertenece (u1,u2) (relaciones red) || pertenece (u2,u1) (relaciones red)

-- elimino las relaciones de u1 para no volver a pasar por ellas

sacarLasRelacionesDe :: RedSocial -> Usuario -> RedSocial
sacarLasRelacionesDe red u1 = (usuarios red, sacarLasRelacionesDeAux (relaciones red) u1, publicaciones red)

sacarLasRelacionesDeAux :: [Relacion] -> Usuario -> [Relacion]
sacarLasRelacionesDeAux [] u1 = []
sacarLasRelacionesDeAux (rel:rels) u1
    | estaRelacionado rel u1 = sacarLasRelacionesDeAux rels u1
    | otherwise = rel : sacarLasRelacionesDeAux rels u1
   
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs

estaRelacionado :: Relacion -> Usuario -> Bool
estaRelacionado (u1,u2) u = u1 == u || u2 == u
    





