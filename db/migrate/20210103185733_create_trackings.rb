class CreateTrackings < ActiveRecord::Migration[6.0]
  def change
    create_table :trackings do |t|
      t.string :info_type
      t.time :start_time
      t.time :end_time
      t.float :amount
      t.string :amount_unit
      t.text :note
      t.belongs_to :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
