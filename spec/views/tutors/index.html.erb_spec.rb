require 'rails_helper'

RSpec.describe "tutors/index", type: :view do
  before(:each) do
    assign(:tutors, [
      Tutor.create!(
        :degree => "Degree",
        :low_price => 2,
        :high_price => 3,
        :cellphone => "Cellphone",
        :user => nil
      ),
      Tutor.create!(
        :degree => "Degree",
        :low_price => 2,
        :high_price => 3,
        :cellphone => "Cellphone",
        :user => nil
      )
    ])
  end

  it "renders a list of tutors" do
    render
    assert_select "tr>td", :text => "Degree".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Cellphone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
