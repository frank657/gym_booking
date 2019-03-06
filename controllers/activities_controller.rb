require_relative '../models/activity'
require_relative '../repositories/activity_repository'
require_relative '../views/activities_view'

# Activity Controller to add activities and list them
class ActivitiesController
  def initialize(activity_respository)
    @activity_repository = activity_respository
    @activities_view = ActivitiesView.new
  end

  def add_activity
    id = @activities_view.add_activity_id
    name = @activities_view.add_activity_name
    max_occ = @activities_view.add_activity_max_occupancy
    trainer = @activities_view.add_activity_trainer
    time_slot = @activities_view.add_activity_time_slot

    activity = Activity.new(id: id, name: name, max_occupancy: max_occ, trainer: trainer, time_slot: time_slot)
    @activity_repository.add(activity)
  end

  def list
    array = @activity_repository.all
    @activities_view.display_activivies(array)
end
