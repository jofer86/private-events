class AddCreatorToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :creator_id, :integer
    add_foreign_key :users, :events, column: :creator_id
  end
end
