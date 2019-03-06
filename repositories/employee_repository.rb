require_relative '../models/employee'
require 'csv'

class EmployeeRepository
  def initialize(csv_file)
    @employees = []
    @next_id = 1
    @csv_file = csv_file
    load_csv if File.exist?(@csv_file)
  end

  def find(id)
    @employees.select { |x| x.id == id }[0]
  end

  def all
    @employees
  end

  def all_trainers
    @employees.select { |e| e.role == 'trainer' }
  end

  def find_employee_by_name(name)
    @employees.find { |e| e.name == name }
  end

  def delete(id)
    @employees.each_with_index do |x, i|
      @employees.delete_at(i) if x.id == id
    end
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end

  def save_csv
   CSV.open(@csv_file_path, 'wb') do |csv|
     csv << ['id', 'name', 'role', 'activity']
     @employee.each do |employee|
       csv << [employee.id, employee.name, employee.role, employee.activity]
     end
   end

  end
end

  # def find_by_username(username)
  #   @employees.find { |e| e.username == username }
  # end

  # def star?(username)
  #   @employees.find { |e| e.username == username }.manager?
  # end
