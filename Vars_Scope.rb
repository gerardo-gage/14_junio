#Scope
local_var = "this is my local var"
def return_my_local_val
  local_var
end
#Marca un error ya que que no hay una variable local "local_var" definida para el método
def return_my_local_val
  local_var = "asnajkn"
end
puts return_my_local_val
#Se corrojió el error definiendo la variable dentro del método, esto para hacerla local
#Lo que sigue es encerrar el código dentro de una clase llama DummyClass
class DummyClass
  def return_my_local_val
    local_var = "asnajkn" 
  end
  puts return_my_local_val
end
dummy1 = DummyClass.new
dummy1.return_my_local_val
# => "asnajkn"
#Lo que sigue es encerrar la definición de "local_var" dentro de initialize
class DummyClass

  def initialize(local_var)
  end

  def return_my_local_val
    local_var = "asnajkn" 
  end
  puts return_my_local_val
end
dummy2 = DummyClass.new #Me pide dar un argumento a la función que corresponde a local_var
dummy2 = DummyClass.new("adacaca") #
dummy2.return_my_local_val
# => "asnajkn"; Por lo que el método no cambia el resultado a pesar de haber dado un nuevo valor
#Al parámetro de local var
#Para el siguiente paso crearemos una variable de instancia en el método initialize
class DummyClass

  def initialize(local_var)
    @instance_var=local_var
  end

  def return_my_local_val
    @instance_var  
  end
end
dummy2 = DummyClass.new("adacaca") 
dummy2.return_my_local_val
# => "adacaca"; se solucionó el problema creando la variable de instancia
#El siguiente paso es definir los métodos getter y setter para mi variable de instancia
#Éstos métodos son para leer y escribir variables de instancia
class DummyClass

  def initialize(local_var)
    @instance_var=local_var
  end

  def return_my_local_val
    @instance_var  
  end

  def instance_var
    @instance_var
  end

  def instance_var=(value)
    @instance_var = value
  end
end
dummy2 = DummyClass.new("adacaca") 
dummy2.return_my_local_val
p dummy2.instance_var=("Bar")
p dummy2.instance_var   =    "Baz"
#Ahora trabajemos con las variables de clase
class DummyClass
  @@class_variable = "This is a class variable"

  def initialize(local_var)
    @instance_var=local_var
  end

  def return_my_local_val
    @instance_var  
  end

  def instance_var
    @instance_var
  end

  def instance_var=(value)
    @instance_var = value
  end

  def class_variable
    @@class_variable
  end

  def class_variable=(value)
    @@class_variable = value
  end
end

dummy_1 = DummyClass.new("abcd")
dummy_2 = DummyClass.new("defg")
dummy_1.class_variable == dummy_2.class_variable
dummy_1.class_variable = "New value for the class variable"
dummy_1.class_variable == dummy_2.class_variable #En las dos pruebas da true
#Esto es porque al ser "class_variable" una variable de clase, si se cambia el
#valor de una de las instancias creadas, se cambiará para todas las instancias
#Veamos las variables globales y las CONSTANTES
$global_var = "This is a global variable"
CONSTANT = 3.1416

def global_var
  $global_var 
end

def global_var=(value)
  $global_var = value
end

def CONSTANT
  CONSTANT 
end

def CONSTANT=(value)
  CONSTANT = value
end

class DummyClass
  $global_var = "This is a global variable"
  CONSTANT = 3.1416
  @@class_variable = "This is a class variable"

  def initialize(local_var)
    @instance_var=local_var
  end

  def return_my_local_val
    @instance_var  
  end

  def instance_var
    @instance_var
  end

  def instance_var=(value)
    @instance_var = value
  end

  def class_variable
    @@class_variable
  end

  def class_variable=(value)
    @@class_variable = value
  end

  def global_var
    $global_var 
  end

  def global_var=(value)
    $global_var = value
  end

  def CONSTANT
    CONSTANT 
  end

  def CONSTANT=(value)
    CONSTANT = value
  end
end

global_var
dummy_1 = DummyClass.new("adada")
dummy_1.global_var
global_var = "Yeah!"
dummy_1.global_var #Aparece como método privado
global_var
CONSTANT
CONSTANT = 4242 #La variable se modifica pero aparece un warning
#sobre el cambió que se realizó, previamente no se pudo crear un 
#setter para la constante









