class Client < ActiveRecord::Base
  belongs_to :bike, optional: true
  belongs_to :agency

  before_update :stamp_assigned_date, if: proc { !bike_id_was && bike_id_changed? }

  def self.waiting_list
    clients = Client.all
    nonvoided_clients = clients.select{|client| !client.application_voided}
    active_nonvoided_clients = nonvoided_clients.select{|client| !client.pickup_date}
    waiting_list = active_nonvoided_clients.select{|client| !client.application_date.nil?}
    waiting_list.sort_by!{|client| client.application_date}
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def self.closed_applications
    Client.all.order(pickup_date: :desc).select{|client| client.pickup_date}
  end

  def self.voided_applications
    Client.all.where(application_voided: true)
  end

  private

  def stamp_assigned_date
    self.assigned_bike_at = Time.zone.now
  end

end
