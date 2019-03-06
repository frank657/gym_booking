# class for activities view screen
class ActivitiesView
  def add_activity_id
    puts 'Insert activity id (number)'
    gets.chomp.to_i
  end

  def add_activity_name
    puts 'Insert activity name'
    gets.chomp
  end

  def add_activity_max_occupancy
    puts 'Insert activity max occupancy'
    gets.chomp.to_i
  end

  def add_activity_trainer
    puts 'Insert activity trainer'
    gets.chomp
  end

  def add_activity_time_slot
    puts 'Insert time slot'
    gets.chomp
  end

  def display_activities(array)
    array.each do |x|
      puts " #{x.id}. #{x.name} - #{x.max_occupancy} - #{x.time_slot} "
    end
  end
end
