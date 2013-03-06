class FixPersonExchangeTime < ActiveRecord::Migration
  def change
    remove_column :people, :time
    remove_column :people, :time_exchange

    add_column :people, :exchange_at, :datetime
  end

end
