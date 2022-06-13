require 'rails_helper'

RSpec.describe "units/new", type: :view do
  fixtures :all


  it "renders new unit form" do
    @unit = units(:unit_1)
    @course = courses(:course_1)

    render
    
    assert_select "form[action=?][method=?]", course_unit_path(@course, @unit), "post" do
    end
  end
end
