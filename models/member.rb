class Member
  attr_accessor :id, :name

  def initialize(attr)
    @id   = attr[:id]
    @name = attr[:name]
  end
end
