module AdapterPattern
  class SourceThree
    def initialize
      @incomes = %w[120 220 320]
    end

    def update_data
      @incomes.clear
      3.times { @incomes << rand(100..400).to_s }
    end

    def get_incomes
      @incomes
    end
  end
end

