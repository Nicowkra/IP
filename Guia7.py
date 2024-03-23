import math
import random


#1.1
def pertenece (s: list, e)-> bool:
    for i in s:
        if i == e:
            return True
    return False 

#1.2
def divideATodos(s: list[int], e:int) -> bool:
    for i in s:
        if i % e != 0:
            return False
    return True

#1.3
def sumaTotal(s:list)-> int:
    n=0
    for i in range(len(s)):
        n += s[i]
    return n

#1.4
def ordenados(s:list) -> bool:
    for i in range(1,len(s)):
        if (s[i-1] > s[i]):
            return False
    return True

#1.5
def palabraLarga(s: list) -> bool:
    for palabra in s:
        if len(palabra) > 7:
            return True
    return False

#1.6
def palindroma(palabra: str) -> bool:
    for i in range(len(palabra)):
        if palabra[i] == palabra[len(palabra)-i-1]:
            continue
        return False
    return True

#1.7
def contraseña(passw:str)->str:
    def esDigito(str)->bool:
        for i in str:
            if i.isdigit():
                return True
        return False
    
    verde: bool = (len(passw)>8) and  (not passw.islower()) and (not passw.isupper()) and esDigito(passw)

    if len(passw) < 5:
        return "Rojo"
    elif verde:
        return "Verde"
    else:
        return "Amarillo"
    
#1.8
def transaccion(movimientos:list):
    saldo=0
    for i in movimientos:
        if i[0] =="R":
            saldo -= i[1]
        elif i[0] == "I":
            saldo += i[1]
    return saldo

#print(transaccion([("I",2000),("R",20),("R",1000),("I",300),]))

#2.1
def pares(l:list):
    for i in range(1,len(l),2):     
        l[i] = 0
    return l

#2.2
def paresIn(l:list):
    n = l
    for i in range(1,len(n),2):     
        n[i] = 0
    return n

#2.3
def vocales(l:list)->list:
    lista=[]
    vocales = ["a","e","i","o","u"]
    for i in l:
        if not i in vocales:
            lista.append(i)
    return lista

#4.1
def nombres()->list:
    lista:list = []
    while True:
        nombre:str = input("Ingrese un nombre, o ponga 'listo' para finalizar:")
        if nombre=="listo":
            break
        lista.append(nombre)
    return lista

#4.2
def SUBE()->list:
    saldo:list=[]
    while True:
        transaccion:str = input("Ingrese su tipo de transaccion:")
        if transaccion == "C":
            monto:int = input("Ingrese cuanto desea cargar:")
            saldo.append(("C",monto))
        if transaccion == "D":
            monto:int = input("Ingrese cuanto desea descontar:")
            saldo.append(("D",-int(monto)))
        if transaccion == "X":
            break
    return saldo

#4.3
def siete()->list:
    cartasPosibles = [1,2,3,4,5,6,7,10,11,12] 
    manoDelJugador = []
    accionDelJugador = ""

    def sumaDeLamano(l:list)->float:
        suma = 0
        for i in l:
            if i<=10:
                suma += 1
            else:
                suma += 0.5
        return suma
    
    def ganoONoElPlayer(): 
        suma = sumaDeLamano(manoDelJugador)
        if suma == 7.5:
            print("Ganste")
        else:
            print("Perdiste, sumaste: ", suma)

    manoDelJugador.append(random.choice(cartasPosibles))

    while accionDelJugador != "plantarse":
        if sumaDeLamano(manoDelJugador)> 7.5:
            print("Perdiste, te pasaste")
            return manoDelJugador
        print("Tenes", manoDelJugador, "en mano")

        accionDelJugador = input("agarrar o plantarse?")
        if accionDelJugador == "plantarse":
            ganoONoElPlayer()
            return manoDelJugador
        else:
            manoDelJugador.append(random.choice(cartasPosibles)) #agarra una carta


#5.1
def perteneceCadaUno(l:list[list[int]],e:int)->list[bool]:
    res:list[bool] = []
    for sub in l:
        res.append(pertenece(sub,e))
    return res

#print(perteneceCadaUno([[4,2,3],[3,53,513,1,2,3,4],[4,1,2,]],4567))

#5.2
def esMatriz(s:list[list[int]])->bool:
    ancho = len(s[0])
    for i in range(len(s)):
        if len(s[i]) != ancho:
            return False
    return True

#5.3
def filasOrdenadas(l:list[list[int]])->list[bool]:
    res:list[bool] = []
    for fila in l:
        res.append(ordenados(fila))
    return res
