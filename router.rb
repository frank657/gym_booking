# TODO: implement the router of your app.
require_relative 'controllers/members_controller'
require_relative 'controllers/employees_controller'
require_relative 'controllers/activities_controller'

class Router
# ask what user wants to do
# list meals/ add meals
  def initialize(members_controller, employees_controller, activities_controller, bookings_controller)
    @members_controller = members_controller
    @employees_controller = employees_controller
    @activities_controller = activities_controller
    @bookings_controller = bookings_controller
    @stop = false
  end

  def run
    until @stop
      choices
      puts "Input your choice"
      print "> "
      choice = gets.chomp.to_i
      get_choice(choice)
    end
  end

  def choices
    puts "1. Display all members"
    puts "2. Add a new member"
    puts ""
    puts "3. Display all trainers"
    puts ""
    puts "4. Display all activities"
    puts "5. Add a new activity"
    puts ""
    puts "6. Assign member to an activity"
    puts "7. Exit"
  end

  def get_choice(choice)
    case choice
      when 1 then @members_controller.list
      when 2 then @members_controller.add
      when 3 then @employees_controller.list
      when 4 then @activities_controller.list
      when 5 then @activities_controller.add
      when 6 then @bookings_controller.add # assign member
      when 7 then stop!
      else puts "Please choose 1, 2 or 3"
    end
  end

  def stop!
    @stop = true
  end
end
