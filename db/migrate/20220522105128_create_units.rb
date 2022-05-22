class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :position
      t.text :body

      t.timestamps
    end
  end
end
