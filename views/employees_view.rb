class EmployeesView
  def ask_id
    puts "Employee ID?"
    return gets.chomp.to_i
  end

  def display_trainers(trainers)
    puts "ID  | Name      | Activity      "
    trainers.each do |t|
      puts "#{trainer.id} | #{trainer.name} | #{trainer.activity.name}"
    end
  end
end
