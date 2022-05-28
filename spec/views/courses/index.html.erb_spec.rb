require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        body: "Content of the body",
        title: "Title 1",
        active: true,
        description_text: "Description text 1",
        price: 100.00
      ),
      Course.create!(
        body: "Content of the body",
        title: "Title 2",
        active: true,
        description_text: "Description text 2",
        price: 200.00
      )
    ])
  end

  it "renders a list of courses" do
    render
  end
end
