RSpec.describe 'As a user', type: :feature do
  before(:each) do

    @mech_1 = Mechanic.create(name: "Bob Vance", years_of_experience: 3)
    @mech_2 = Mechanic.create(name: "Bill Guy", years_of_experience: 1)
  end

  describe 'When a user visits a mechanics index page' do
    it 'allows user to see the names and years of experience for all the mechanics' do
      visit "/mechanics"

      expect(page).to have_content(@mech_1.name)
      expect(page).to have_content(@mech_1.years_of_experience)

      expect(page).to have_content(@mech_2.name)
      expect(page).to have_content(@mech_2.years_of_experience)

    end
  #
  #   it "allows a user to see the average price of all items in machine" do
  #     visit machine_path(@turing)
  #
  #     expect(page).to have_content("Average Snack Price: $4.00")
  #   end
  # end
  end
end 
