
class Activity
  attr_reader :name, :max_occupancy, :time_slot
  attr_accessor :id, :trainer

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @max_occupancy = attr[:max_occupancy] || 30
    @trainer = attr[:trainer]
    @time_slot = attr[:time_slot]
  end
end
