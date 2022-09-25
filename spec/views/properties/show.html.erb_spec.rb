require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8/)
  end
end
