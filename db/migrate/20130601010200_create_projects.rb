class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :length
      t.string :project_type
      t.string :hometown
      t.text :details
      t.date :startdate
      t.text :schedule_info

      t.timestamps
    end
  end
end
