class BookingsView
  def display_bookings(array)
    array.each do |x|
      puts "#{id}. #{activity.name} - #{activity.id} #{member.name}"
    end
  end

  def ask_activity_id
    puts "Activity id to add"
    gets.chomp.to_i
  end

  def ask_member_id
    puts "Member id to add"
    gets.chomp.to_i
  end
end
