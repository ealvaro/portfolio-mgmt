class AddUserIdToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :user_id, :int
  end
end
