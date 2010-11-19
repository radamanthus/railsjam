Then /^a user with login "([^"]*)" should be created$/ do |login|
  user = User.find_by_login login
  assert_not_nil user
  assert !user.new_record?
end

Given /^a user with email "([^"]*)" exists$/ do |email|
  user = Factory.create(:user, :email => email)
  assert !user.new_record?
end

