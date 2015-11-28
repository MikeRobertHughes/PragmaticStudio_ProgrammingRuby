require_relative 'spec_helper'
require_relative 'player'

describe 'Player' do

  it 'has a capitalized name' do
    player = Player.new("larry", 150)

    player.name.should == "Larry"
  end

  it "has an initial health"

  it "has a string representation"

  it "computes a score as the sum of its health and length of name"

  it "increases health by 15 when w00ted"

  it "decreases health by 10 when blammed"
end
