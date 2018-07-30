class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end


end
