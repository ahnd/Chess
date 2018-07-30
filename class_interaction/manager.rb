require_relative "employee"
require 'byebug'

class Manager < Employee
attr_reader :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end


  def bonus(num)
    self.total_salaries * num
  end

  protected

  def total_salaries
    salaries = 0
    @employees.each do |employee|
      if employee.is_a? Manager
        salaries += employee.salary + employee.total_salaries
      else
        salaries += employee.salary
      end
    end
    # sum = salaries.reduce(:+)
    salaries
  end

end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("ned", "founder", 1000000, nil)
  darren = Manager.new("darren", "TA Manager", 78000, ned)
  shawna = Employee.new("shawna", "TA", 12000, darren)
  david = Employee.new("david", "ta", 10000, darren)
  darren.bonus(2)
end
