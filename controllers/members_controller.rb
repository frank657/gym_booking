require_relative '../repositories/member_repository'
require_relative '../views/members_view'
require_relative '../models/member'

class MembersController
  def initialize(members_repo)
    @members = members_repo
    @view = MembersView.new
  end

  def list
    @view.display(@members)
  end

  def add
    @view.display(@members)
    name = @view.get_name
    member = Member.new(name: name)
    @members.add(member)
  end
end

