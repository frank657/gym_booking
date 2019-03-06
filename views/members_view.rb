class MembersView
  def display(members)
    members.all.each do |member|
      puts "#{member.id.to_s}. #{member.name}"
    end
  end

  def ask_name
    puts "What is the name of the member?"
    print "> "
    gets.chomp
  end
end
