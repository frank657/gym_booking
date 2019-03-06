
class Activity
  attr_reader :name, :max_occupancy, :time_slot, :availability
  attr_accessor :id, :trainer, :bookings

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @max_occupancy = attr[:max_occupancy] || 30
    @bookings_size = attr[:bookings_size] || 0
    @trainer = attr[:trainer]
    @time_slot = attr[:time_slot]
    @bookings = []
    # @availability = "#{@bookings.size} / #{@max_occupancy}"
  end

  def available?
    @bookings.size < @max_occupancy
  end

  def sign_up(booking)
    if available?
      @bookings << booking
      booking.activity = self
      @bookings_size = @bookings.size
      # @availability = "#{@bookings.size} / #{@max_occupancy}"
      return true
    else
      puts "Sorry activity class full"
      return false
    end
  end
end


