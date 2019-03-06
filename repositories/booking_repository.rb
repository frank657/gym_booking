require 'csv'
require_relative '../models/booking'

class BookingRepository
  attr_reader :activity_repository, :member_repository

  def initialize(csv_file_path, activity_repository, member_repository)
    @bookings = []
    @csv_file_path = csv_file_path
    @activity_repository = activity_repository
    @member_repository = member_repository
    load_csv if File.exist?(csv_file_path)
  end

  def load_csv
    @csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:activity] = @activity_repository.find(row[:activity_id].to_i)
      row[:member] = @member_repository.find(row[:member_id].to_i)

      @bookings << Booking.new(row)
    end
  end

  def all
    @bookings
  end

  def add(booking)
    @next_id = @bookings.empty? ? 1 : @bookings.last.id.to_i + 1
    booking.id = @next_id
    if booking.activity.sign_up(booking)
      @bookings << booking
    end
    save_csv
  end

  def find(id)
    @bookings.find { |x| x.id == id }
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'activity_id', 'member_id']
      @bookings.each do |booking|
        csv << [booking.id, booking.activity.id, booking.member.id]
      end
    end
  end
end
