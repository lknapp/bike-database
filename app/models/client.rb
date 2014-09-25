class Client < ActiveRecord::Base
  has_one :bike
  belongs_to :agency

  def self.waiting_list
    clients = Client.all
    non_voided_clients = clients.select{|client| !client.application_voided}
    incomplete_clients = non_voided_clients.select{|client| !client.completion_date}
    waiting_list = incomplete_clients.sort_by!{|client| client.application_date}
  end

end
