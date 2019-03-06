require_relative '../models/member'
require 'csv'

class MemberRepository
  def initialize(csv_file)
    @members = []
    @csv_file = csv_file
    @next_id = 1

    load_csv if File.exist?(@csv_file)
  end

  def all
    @members
  end

  def add(member)
    member.id = @next_id
    @members << member
    @next_id += 1
    save_csv
  end

  def find(i)
    @members.find { |member| member.id == i }
  end

  def load_csv
    @csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      @members << Member.new(row)
    end
    @next_id = @members.empty? ? 1 : @members.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name']
      @members.each do |member|
        csv << [member.id, member.name]
      end
    end
  end
end
