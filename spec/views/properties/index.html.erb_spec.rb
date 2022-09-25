require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        name: "Name",
        user: nil,
        address: "Address",
        latitude: 2.5,
        longitude: 3.5,
        price: 4,
        currency: "Currency",
        surface_area: 5.5,
        bed: 6,
        bath: 7.5,
        floor: 8
      ),
      Property.create!(
        name: "Name",
        user: nil,
        address: "Address",
        latitude: 2.5,
        longitude: 3.5,
        price: 4,
        currency: "Currency",
        surface_area: 5.5,
        bed: 6,
        bath: 7.5,
        floor: 8
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Currency".to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.5.to_s, count: 2
    assert_select "tr>td", text: 8.to_s, count: 2
  end
end
