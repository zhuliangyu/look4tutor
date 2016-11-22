require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :rate => 1,
      :body => "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_rate[name=?]", "comment[rate]"

      assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
