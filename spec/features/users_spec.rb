require "rails_helper"

RSpec.feature "Users", :type => :feature do
  let(:password) {"123"}
  let(:user) {User.create(email: "test10@gmail.com", password: password, password_confirmation: password,
                          first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}

  before do
    visit '/sessions/new'

    fill_in "Email", with: user.email
    fill_in "Password", with: password

    click_button "Log In"
  end

  scenario "Should open users profile" do
    expect(page).to have_text("Logged in as #{user.email}")
    expect(page).to have_text(user.full_name)
    expect(page).to have_selector("a[href='/ukrainian_tours']")
    expect(page).to have_selector("a[href='/european_tours']")
    expect(page).to have_selector("a[href='#{edit_user_path(user)}']")
    expect(page).to have_selector("a[href='#{user_path(user)}']")
  end

  scenario "When click edit link should render edit form" do
    click_link "Edit"

    expect(page).to have_selector("input[type=submit][value='Save Profile']")
  end

  scenario "When click logout link should render login form" do
    click_link "Log Out"

    expect(page).to have_selector("input[type=submit][value='Log In']")
  end

  scenario "When click delete link should " do
    click_link "Delete"

    expect(page).to  have_selector("input[type=submit][value='Sign Up']")
  end


end