require_relative '../models/booking'
require_relative '../views/bookings_view'


class BookingsController
  def initialize(activity_repository, member_repository, booking_repository)
    @bookingrepository = booking_repository
    @activity_repository = activity_repository
    @member_repository = member_repository
    @bookings_view = BookingsView.new
  end

  def add
    activity_id = @bookings_view.ask_activity_id
    member_id = @bookings_view.ask_member_id

    booking = Booking.new(activity: @activity_repository.find(activity_id), member: @member_repository.find(member_id))
    @booking_repository.add(booking)
  end

  def list
    array = @booking_repository.all
    @boookings_view.display_bookings(array)
  end
end
