class AddTicketValueToParties < ActiveRecord::Migration
  def change
    add_column :parties, :ticket_value, :decimal, precision: 5, scale: 2, default: 0
  end
end
