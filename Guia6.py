import math

#1.3
def raizDe2 (x:int) -> int:
    return round(math.sqrt(x),4)

#1.4
def factorial(x:int) ->int:
    res:int = 1
    for i in range(1,x+1):
        res *= i
    return res    

def factorial_2 () -> int:
    return factorial(2)

#1.5
def perimetro() -> float:
    return 2*math.pi

#2.1
def saludo(x:str)-> str:
    print ("Hola" +" "+ x)

#2.2
def raizCuadradaDe (x:float) -> float:
    return math.sqrt(x)

#2.3
def fahrenheitACelsius (t:float) -> float:
    return ((t-32)*5)/9

#2.5
def esMultiploDe (x:int,y:int)-> bool:
    return x%y == 0

#2.6
def esPar(x:int) -> bool:
    return esMultiploDe(x,2)

#2.7
def cantidadPizzas (pers:int,cant:int) -> int:
    return math.ceil((pers*cant)/8)

#3.1
def algunoEs0 (x:int,y:int) ->bool:
    return x == 0 or y == 0

#3.2
def ambosSon0 (x:int,y:int) ->bool:
    return x == 0 and y == 0

#3.3
def esNombreLargo (n:str) -> bool:
    return len(n) >= 3 and len(n)<= 8

#3.4
def esBisiesto (año:int) ->bool:
    return año%400 == 0 or (año%4 == 0 and año%100 != 0)

#4
def peso_pino(h: int) -> int:
    peso:int = 0
    if h >3:
        peso = 3*3*100 + 2*(h-3)*100
    else:
        peso = 3*h*100
    return peso

def es_peso_util(peso: int) -> bool:
    return 400 <= peso <= 1000

def sirve_pino(a:int) -> bool:
    p = peso_pino(a)
    return es_peso_util(p)

#5.1
def devolver_el_doble_si_es_par(un_numero: int) -> int:
    if un_numero%2 == 0:
        return 2*un_numero
    else:
        return un_numero
    
#5.2
def devolver_el_valor_si_es_par_sino_el_que_sigue(n:int) -> int:
    if n%2 == 0:
        return n
    else:
        return n+1
    
#5.3
def devolver_el_doble_si_es_multiplo_de3_el_triple_si_es_multiplo_de_9(un_numero: int) -> int:
    if un_numero%9 == 0:
        return 3*un_numero
    elif un_numero%3 == 0:
        return 2*un_numero
    else:
        return un_numero
    
#5.4
def lindo_nombre(nombre:str) -> str:
    if len(nombre) >= 5 :
        return "Tu nombre tiene muchas letras"
    else:
        return "Tu nombre tiene menos de 5 letras"
    
#5.5
def elRango (numero:int) -> str:
    if numero < 5:
        return "Menor a 5"
    elif 10<numero<20:
        return "Entre 10 y 20"
    elif numero>20:
        return "Mayor a 20"
    
#5.6
def Vacaiones(Genero:str,Edad:int)->str:
    if Edad<18 or (Genero == "M" and Edad>=65) or (Genero == "F" and Edad>=60):
        return "Anda de vacaciones"
    else:
        return "Anda a laburar"
    
#6.1
def num_del_1_al_10():
    x=1
    while x<11:       
        print(x)
        x+=1
       
#6.2
def numPares():
    x=10
    while x<=40:
        if x%2 == 0:
            print(x)
            x+=1
        else:
            x+=1

#6.3
def eco():
    x=1
    while x<=10:
        print("eco")
        x+=1

#6.4
def regresiva(x:int)->str:
    while x>= 1:
        print(x)
        x-=1
    print("Despegue")

#6.5
def Viaje(partida:int,llegada:int)->str:
    while partida>=llegada:
        print ("Viajo un año al pasado, estamos en el año: " + str(partida) )
        partida -= 1

#6.6
def ViajeAristoteles(partida:int)->str:
    while partida-20 >= -384:
        partida -= 20
        print ("Viajo un año al pasado, estamos en el año:" , partida )
       

#7.1
def num1al10 ():
    for i in range(1,11,1):
        print (i)

#7.2
def numPares():
    for i in range(10,41,2):
        print(i)

#7.3
def eco10():
    for i in range(0,10,1):
        print("eco")

#7.4
def cuenta_despegue(numero: int):
    for i in range(numero,0,-1):
        print(i)
    print("Despegue")

#7.5
def viaje_al_pasado(partida: int, llegada: int):
    for i in range(partida-1,llegada-1,-1):
        print("Viajó un año al pasado, estamos en el año", i)

#7.6
def conocer_a_Aristoteles(partida: int):
    for i in range(partida-20,-385,-20):
        print("Viajó un año al pasado, estamos en el año", i)