from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

#1.1
def contarLineas(dir:str)->int:
    f = open(dir,"r")
    contador:int = 0
    for i in range(0,len(f.readlines()),1):
        contador +=1
    f.close()
    return contador

#print(contarLineas("ttt.txt"))

#1.2
def existePalabra(palabra:str,dir:str)->bool:
    f = open(dir,"r")
    texto:str = f.read()
    return palabra in texto
        
#print(existePalabra("aa","ttt.txt"))

#1.3
def cantidadApariciones(palabra:str,dir:str)->bool:
    f = open(dir,"r")
    texto:str = f.read()
    palabras:str = texto.split()
    contador:int = 0
    for pal in palabras:
        if palabra in pal:
            contador += 1
    return contador

#print(cantidadApariciones("aa","ttt.txt"))

#2
def clonarSinComentarios(dir:str):
    f = open(dir,"r")
    texto:list = f.readlines()

    nombreClon = "sinComentarios_" + dir
    archivoClon = open(nombreClon,"w")
    for linea in texto:
        l = linea.strip()
        if len(l)==0 or (not l[0] == "#"):
            archivoClon.write(linea)
    f.close()
    archivoClon.close()

#clonarSinComentarios("ejemploComentado.py")

#4
def agregarFraseFinal(frase:str,dir:str):
    f = open(dir,"w")
    f.write("\n" + frase)
    f.close()
#agregarFraseFinal("laseptima","ttt.txt")

#5
def agregarFrasePrincipio(frase:str,dir:str):
    f=open(dir,"r")
    contenido = f.read()
    f.close()
    f = open(dir,"w")
    f.write(frase + "\n" + contenido)

#agregarFrasePrincipio("boquitaaa","ttt.txt")

#7
def promedio(lu:int,dir)->float:
    notas=0
    cantNotas=0
    f=open(dir)
    cont = f.readlines()
    for linea in cont:        
        obj = linea.split(",")
        if int(obj[0]) == lu:
            notas += int(obj[3])
            cantNotas += 1

    return notas/cantNotas

#print(promedio(454,"ttt.txt"))

#8
def generar_nros_al_azar (n:int, desde: int, hasta: int) -> Pila:
    t = 0
    p = Pila()
    while t < n:
        p.put(random.randint(desde,hasta))
        t += 1
    return p
    
#print(generar_nros_al_azar(2,546,5455))

#9
def elementos (p:Pila) -> int:
    f = p
    t = 0
    while not (f.empty()):
        f.get()
        t += 1       
    return t

#pil = generar_nros_al_azar(7,1,100)

#print(elementos(pil))

#10
def maximo (p:Pila) ->int:
    n = 0
    f = p
    while not(f.empty()):
        t = f.get()
        if n < t:
            n = t
    return n

#print (maximo(pil))

#11
def balanceada(s:str) ->bool:
    p = Pila()

    for c in s:
        print(c)
        if c == "(":
            p.put(c)
        elif c == ")":
            if p.empty():
                return False
            p.get()
    return p.empty()

#print(balanceada("5 + )("))

#12 
def polaca(s:str) -> int:
    p = Pila()
    for i in s:
        
        if i == "+":
            a = p.get()
            b = p.get()
            p.put(int(a) + int(b))
        elif i == "-":
            a = p.get()
            b = p.get()
            p.put(int(b) - int(a))
        elif i == "/":
            a = p.get()
            b = p.get()
            p.put(int(b) / int(a))
        elif i == "*":
            a = p.get()
            b = p.get()
            p.put(int(a) * int(b))
        elif not i == " ":
            p.put(i)

    return p.get()
            
#print(polaca("3 4 + 5 * 2 -"))

#13
def colaAlAzar(l:list)->Cola:
    cola = Cola()
    for i in l:
        cola.put(i)
    return cola

#print(colaAlAzar([1,2,34,567,5432,21,1]))

#14
def cantElementos(c:Cola)->int:
    q = c
    cant = 0
    while not (q.empty()):
        q.get()
        cant += 1
    return cant

colaTest = colaAlAzar([1,2,3,4,5,6,7,8])
#print(cantElementos(colaTest))

#15
def maxColas(c:Cola)->int:
    n = 0
    q = c
    while not (q.empty()):
        m = q.get()
        if n < m:
            n = m
    return n

#print(maxColas(colaTest))

#16
def secuenciaBingo()->Cola[int]:
    q = Cola()
    c = random.sample(range(0,100),100)
    for i in c:
        q.put(i)
    return q

def jugarBingo(carton:list,c:Cola)->int:
    n = 0
    while not (len(carton)== 0):
        n += 1
        bolilla = c.get()
        for i in carton:
            if bolilla == i:
                carton.remove(i)
    return n


lista = [1,2,5,7,33]
#print(jugarBingo(lista,secuenciaBingo()))

#17
def pacientesUrgentes(c:Cola[(int,str,str)]):
    n = 0
    while not c.empty():
        paciente = c.get()
        if paciente[0]<=3:
            n += 1
    return n
            
#19
def agruparLongitud(dir:str)->dict:
    dic = {}
    f = open(dir,"r")
    cont = f.readlines()
    for linea in cont:
        texto = linea.split(" ")
        for palabra in texto:
            long = len(palabra)
            if not long in dic:
                dic[long] = 1
            else:
                dic[long] += 1
    return dic

#print(agruparLongitud("ttt.txt"))

#20
def promediodict (dir:str)->dict:
    dic = {}
    f = open(dir,"r")
    cont = f.readlines()
    for linea in cont:
        obj = linea.split(",")
        estudiante = obj[0]
        if not (estudiante in dic):
            dic[estudiante] = promedio(int(estudiante),dir)
    return dic
#print(promediodict("ttt.txt"))

#21
def palabraMasFrecuente(dir:str)->str:
    dic = {}
    f = open(dir,"r")
    cont = f.readlines()
    for linea in cont:
        obj = linea.split(" ")
        for i in obj:    
            if not (i in dic):
                dic[i] = 1
            else: 
                dic[i] += 1

    valorMasFrecuente = 0
    claves = list(dic.keys())
    valores = list(dic.values())

    for i in valores:
        if i > valorMasFrecuente:
            valorMasFrecuente = i
    for j in claves:
        if dic[j] == valorMasFrecuente:
            return j
 

#print(palabraMasFrecuente("ttt.txt"))

#22
historiales = {}
ultimaNavegacion = []
def crearPila(val):
    p = Pila()
    p.put(val)
    return p

def agregarPila(pila,val):
    pila.put(val)
    return pila
def sacarPila(pila):
    a = pila.get()
    ultimaNavegacion.append(a)
    return pila

def visitarSitio(historiales,usuario,sitio):
    if not usuario in historiales:
        historiales[usuario] = crearPila(sitio)
    else:
        pila = historiales[usuario]
        historiales[usuario] = agregarPila(pila, sitio)

def navegarAtras(historiales,usuario):
    pila = historiales[usuario]
    historiales[usuario] = sacarPila(pila)

def navegarAdelante(historiales,usuario):
    ultimaPag = ultimaNavegacion[-1]
    pila = historiales[usuario]
    historiales[usuario] = agregarPila(pila, ultimaPag)

visitarSitio(historiales,"aa","google.com")
visitarSitio(historiales,"aa","g.com")
print(historiales)

#23
inv = {}
def agregarProducto(inventario:dict,nombre:str,precio:float,cantidad:int):
    for llaves in inventario:
        if llaves == nombre:
            print("el producto ya esta en el inventario")
    else:
        info = {}
        info["precio"] = precio
        info["cantidad"] = cantidad
        inventario[nombre] = info

def actualizarStock(inventario:dict,nombre:str,cantidad:int):
    info = inventario[nombre]
    info["cantidad"] = cantidad
    inventario[nombre] = info

def actualizarPrecio(inventario:dict,nombre:str,precio:float):
    info = inventario[nombre]
    info["precio"] = precio
    inventario[nombre] = info

def calcularValor(inventario:dict):
    valorTotal = 0
    for llave in inventario:
        valores = inventario[llave]
        valorTotal += valores["cantidad"]*valores["precio"]
    return valorTotal


agregarProducto(inv, "Camisa", 20.0, 50)
agregarProducto(inv, "Pantalon", 30.0, 30)
actualizarStock(inv,"Camisa",10)

print(calcularValor(inv))

#print(inv)