require_relative '../models/employee'
require_relative '../views/employees_view'

class EmployeesController
  def initialize(repository)
    @repository = repository
    @view = EmployeesView.new
  end

  def list_trainers
    # display trainer list with its activity
    trainers = @repository.all_trainers
    @view.display_trainers(trainers)
  end
end

  # def ask_for_username
  #   @view.ask_for_username
  # end

  # def ask_for_password
  #   @view.ask_for_password
  # end

  # def check_credential?(username, password)
  #   if !@repository.find_by_username(username) || (@repository.find_by_username(username).password != password)
  #     @view.display_wrong_credentials
  #     matched = false
  #   else
  #     @view.display_welcome_message(username)
  #     matched = true
  #   end
  #   return matched
  # end

  # def check_manager?(username)
  #   @repository.manager?(username)
  # end

  # def employee_instance(username)
  #   @repository.find_by_username(username)
  # end
