personas = { 'holyfuuu' => [30, 'las condes', 'hombre'],
             'mafla' => [26, 'la legua', 'hombre'],
             'jaimelita' => [27, 'peñalolen', 'mujer'] }

def menu
  puts '|------------------------------------------|'
  puts '|                  MENU                    |'
  puts '|------------------------------------------|'
  puts '|1.  INGRESAR NOMBRE, EDAD, COMUNA Y GENERO|'
  puts '|2.  EDITAR DATOS DE UNA PERSONA           |'
  puts '|3.  ELIMINAR UNA PERSONA                  |'
  puts '|4.  MUESTRA LA CANTIDAD DE PERSONAS       |'
  puts '|5.  MUESTRA LAS COMUNAS                   |'
  puts '|6.  PERSONAS ENTRE 20 Y 25 AÑOS           |'
  puts '|7.  SUMA DE EDADES TOTALES                |'
  puts '|8.  PROMEDIO DE EDADES                    |'
  puts '|9.  2 LISTAS DE PERSONAS (POR GENERO)     |'
  puts '|10. SALIR                                 |'
  puts '|------------------------------------------|'
  puts '|INGRESE EL NUMERO DE LO QUE DESEA REALIZAR|'
  puts '|------------------------------------------|'
end

# Extensiones esteticas
def validador(num)
  puts "\n|**INGRESE UNA OPCION VALIDA ENTRE 1 Y 10**|" if num < 1 || num > 10
end

def espera
  puts "\nPrecione enter para volver al programa"
  gets.chomp
end

def mostrar(people)
  people.each { |c| print " -->#{c[0]}" }
end

def lista(people)
  people.each { |c| print "--> #{c[0]}: #{c[1]}\n" }
end
# **********************

def registrador(people)
  puts 'Ingrese el nombre de la persona'
  nombre = gets.chomp
  puts "Ingrese la edad de '#{nombre}'"
  edad = gets.chomp.to_i
  puts "Ingrese la comuna de residencia de '#{nombre}'"
  comuna = gets.chomp
  puts "Ingrese el genero de '#{nombre}' (hombre o mujer)"
  genero = gets.chomp
  people[nombre] = edad, comuna, genero
  puts "\n--> INGRESADO CORRECTAMENTE\n"
end

def editador(usuario, people)
  if people.key?(usuario)
    puts "Ingrese el NUEVO nombre para '#{usuario}'"
    nombre = gets.chomp
    puts "Ingrese la edad ACTUAL de '#{nombre}'"
    edad = gets.chomp.to_i
    puts "Ingrese la NUEVA comuna de residencia de '#{nombre}'"
    comuna = gets.chomp
    puts "Ingrese el genero de '#{nombre}' (hombre o mujer)"
    genero = gets.chomp
    people.delete(usuario)
    people[nombre] = edad, comuna, genero
    puts "\n--> MODIFICADO CORRECTAMENTE"
  else
    puts "\n--> El nombre '#{usuario}' no se encuentra registrado\n"
  end
end

def eliminador(usuario, people)
  people.delete(usuario) if people.key?(usuario)
end

def contador(people)
  puts "--> #{people.count}"
end

def comunador(people)
  people.each { |c| puts "--> #{c[1][1]}" }
end

def personador(people)
  people.each do |c|
    puts "--> #{c[0]} con #{c[1][0]} años" if c[1][0] >= 20 && c[1][0] <= 25
  end
end

def sumador(people)
  suma = 0
  people.each { |c| suma += c[1][0] }
  puts "--> #{suma.to_f}"
end

def promediador(people)
  suma = 0
  people.each { |c| suma += c[1][0] }
  puts "--> #{suma.to_f / people.count}"
end

def generador(people)
  arr_h = []
  arr_m = []
  h = 0
  m = 0
  people.each do |c|
    if c[1][2] == 'hombre'
      arr_h[h] = c[0]
      h += 1
    else
      arr_m[m] = c[0]
      m += 1
    end
  end
  puts 'Hombres'
  print "#{arr_h}\n"
  puts 'Mujeres'
  print "#{arr_m}\n"
end

op_usuario = 0
while op_usuario != 10
  menu
  op_usuario = gets.chomp.to_i
  validador(op_usuario)
  case op_usuario
  when 1
    puts 'Registar datos'
    registrador(personas)
    lista(personas)
    espera
  when 2
    mostrar(personas)
    puts "\nDe quien deseas editar los datos?"
    editado = gets.chomp
    editador(editado, personas)
    lista(personas)
    espera
  when 3
    mostrar(personas)
    puts "\nA quien deseas eliminar?"
    eliminar = gets.chomp
    eliminador(eliminar, personas)
    lista(personas)
    espera
  when 4
    mostrar(personas)
    puts "\nLa cantidad de personas total es:"
    contador(personas)
    espera
  when 5
    puts 'Las comunas son:'
    comunador(personas)
    espera
  when 6
    puts 'Las personas entre 20 y 25 años son: '
    personador(personas)
    espera
  when 7
    puts 'La suma total de edades es: '
    sumador(personas)
    espera
  when 8
    puts 'El promedio de edades es: '
    promediador(personas)
    espera
  when 9
    generador(personas)
    espera
  when 10
    puts '--> FIN DEL PROGRAMA'
  end
end
