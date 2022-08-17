# frozen_string_literal: true

require 'rspec'
require_relative 'fibonacci_numbers_generator'

describe FibonacciNumbersGenerator do
  it "finds 1st Fibonacci's number" do
    expect(described_class.find_nth(1)).to eq(1)
  end

  it "finds 3rd Fibonacci's number" do
    expect(described_class.find_nth(3)).to eq(2)
  end

  it "finds 5th Fibonacci's number" do
    expect(described_class.find_nth(5)).to eq(5)
  end

  it "finds 10th Fibonacci's number" do
    expect(described_class.find_nth(10)).to eq(55)
  end

  it "finds 100th Fibonacci's number" do
    expect(described_class.find_nth(100)).to eq(354_224_848_179_261_915_075)
  end

  it "finds 1_000th Fibonacci's number" do
    expect(described_class.find_nth(1_000)).to eq(43_466_557_686_937_456_435_688_527_675_040_625_802_564_660_517_371_780_402_481_729_089_536_555_417_949_051_890_403_879_840_079_255_169_295_922_593_080_322_634_775_209_689_623_239_873_322_471_161_642_996_440_906_533_187_938_298_969_649_928_516_003_704_476_137_795_166_849_228_875)
  end
end
