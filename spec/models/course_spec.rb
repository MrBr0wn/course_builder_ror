require 'rails_helper'

RSpec.describe Course, type: :model do
  context "validations tests" do
    

    it "ensures the body is present" do
      course = Course.new(body: "Content of the body")
      expect(course.valid?).to eq(false)
    end

    it "ensures the title is present" do
      course = Course.new(title: "Title")
      expect(course.valid?).to eq(false)
    end

    it "ensures the description_text is present" do
      course = Course.new(description_text: "Description text")
      expect(course.valid?).to eq(false)
    end

    it "ensures the price is present" do
      course = Course.new(price: 7500.00)
      expect(course.valid?).to eq(false)
    end
  end

  context 'actions' do
    before(:each) do
      @course = Course.new(
        body: "Content of the body",
        title: "Title",
        description_text: "Description text",
        price: 100.00
      )
    end

    it "ensures the course is active by default" do
      expect(@course.active?).to eq(true)
    end

    it "should be able to save course" do
      expect(@course.save).to eq(true)
    end
  end


  context "scopes tests" do
    let(:params) {
      {
        body: "Content of the body",
        title: "Title",
        active: true,
        description_text: "Description text",
        price: 100.00
      }
    }

    before(:each) do
      Course.create!(params)
      Course.create!(params)
      Course.create!(params)
      Course.create!(params.merge(active: false))
      Course.create!(params.merge(active: false))
    end

    it "should return all active courses" do
      expect(Course.active.count).to eq(5)
    end

    it "should return all inactive courses" do
      expect(Course.inactive.count).to eq(2)
    end
  end

  context 'associations tests' do
    fixtures :all

    describe '#title' do
      it 'should return title' do
        course = courses(:course_1)
        expect(course.title).to eq('test course 1')
      end
    end

    describe 'relationship' do
      it 'should have many units' do
        subject { described_class.new }
        assoc = described_class.reflect_on_association(:units)
        expect(assoc.macro).to eq :has_and_belongs_to_many
      end
    end
  end
end
