class Show

  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    get_salary = @characters.map{|character| character.salary}
    get_salary.sum
  end

end
