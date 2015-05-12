class Coffee
  def initialize(coffee_name)
    @coffee_name = coffee_name
    @fullness = 3
  end

  def full?
    @fullness == 3
  end

  def empty?
    @fullness == 0
  end

  def bought_coffee
    @fullness = 3
  end

  def drink_coffee
    @fullness -= 1
  end
end
