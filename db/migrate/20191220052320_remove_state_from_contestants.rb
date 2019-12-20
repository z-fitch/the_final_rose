class RemoveStateFromContestants < ActiveRecord::Migration[5.2]
  def change
    remove_column :contestants, :state, :string
  end
end
