module MyAttr

  def my_writer(attr_name)
    define_method("#{attr_name}=") do |value|
      instance_variable_set("@" + attr_name.to_s, value)
    end
  end

end


class Cat
  #Use extend instead of include so that my_reader is a class method
  extend MyAttr
  my_writer :name

  def initialize(name)
    @name = name
  end
end

gato = Cat.new("Tobias")

gato.name = "New Tobias"

p gato


#Example 2 giving more args to my_writer
module MyAttr2
  def my_writer_2(*args)
  # *args lets you pass more than one attribute names. For each of these a corresponding method is defined
     args.each do |arg|
      define_method("#{arg}=") do |value|
        instance_variable_set("@"+ arg.to_s, value)
      end
    end
  end
end


class Dog
extend MyAttr2
my_writer_2 :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

end

cao = Dog.new("Pluto", "Chiwawa")
cao.name = "New Pluto"
cao.breed = "Rottweiler"

p cao
