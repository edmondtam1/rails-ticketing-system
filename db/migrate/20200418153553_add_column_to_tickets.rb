class AddColumnToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :project, foreign_key: true
  end
end
