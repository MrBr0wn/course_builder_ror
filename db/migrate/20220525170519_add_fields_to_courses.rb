class AddFieldsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :price, :decimal
    add_column :courses, :annotation, :string
    add_column :courses, :description_text, :string
    add_column :courses, :volume, :string
  end
end
