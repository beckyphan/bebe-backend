class AddImgToBebe < ActiveRecord::Migration[6.0]
  def change
    add_column :bebes, :img, :string
  end
end
