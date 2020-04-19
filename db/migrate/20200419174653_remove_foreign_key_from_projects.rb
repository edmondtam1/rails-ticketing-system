class RemoveForeignKeyFromProjects < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:tickets, :projects)
      remove_foreign_key :tickets, :projects
    end
  end
end
