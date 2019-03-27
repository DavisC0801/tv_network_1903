class Network

  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    hi = 0
    @shows.each do |show|
      hi = show.characters.max_by{|character| character.salary}
    end
    hi.actor
  end

  def payroll
    payrollhash = {}
    @shows.each do |show|
      show.characters.each do |character|
        payrollhash.store(character.actor, character.salary)
      end
    end
    payrollhash
  end
end
