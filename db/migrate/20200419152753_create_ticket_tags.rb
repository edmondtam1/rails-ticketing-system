class CreateTicketTags < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_tags do |t|
      t.integer :ticket_id, :tag_id
      t.timestamps
    end
  end
end
