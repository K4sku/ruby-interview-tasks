require 'rspec'
require_relative 'matrix'

describe Matrix do
  let(:matrix) { Matrix.new(input) }

  context 'when the input is 1x1 matrix' do
    let(:input) { '1' }

    it '#transpose returns input matrix' do
      expect(matrix.transpose).to eq(input)
    end
  end

  context 'when the input is 1x2 matrix' do
    let(:input) { '2 3' }

    it '#transpose returns 2x1 matrix' do
      expected_output = "2\n" \
                        "3"
      expect(matrix.transpose).to eq(expected_output)
    end
  end

  context 'when the input is 2x1 matrix' do
    let(:input) { "2\n" \
                  "3" }

    it '#transpose returns 1x2 matrix' do
      expected_output = "2 3"

      expect(matrix.transpose).to eq(expected_output)
    end
  end

  context 'when the input is 4x2 matrix' do
    let(:input) { "2 1\n" \
                  "3 8\n" \
                  "1 2\n" \
                  "9 0" }

    it '#transpose returns 2x4 matrix' do
      expected_output = "2 3 1 9\n" \
                        "1 8 2 0"

      expect(matrix.transpose).to eq(expected_output)
    end
  end

  context 'when the input is 2x1 matrix' do
    let(:input) { "2 1 5\n" \
                  "3 8 6\n" \
                  "1 2 7\n" \
                  "9 0 8\n" \
                  "2 1 2\n" \
                  "3 8 1\n" \
                  "1 2 1\n" \
                  "9 0 2" }

    it '#transpose returns 1x2 matrix' do
      expected_output = "2 3 1 9 2 3 1 9\n" \
                        "1 8 2 0 1 8 2 0\n" \
                        "5 6 7 8 2 1 1 2"

      expect(matrix.transpose).to eq(expected_output)
    end
  end
end
