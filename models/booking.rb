class Booking
  attr_reader :activity, :member
  attr_accessor :id

  def initialize(attr = {})
    @id = attr[:id]
    @activity = attr[:activity]
    @member = attributes[:member]
  end
end
