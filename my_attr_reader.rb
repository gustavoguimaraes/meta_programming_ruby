module MyAttr
  def my_reader(attr_name)
    define_method(attr_name) do
      instance_variable_get("@"+ attr_name.to_s)
    end
  end
end


class Cat
  #Use extend instead of include so that my_reader is a class method
  extend MyAttr
  my_reader :name

  def initialize(name)
    @name = name
  end
end

gato = Cat.new("Tobias")

p gato.name


#Example 2 giving more args to my_reader
module MyAttr2
  def my_reader_2(*args)
    # *args lets you pass more than one attribute names. For each of these a corresponding method is defined
    args.each do |arg|
      define_method(arg) do
        instance_variable_get("@" + arg.to_s)
      end
    end
  end
end


class Dog
extend MyAttr2
my_reader_2 :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

end

cao = Dog.new("Pluto", "Chiwawa")

p cao.name
p cao.breed
