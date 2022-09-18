module AdapterPattern
  class SourceOne
    attr_reader :incomes

    def initialize
      @incomes = [150, 250, 350, 450]
    end

    def update_incomes
      @incomes.clear
      2.times { @incomes << rand(100..400) }
    end
  end
end
