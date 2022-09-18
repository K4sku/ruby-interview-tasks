module AdapterPattern
  class Client
    def initialize(*sources)
      @sources = sources
      @incomes_array = []
    end


    def update_sources
      @sources.each(&:update_incomes)
    end

    def collect_incomes
      @sources.each { |source| @incomes_array << source.incomes }
      @incomes_array.flatten!
    end

    def median_income
      incomes_size = @incomes_array.size
      sorted_incomes = @incomes_array.sort
      return sorted_incomes[(incomes_size + 1) / 2] if incomes_size.odd?

      (sorted_incomes[incomes_size / 2 - 1] + sorted_incomes[incomes_size / 2]) / 2
    end
  end
end