class Client < ActiveRecord::Base
  belongs_to :bike
  belongs_to :agency

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
    Client.all.order(pickup_date: :desc).select{|client| client.application_voided || client.pickup_date}
  end

end
