require 'rails_helper'

RSpec.describe "units/edit", type: :view do
  fixtures :all

  it "renders the edit unit form" do
    @unit = units(:unit_1)
    @course = courses(:course_1)

    render

    assert_select "form[action=?][method=?]", course_unit_path(@course, @unit), "post" do
    end
  end
end
