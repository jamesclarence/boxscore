class StatsValidator < ActiveModel::Validator
  def validate(record)
    # if record.points != (two_pt * 2) + (three_p * 3) + ft
    if record.points != (record.two_pt * 2) + (record.three_p * 3) + record.ft
      record.errors[:points] << "Points must equal 2P, 3P, and FT made"
    end

    if record.fga != record.two_pt_a + record.three_p_a
      record.errors[:fga] << "FGA must equal 2P + 3P attempts"
    end
  end
end