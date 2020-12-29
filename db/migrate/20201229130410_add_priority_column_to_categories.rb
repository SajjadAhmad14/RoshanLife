class AddPriorityColumnToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :priority, :integer, default: 1
  end
end
