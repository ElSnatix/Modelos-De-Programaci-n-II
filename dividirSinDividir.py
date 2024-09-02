def dividirArreglo(arr):
    # caso base: cuando el arreglo ya está dividido
    if len(arr) <= 1:
        return [arr]

    # punto de división del arreglo
    division = len(arr) // 2

    # divide el arreglo en dos mitades
    mitadIzquierda = arr[:division]
    mitadDerecha = arr[division:]

    # se usa la recursividad para dividir las mitades
    return dividirArreglo(mitadIzquierda) + dividirArreglo(mitadDerecha)

# Ejemplo de uso
arreglo = [1, 10, 5, 4, 6, 7, 8]
resultado = dividirArreglo(arreglo)
print("Resultado:", resultado)





