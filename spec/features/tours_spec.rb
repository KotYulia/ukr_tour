require "rails_helper"

RSpec.feature "Tours", :type => :feature do
  let!(:tour) {Tour.create(user_id: 1, title: "Карпаты", description: "Lorem ipsum...",
                          category: "Туры по Украине", duration: "Карпаты", price: 100)}
  let!(:tour1) {Tour.create(user_id: 2, title: "Париж", description: "Lorem ipsum...",
                           category: "Туры по Европе", duration: "Париж", price: 300)}

  before do
    visit root_path
  end

  scenario "When open european_tours index page" do
    click_link "Туры по Европе"

    expect(page).to have_selector("select[name='duration']")
    expect(page).to have_selector("input[type='text'][name='title']")
    expect(page).to have_selector("input[type='text'][name='min_price']")
    expect(page).to have_selector("input[type='text'][name='max_price']")

    #expect(page).to have_text("#{tour1.title}")
  end

  scenario "When open tour page" do
    #click_on tour1.title

    #expect(page).to have_text("#{tour1.title}")
  end

  scenario "When open ukrainian_tours index page" do
    click_link "Туры по Украине"

    #expect(page).to have_selector("a[href='#{tour_path(tour)}']")
    expect(page).to have_selector("select[name='duration']")
    expect(page).to have_selector("input[type='text'][name='title']")
    expect(page).to have_selector("input[type='text'][name='min_price']")
    expect(page).to have_selector("input[type='text'][name='max_price']")
  end
end