class AddTimeExchangeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :time_exchange, :string
  end
end
