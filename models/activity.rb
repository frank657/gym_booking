
class Activity
  attr_reader :name, :max_occupancy, :time_slot, :availability
  attr_accessor :id, :trainer, :bookings

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @max_occupancy = attr[:max_occupancy] || 30
    @trainer = attr[:trainer]
    @time_slot = attr[:time_slot]
    @bookings = []
    @availability = "0 / #{@max_occupancy}"
  end

  def available?
    @bookings.size < @max_occupancy
  end

  def sign_up(booking)
    if available?
      @bookings << booking
      booking.activity = self
      @availability = "#{@booking.size} / #{@max_occupancy}"
    else
      puts "Sorry activity class full"
    end
  end
end


