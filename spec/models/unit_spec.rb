require 'rails_helper'

RSpec.describe Unit, type: :model do
  context "validations tests" do
    

    it "ensures the name is present" do
      unit = Unit.new(name: "Content of the body")
      expect(unit.valid?).to eq(false)
    end

    it "ensures the body is present" do
      unit = Unit.new(body: "Title")
      expect(unit.valid?).to eq(false)
    end

    it "ensures the position is present" do
      unit = Unit.new(position: "2")
      expect(unit.valid?).to eq(false)
    end
  end

  context 'actions' do
    it "should be able to save unit" do
      unit = Unit.new(body: "Content of the body", name: "Title unit", position: "3")
      expect(unit.save).to eq(true)
    end
  end

  context 'associations tests' do
    fixtures :all

    describe '#name' do
      it 'should return name' do
        unit = units(:unit_1)
        expect(unit.name).to eq('test unit 1')
      end
    end

    describe 'relationship' do
      it 'should have many courses' do
        subject { described_class.new }
        assoc = described_class.reflect_on_association(:courses)
        expect(assoc.macro).to eq :has_and_belongs_to_many
      end
    end
  end
end
