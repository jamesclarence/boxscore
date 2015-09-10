class StatCollection
	attr_reader :stats

  def initializer(stats)
    @stats = stats
  end

	def fga
    stats.sum(:fga)
  end
end