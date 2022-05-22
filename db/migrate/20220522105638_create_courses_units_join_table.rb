class CreateCoursesUnitsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :units do |t|
      t.index :course_id
      t.index :unit_id
    end
  end
end
