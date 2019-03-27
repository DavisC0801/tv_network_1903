require "./lib/character"
require "./lib/show"
require "./lib/network"

describe Network do

  before do
    @nbc = Network.new("NBC")
  end

  it "has a name" do
    expect(@nbc.name).to eq("NBC")
  end

  it "has no shows by default" do
    expect(@nbc.shows).to eq([])
  end

  context "add shows and actors" do

    before do
      @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      @knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
      @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
    end

    it "stores shows that have been added" do
      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

    it "finds the highest paid actor in the network" do
      expect(@nbc.highest_paid_actor).to eq("Amy Poehler")
    end
  end
end
