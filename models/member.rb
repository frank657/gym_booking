class Member
  attr_accessor :id, :name, :activity

  def initialize(attr)
    @id   = attr[:id]
    @name = attr[:name]
    @activity = attr[:activity]
  end
end
