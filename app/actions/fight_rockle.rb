class FightRockle < Action
  def execute(challenged_rockle, user_rockle)
    rockle_2, rockle_1 = *[challenged_rockle, user_rockle].shuffle!.sort_by!{|obj|obj.spd_points}
  end


end
