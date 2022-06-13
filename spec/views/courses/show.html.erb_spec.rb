require 'rails_helper'

RSpec.describe "courses/show", type: :view do
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

  it "renders attributes in div.field" do
    render

    assert_select "h1", "Title 1"
    assert_select "h2", 5
  end
end
