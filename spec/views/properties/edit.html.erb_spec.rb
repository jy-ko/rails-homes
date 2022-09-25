require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      name: "MyString",
      user: nil,
      address: "MyString",
      latitude: 1.5,
      longitude: 1.5,
      price: 1,
      currency: "MyString",
      surface_area: 1.5,
      bed: 1,
      bath: 1.5,
      floor: 1
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "input[name=?]", "property[name]"

      assert_select "input[name=?]", "property[user_id]"

      assert_select "input[name=?]", "property[address]"

      assert_select "input[name=?]", "property[latitude]"

      assert_select "input[name=?]", "property[longitude]"

      assert_select "input[name=?]", "property[price]"

      assert_select "input[name=?]", "property[currency]"

      assert_select "input[name=?]", "property[surface_area]"

      assert_select "input[name=?]", "property[bed]"

      assert_select "input[name=?]", "property[bath]"

      assert_select "input[name=?]", "property[floor]"
    end
  end
end
