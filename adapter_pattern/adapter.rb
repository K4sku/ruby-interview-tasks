module AdapterPattern
  class Adapter
    def initialize(source)
      @source = source
    end

    def update_incomes
      @source.update_data
    end

    def incomes
      @incomes = []
      @source.get_incomes.each { |income| @incomes << income.to_i }
      @incomes
    end
  end
end