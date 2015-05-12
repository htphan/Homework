require './coffee'

class Human
  def initialize(name)
    @name = name
    @alert = 0
    @coffee_avail = "no"
  end

  def alertness
    @alert
  end

  def has_coffee?
    @coffee_avail == "yes"
  end

  def needs_coffee?
    @coffee_avail == "no"
  end

  def buy(coffee)
    @coffee_avail = "yes"
    @coffee_new = coffee
  end

  def drink!
    @alert += 0.33
    @coffee_new.drink_coffee
  end
end
