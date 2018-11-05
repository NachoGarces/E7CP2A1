nombres = %w[Violeta Andino Clemente Javiera Paula Pia Ray]

# 1. Extraer todos los elementos que excedan mas de 5 caracteres utilizando el método
# .select.

ex_men5 = nombres.select { |i| i.length > 5 }
print "#{ex_men5}\n"

# 2. Utilizando .map crear una arreglo con los nombres en minúscula.

nom_min = nombres.map(&:downcase)
print "#{nom_min}\n"

# 3. Utilizando .select para crear un arreglo con todos los nombres que empiecen con P.

sel_p = nombres.select { |i| i.start_with?('P') }
print "#{sel_p}\n"

# 4. Utilizando .map crear un arreglo único con la cantidad de letras que tiene cada
# nombre.
cant_letras = nombres.map(&:size)
print "#{cant_letras}\n"

# 5. Utilizando .map y .gsub eliminar las vocales de todos los nombres.
voca = nombres.map do |i|
  i.gsub(/[aeiouAEIOU]/, '')
end
print "#{voca}\n"
