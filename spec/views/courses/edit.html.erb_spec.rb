require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  fixtures :all

  before(:each) do
    @course = assign(:course, Course.create!(
      body: "Content of the body",
      title: "Title 1",
      active: true,
      description_text: "Description text 1",
      price: 100.00
    ))
    @units = units(:unit_1, :unit_2)
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do
      assert_select "input[name=?]", "course[title]"
      assert_select "input[name=?]", "course[price]"
      assert_select "textarea[name=?]", "course[body]"
      assert_select "textarea[name=?]", "course[annotation]"
      assert_select "textarea[name=?]", "course[description_text]"
      assert_select "textarea[name=?]", "course[volume]"
      assert_select "input[name=?]", "course[active]"
    end
  end
end
