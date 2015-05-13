require './coffee'

class Human
  def initialize(name)
    @name = name
    @alert = 0
    @coffee = nil
  end

  def alertness
    @alert
  end

  def has_coffee?
    @coffee =~ /\w/
  end

  def needs_coffee?
    @coffee == nil
  end

  def buy(coffee)
    @coffee = coffee
  end

  def drink!
    @alert += 0.33
    @coffee.drink_coffee
  end
end
