require_relative '../models/activity'
require_relative '../repositories/activity_repository'
require_relative '../views/activities_view'

# Activity Controller to add activities and list them
class ActivitiesController
  def initialize(activity_respository)
    @activityrepository = activity_respository
    @activitiesview = ActivitiesView.new
  end

  def add
    id = @activitiesview.add_activity_id
    name = @activitiesview.add_activity_name
    max_occ = @activitiesview.add_activity_max_occupancy
    trainer = @activitiesview.add_activity_trainer
    time_slot = @activitiesview.add_activity_time_slot

    activity = Activity.new(id: id, name: name, max_occupancy: max_occ, trainer: trainer, time_slot: time_slot)
    @activityrepository.add(activity)
  end

  def list
    array = @activityrepository.all
    @activitiesview.display_activivies(array)
  end
end
