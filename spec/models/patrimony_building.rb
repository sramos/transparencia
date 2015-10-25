require 'rails_helper'

describe PatrimonyBuilding do
  let(:patrimony_building) { build(:patrimony_building) }

  it "should be valid" do
    expect(patrimony_building).to be_valid
  end

  it "should not be valid without address" do
    patrimony_building.address = nil
    expect(patrimony_building).to_not be_valid
  end

  if "should not be valid without registry number" do
    patrimony_building.registry_number = nil
    expect(patrimony_building).to_not be_valid
  end

  if "should not be valid without application date" do
    patrimony_building.application_date = nil
    expect(patrimony_building).to_not be_valid
  end
end
