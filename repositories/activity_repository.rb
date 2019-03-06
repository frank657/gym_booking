require 'csv'
require_relative '../models/activity'

class ActivityRepository
  def initialize(csv_file_path)
    @activities = []
    @csv_file_path = csv_file_path
    load_csv if File.exist?(csv_file_path)
  end

  def load_csv
    @csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:name]  = row[:name]
      row[:max_occupancy] = row[:max_occupancy] || 30
      row[:time_slot] = row[:time_slot]

      @activities << activity.new(row)
    end
  end

  def all
    return @activities
  end

  def add(activity)
    @next_id = @activities.empty? ? 1 : @activities.last.id + 1
    activity.id = @next_id

    @activities << activity
    saving_csv
  end

  def find(id)
    @activities.find { |x| x.id == id }
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'max_occupancy', 'time_slot']
      @activities.each do |activity|
        csv << [activity.id, activity.name, activity.max_occupany, activity.trainer, activity.time_slot]
      end
    end
  end
end
