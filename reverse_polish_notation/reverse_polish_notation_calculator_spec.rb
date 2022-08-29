require 'rspec'
require_relative 'reverse_polish_notation_calculator'

describe ReversePolishNotationCalculator do
  it 'calculates a simple addition' do
    expect(described_class.calculate('1 2+')).to eq(3)
  end

  it 'calculates a simple substraction' do
    expect(described_class.calculate('1 2-')).to eq(-1)
  end

  it 'calculates a simple multiplication' do
    expect(described_class.calculate('3 2*')).to eq(6)
  end

  it 'calculates a simple division' do
    expect(described_class.calculate('8 2/')).to eq(4)
  end

  it 'calculates a value of two operations' do
    expect(described_class.calculate('2 3* 1+')).to eq(7)
  end

  it 'calculates a value of two operations in different order' do
    expect(described_class.calculate('2 3 1+*')).to eq(8)
  end

  it 'calculates a value of four operations' do
    expect(described_class.calculate('12 13* 14 7/- 16+')).to eq(170)
  end

  it 'calculates a value of six operations' do
    expect(described_class.calculate('1 2 3*+ 5 5*- 6 3/+')).to eq(-16)
  end
end
