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
employees_controller = EmployeeController.new(employee_depo)

activity_file = 'data/activity.csv'
activity_depo = ActivityRepository.new(activity_file)
activities_controller = ActivityController.new(activity_depo)

router = Router.new(members_controller, employees_controller, activities_controller)
router.run
