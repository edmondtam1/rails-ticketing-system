class AddUserToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :user, foreign_key: true
    add_column :tickets, :assignee, :string
  end
end
