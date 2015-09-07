class Client < ActiveRecord::Base
  validates :application_date, presence: true
  has_one :bike
  belongs_to :agency

  def self.waiting_list
    clients = Client.all
    non_voided_clients = clients.select{|client| !client.application_voided}
    waiting_list_with_null_application_dates = non_voided_clients.select{|client| !client.completion_date}
    waiting_list = waiting_list_with_null_application_dates.select{|client| !client.application_date.nil?}
    waiting_list.sort_by!{|client| client.application_date}
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def self.closed_applications
    Client.all.select{|client| client.application_voided || client.completion_date}
  end

  def bike
    Bike.find(self.bike_id)
  end

end
