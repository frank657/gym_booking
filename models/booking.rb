class Booking
  attr_reader :member
  attr_accessor :id, :activity

  def initialize(attr = {})
    @id = attr[:id]
    @activity = attr[:activity]
    @member = attr[:member]
  end
end
