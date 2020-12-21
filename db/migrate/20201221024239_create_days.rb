class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :picture
      t.date :date
      t.text :note
      t.belongs_to :bebe

      t.timestamps
    end
  end
end
