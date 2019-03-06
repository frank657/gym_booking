# TODO: implement the router of your app.
require_relative 'controllers/members_controller'

class Router
# ask what user wants to do
# list meals/ add meals
  def initialize(controller)
    @controller = controller
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
    puts "3. Exit"
  end

  def get_choice(choice)
    case choice
      when 1 then @controller.list
      when 2 then @controller.add
      when 3 then stop!
      else puts "Please choose 1, 2 or 3"
    end
  end

  def stop!
    @stop = true
  end
end
