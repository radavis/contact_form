require 'spec_helper'

feature "Submit a contact inquiry", %q{
  As a site visitor
  I want to contact DogHub staff
  So that I can tell them how awesome they are
} do

# Acceptance Criteria:
# * I must specify a valid email address
# * I must specify a subject
# * I must specify a description
# * I must specify a first name
# * I must specify a last name

  scenario 'with all fields completed' do
    visit '/feedbacks/new'

    fill_in 'Email', with: 'someone@gmail.com'
    fill_in 'Subject', with: 'Awesome Service!'
    fill_in 'Description', with: 'Will use again.'
    fill_in 'First name', with: 'Jimmy'
    fill_in 'Last name', with: 'Someone'
    click_button 'Submit'

    expect(page).to have_content('Thanks for your feedback!')
  end

  scenario 'without filling out the form' do
    visit '/feedbacks/new'
    click_button 'Submit'
    expect(page).to have_content("can't be blank")
  end
end



feature "Browse contact inquiries", %q{
  As an admin
  I want to review contact inquiries
  So that I can respond or take action
} do

# Acceptance Criteria:
# * I can see a list of all contact inquiries

  scenario 'view feedback' do
    visit '/feedbacks'
    expect(page).to have_content("Feedback Listing")
  end

  scenario 'view feedback list after submission' do
    FactoryGirl.create(:feedback, first_name: "Dan")
    visit '/feedbacks'
    expect(page).to have_content('Dan')
  end
end



feature "Delete a contact inquiry", %q{
  As an admin
  I want to delete an inquiry
  So that I can remove spam or other undesirable inquiries
} do

# Acceptance Criteria:
# * I can remove an item from the listing of contact inquiries

  scenario 'delete feedback' do
    spammer = FactoryGirl.create(:feedback, first_name: "Spammer")

    visit '/feedbacks/'
    page.driver.submit :delete, "/feedbacks/#{spammer.id}", {}

    expect(page).not_to have_content('Spammer')
  end
end
