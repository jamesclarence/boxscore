class StatCollection < Stat
	attr_reader :stats

	def initializer(stats)
    @stats = stats
  end

	# Stats - Aggregate
	def fg
		stats.sum(:fg)
	end

	def fga
    stats.sum(:fga)
  end

	# Stats - Per Game


end
