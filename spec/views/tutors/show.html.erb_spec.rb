require 'rails_helper'

RSpec.describe "tutors/show", type: :view do
  before(:each) do
    @tutor = assign(:tutor, Tutor.create!(
      :degree => "Degree",
      :low_price => 2,
      :high_price => 3,
      :cellphone => "Cellphone",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Degree/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Cellphone/)
    expect(rendered).to match(//)
  end
end
