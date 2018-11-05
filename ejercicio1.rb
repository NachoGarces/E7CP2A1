a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]
print "#{a}\n"

# 1. Utilizando map aumentar el valor de cada elemento del array en 1.
up = a.map { |i| i + 1 }
print "#{up}\n"

# 2. Utilizando map convertir todos los valores a float.
val_float = up.map(&:to_f)
print "#{val_float}\n"

# 3. Utilizando map convertir todos los valores a string.
val_string = val_float.map(&:to_s)
print "#{val_string}\n"

# 4. Utilizando reject descartar todos los elementos menores a 5 en el array.
men5 = val_float.reject { |i| i < 5 }
print "#{men5}\n"

# 5. Utilizando select descartar todos los elementos mayores a 5 en el array.
sel_men5 = val_float.select { |i| i < 5 }
print "#{sel_men5}\n"

# 6. Utilizando inject obtener la suma de todos los elementos del array.
suma_total = val_float.inject { |sum, n| n + sum }
print "#{suma_total}\n"

# 7. Utilizando group_by agrupar todos los números por paridad (si son pares,
# es un grupos, si son impares es otro grupo).
pares = a.group_by(&:even?)
print "#{pares}\n"

# 8. Utilizando group_by agrupar todos los números mayores y menores que 6.
mayor = a.group_by { |i| i != 6 }
print "#{mayor}\n"
