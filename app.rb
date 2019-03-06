require_relative 'router'
require_relative 'controllers/members_controller'
require_relative 'repositories/member_repository'


file = 'data/member.csv'
depo = MemberRepository.new(file)
controller = MembersController.new(depo)
router = Router.new(controller)

router.run
