class Employee
  attr_reader :name, :email
  attr_writer :salry, :deposit_account

  def initialize(name, email, salary, deposit_account)
    @name = name
    @email = email
    @salary = salary
    @deposit_account = deposit_account
  end
  
  
  def vacation_days
    coefficient * 7  
  end

  def bonus
    coefficient * 1000
  end

  def to_s
    "#{@name} <email: #{@email}> acct: *****#{transform}"
  end
  
  protected
  def transform
    r=""
    @deposit_account.split("").each{|numb| r << numb if numb != "-"}
    r[-4..-1]
  end 
  
  private
  def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end
end

employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s

str = "The employee information is #{employee}"
puts str

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200 