RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @park_1 = AmusementPark.create(name: "Fly High", admission_price: 50.00)

    @ride_1 = Ride.create(name: "White Dragon", thrill_rating: 8)
    @ride_2 = Ride.create(name: "The Rocket", thrill_rating: 6)
  end

  describe 'When a user visits a amusement park\'s show page' do
    it 'allows user to see the names and price of admissions for that park' do
      visit "/parks/#{@park_1.id}"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admission_price)
    end

    it "allows a user to see the names of all the rides, in alphabetical order" do
      visit "/parks/#{@park_1.id}"

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end

    it "allows a user to see the average thrill rating of park\'s rides" do
      visit "/parks/#{@park_1.id}"
      
      expect(page).to have_content("Average Thrill Rating: 7")
    end
  end
end
