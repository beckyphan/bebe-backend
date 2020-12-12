class CreateBebes < ActiveRecord::Migration[6.0]
  def change
    create_table :bebes do |t|
      t.string :name
      t.date :birthdate
      t.string :kind
      t.text :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end
