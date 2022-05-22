class MakeCourseActiveByDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :active, :boolean, default: true
  end
end
