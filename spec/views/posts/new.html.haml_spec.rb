require 'spec_helper'

describe "posts/new.html.haml" do
  before(:each) do
    assign(:post, stub_model(Post,
      :new_record? => true,
      :title => "MyString",
      :tags => "MyString",
      :body => "MyText",
      :publsihed => false
    ))
  end

  it "renders new post form" do
    render

    rendered.should have_selector("form", :action => posts_path, :method => "post") do |form|
      form.should have_selector("input#post_title", :name => "post[title]")
      form.should have_selector("input#post_tags", :name => "post[tags]")
      form.should have_selector("textarea#post_body", :name => "post[body]")
      form.should have_selector("input#post_publsihed", :name => "post[publsihed]")
    end
  end
end
