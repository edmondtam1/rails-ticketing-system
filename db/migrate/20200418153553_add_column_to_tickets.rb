class AddColumnToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :project_id, :integer
    add_foreign_key :tickets, :projects
  end
end
