require 'rails_helper'

RSpec.describe Course, type: :model do
  context "validations tests" do
    

    it "ensures the title is present" do
      course = Course.new(body: "Content of the body")
      expect(course.valid?).to eq(false)
    end

    it "ensures the body is present" do
      course = Course.new(title: "Title")
      expect(course.valid?).to eq(false)
    end
  end

  context 'actions' do
    before(:each) do
      @course = Course.new(body: "Content of the body", title: "Title")
    end

    it "ensures the course is active by default" do
      expect(@course.active?).to eq(true)
    end

    it "should be able to save course" do
      expect(@course.save).to eq(true)
    end
  end


  context "scopes tests" do
    let(:params) { { body: "Content of the body", title: "Title", active: true } }
    before(:each) do
      Course.create!(params)
      Course.create!(params)
      Course.create!(params)
      Course.create!(params.merge(active: false))
      Course.create!(params.merge(active: false))
    end

    it "should return all active articles" do
      puts Course.active.count
      expect(Course.active.count).to eq(3)
    end

    it "should return all inactive articles" do
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
