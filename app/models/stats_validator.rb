class StatsValidator < ActiveModel::Validator
  def validate(record)
    if points_validation(record)
      record.errors.add[:points] << "Points must equal 2P, 3P, and FT made"
    end

    if record.fga != record.two_pt_a + record.three_p_a
      record.errors[:fga] << "FGA must equal 2P + 3P attempts"
    end

    if record.trb != record.orb + record.drb
      record.errors[:trb] << "TRB must equal ORB + DRB"
    end

    if record.three_p > record.three_p_a
      record.errors[:three_p] << "3P can't be greater than 3P attempts"
    end

    if record.ft > record.fta
      record.errors[:ft] << "FTs can't be greater than FT attempts"
    end
  end

  private

  def points_validation(record)
    record.points != (record.two_pt * 2) + (record.three_p * 3) + record.ft
  end
end