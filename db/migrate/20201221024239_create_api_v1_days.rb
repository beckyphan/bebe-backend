class CreateApiV1Days < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_days do |t|
      t.string :picture
      t.date :date
      t.text :note
      t.belongs_to :bebe

      t.timestamps
    end
  end
end
