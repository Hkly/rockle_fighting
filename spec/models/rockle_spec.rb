require 'spec_helper'

describe Rockle do

  before(:each) do
    @rockle = create(:rockle)
  end

  it "is created with stats stats" do
    expect(@rockle.atk_points).to_not be(0)
    expect(@rockle.hp_points).to_not be(0)
    expect(@rockle.def_points).to_not be(0)
    expect(@rockle.spd_points).to_not be(0)
  end

  it "is created with max hp that is 10 times the hp_points" do
    expect(@rockle.max_hp).to_not be(nil)
    expect(@rockle.max_hp).to_not be(0)
    expect(@rockle.max_hp).to be(@rockle.hp_points * 10)
  end

end
