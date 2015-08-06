class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :quantity

      t.timestamps
    end
  end
end
