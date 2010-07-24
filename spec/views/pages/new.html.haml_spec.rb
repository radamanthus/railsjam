require 'spec_helper'

describe "pages/new.html.haml" do
  before(:each) do
    assign(:page, stub_model(Page,
      :new_record? => true,
      :title => "MyString",
      :body => "MyText",
      :published => false
    ))
  end

  it "renders new page form" do
    render

    rendered.should have_selector("form", :action => pages_path, :method => "post") do |form|
      form.should have_selector("input#page_title", :name => "page[title]")
      form.should have_selector("textarea#page_body", :name => "page[body]")
      form.should have_selector("input#page_published", :name => "page[published]")
    end
  end
end
