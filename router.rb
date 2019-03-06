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
    welcome
    until @stop
      choices
      puts "Input your choice"
      print "> "
      choice = gets.chomp.to_i
      get_choice(choice)
    end
  end

  def welcome
    banner = File.read('banner.txt')
    print `clear`
    puts ""
    puts ""
    puts ""
    puts "======================================"
    puts "     WELCOME TO SUPER MONKEY GYM"
    puts "======================================"
    puts ""
    puts ""
    puts ""
    puts banner
    # puts "_______AAAA_T_H_E__R_A_K_E_AAAA________\n       VVVV               VVVV\n       (__)               (__)\n        \ \               / /\n         \ \   \\|||//   / /\n          > \   _   _   / <\n hang      > \ / \ / \ / <\n  in        > \\_o_o_// <\n  there...   > ( (_) ) <\n              >|     |<\n             / |\___/| \ \n             / (_____) \ \n             /         \ \n              /   o   \ \n               ) ___ (\n              / /   \ \ \n             ( /     \ ) \n             ><       >< \n            ///\     /\\\ \n            '''       '''"
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "Admire the image"
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print "."
    sleep(0.5)
    print `clear`
  end

  def choices
    puts ""
    puts ""
    puts "==============================="
    puts "            M E N U"
    puts "==============================="
    puts "1. Display all members"
    puts "2. Add a new member"
    puts ""
    puts "3. Display all activities"
    puts "4. Add a new activity"
    puts ""
    puts "5. Make a booking for a member"
    puts "6. Exit"
    puts ""
  end

  def get_choice(choice)
    case choice
      when 1
        print `clear`
        puts "==============================="
        puts "         MEMBER LIST"
        puts "==============================="
        @members_controller.list
      when 2
        print `clear`
        puts "==============================="
        puts "         MEMBER LIST"
        puts "==============================="
        puts ""
        @members_controller.add
      when 3
        print `clear`
        puts "==============================="
        puts "        ACTIVITY LIST"
        puts "==============================="
        puts ""
        @activities_controller.list
      when 4
        print `clear`
        puts "==============================="
        puts "        ACTIVITY LIST"
        puts "==============================="
        puts ""
        @activities_controller.list
        puts ""
        @activities_controller.add
      when 5
        print `clear`
        puts "==============================="
        puts "      BOOKING SYSTEM 2.0"
        puts "==============================="
        puts ""
        puts "ACTIVTIES:"
        @activities_controller.list
        puts ""
        puts ""
        puts "MEMBERS:"
        @members_controller.list
        puts ""
        @bookings_controller.add # assign member
        puts "loading..."
        sleep(3)
        puts "loading..."
        sleep(3)
        puts "still loading..."
        sleep(3)
        puts "FINALLY UPDATED!!!!"
        puts "..."
        @activities_controller.list
      when 6 then
        banner = File.read('banner.txt')
        puts banner
        stop!
      else puts "Please choose 1, 2, 3, 4, 5 or 6"
    end
  end

  def stop!
    @stop = true
  end
end
