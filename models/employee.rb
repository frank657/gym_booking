class Employee
  attr_reader :name, :role
  attr_accessor :id

  def initialize(attr)
    @id = attr[:id]
    @name = attr[:name]
    @role = attr[:role]
    @activity = attr[:activity]
  end
end
