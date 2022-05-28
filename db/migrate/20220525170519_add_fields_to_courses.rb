class AddFieldsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :price, :decimal, precision: 8, scale: 2
    add_column :courses, :annotation, :string
    add_column :courses, :description_text, :string
    add_column :courses, :volume, :string
  end
end
