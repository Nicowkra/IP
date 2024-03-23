from queue import LifoQueue as Pila

def ultima_aparicion(l:list[int],e:int)->int:
    posicion = 0
    for i in range(len(l)):
        if l[i] == e:
            posicion = i
    return posicion

l = [1,23,4,5,6,7,8,5,1,5]

#print(ultima_aparicion(l,1))

def elementos_exclusivos(l:list[int],m:list[int])->list[int]:
    lista = []
    for i in l:
        if not (i in m):
            if not (i in lista):
                lista.append(i)
    for j in m:
        if not (j in l):
            if not (j in lista):
                lista.append(j)
    return lista

m = [1,2,3,4,5,6,7,8,123,123]

#print(elementos_exclusivos(l,m))

def contar_traducciones_iguales(ing:dict,ale:dict)-> int:
    traducciones = 0
    for i in ing:
        if i in ale:
            if ing[i] == ale[i]:
                traducciones += 1
    return traducciones


aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

#print(contar_traducciones_iguales(inglés,aleman))

def convertir_a_diccionario(l:list)->dict:
    dic = {}
    for i in l:
        if not (i in dic):
            dic[i] = 1
        else:
            dic[i] += 1
    return dic
lista = [-1, 0, 4, 100, 100, -1, -1]
print(convertir_a_diccionario(lista))