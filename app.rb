require_relative 'router'
Dir["controllers/*.rb"].each {|file| require_relative file }
Dir["repositories/*.rb"].each {|file| require_relative file }
# require_relative 'controllers/members_controller'
# require_relative 'repositories/member_repository'

member_file = 'data/member.csv'
member_depo = MemberRepository.new(member_file)
members_controller = MembersController.new(member_depo)

employee_file = 'data/employee.csv'
employee_depo = EmployeeRepository.new(employee_file)
employees_controller = EmployeesController.new(employee_depo)

activity_file = 'data/activity.csv'
activity_depo = ActivityRepository.new(activity_file, employee_depo, member_depo)
activities_controller = ActivitiesController.new(activity_depo)

booking_file = 'data/booking.csv'
booking_depo = BookingRepository.new(booking_file, activity_depo, member_depo)
bookings_controller = BookingsController.new(activity_depo, member_depo, booking_depo)

router = Router.new(members_controller, employees_controller, activities_controller, bookings_controller)
router.run
