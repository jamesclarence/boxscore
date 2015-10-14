class StatCollection < Stat
	attr_reader :stats

	def initializer(stats)
    @stats = stats
  end

	# Stats - Aggregate
	def fg_sum
		stats.sum(:fg)
	end

	def fga_sum
    stats.sum(:fga)
  end

	# Stats - Per Game


end
