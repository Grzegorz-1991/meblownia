class CreateMebles < ActiveRecord::Migration[6.0]
  def change
    create_table :mebles do |t|
      t.string :nazwa
      t.string :rodzaj
      t.text :opis
    end
  end
end
