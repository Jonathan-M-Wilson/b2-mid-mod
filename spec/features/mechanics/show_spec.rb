RSpec.describe 'As a user', type: :feature do
  before(:each) do
    @park_1 = AmusementPark.create(name: "Fly High", admission_price: 50.00)

    @ride_1 = @park_1.rides.create(name: "White Dragon", thrill_rating: 8)
    @ride_2 = @park_1.rides.create(name: "The Rocket", thrill_rating: 6)
    @ride_3 = @park_1.rides.create(name: "The Bathroom", thrill_rating: 2)

    @mech_1 = Mechanic.create(name: "Bob Vance", years_of_experience: 3)
    @mech_2 = Mechanic.create(name: "Bill Guy", years_of_experience: 1)

    MechanicRide.create(ride: @ride_1, mechanic: @mech_1)
    MechanicRide.create(ride: @ride_2, mechanic: @mech_1)
  end

  describe 'When a user visits a mechanics show page' do
    it 'allows user to see the name and years of experience for this mechanic, and rides this mechanic is working on' do
      visit "/mechanics/#{@mech_1.id}"

      expect(page).to have_content(@mech_1.name)
      expect(page).to have_content(@mech_1.years_of_experience)
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end

    it "allows a user to see a form to add a ride to this mechanic's workload" do
      visit "/mechanics/#{@mech_1.id}"

      expect(page).to have_field(:ride_id)
    end
  end

  describe 'When a user fills in the form ands clicks the submit button' do
    it "adds that ride to the machanics workflow and the user is redirected to that mechanic's show page" do
      visit "/mechanics/#{@mech_1.id}"

      fill_in :ride_id, with: @ride_3.id
      click_on "Submit"

      expect(current_path).to eq("/mechanics/#{@mech_1.id}")

      expect(page).to have_content(@ride_3.name)
    end
  end
end
