#Dividir sin dividir

def dividir(dividendo,divisor):
    if divisor == 0:
        return "Error: División por cero no permitida"
    if dividendo < 0 or divisor < 0:
        return "Error: No soporta números negativos"
    if dividendo<divisor:
        return 0
    return 1 + dividir(dividendo-divisor,divisor)

# Ejemplo
print(dividir(10, 2)) 
print(dividir(10, 0)) 
print(dividir(10, 3))  # Aproxima a 3