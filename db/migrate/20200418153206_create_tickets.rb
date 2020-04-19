class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name, :body, :status
      t.timestamps
    end
  end
end
