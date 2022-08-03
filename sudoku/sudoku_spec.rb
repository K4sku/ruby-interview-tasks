require 'rspec'
require_relative 'sudoku'

describe Sudoku do
  let(:sudoku) { Sudoku.new(input) }

  context 'when the input is valid' do
    context 'when input represents an easy sudoku' do
      let(:input) { '250030901010004000407000208005200000000098100040003000000360072070000003903000604' }

      it '#to_s returns sudoku board' do
        expected_output = "25 | 3 |9 1\n" \
                          " 1 |  4|   \n" \
                          "4 7|   |2 8\n" \
                          "---+---+---\n" \
                          "  5|2  |   \n" \
                          "   | 98|1  \n" \
                          " 4 |  3|   \n" \
                          "---+---+---\n" \
                          "   |36 | 72\n" \
                          " 7 |   |  3\n" \
                          "9 3|   |6 4\n"

        expect(sudoku.to_s).to eq(expected_output)
      end

      it '#solve returns solved sudoku board' do
        expected_output = "258|736|941\n" \
                          "619|824|357\n" \
                          "437|915|268\n" \
                          "---+---+---\n" \
                          "395|271|486\n" \
                          "762|498|135\n" \
                          "841|653|729\n" \
                          "---+---+---\n" \
                          "184|369|572\n" \
                          "576|142|893\n" \
                          "923|587|614\n"

        expect(sudoku.solve).to be eq(expected_output)
      end
    end

  #   context 'when input represents another easy sudoku' do
  #     let(:input) { '000260701680070090190004500820100040004602900050003028009300074040050036703018000' }

  #     it '#to_s returns sudoku board' do
  #       expected_output = "   |26 |7 1\n" \
  #                         "68 | 7 | 9 \n" \
  #                         "19 |  4|5  \n" \
  #                         "---+---+---\n" \
  #                         "82 |1  | 4 \n" \
  #                         "  4|6 2|9  \n" \
  #                         " 5 |  3| 28\n" \
  #                         "---+---+---\n" \
  #                         "  9|3  | 74\n" \
  #                         " 4 | 5 | 36\n" \
  #                         "7 3| 18|   \n"

  #       expect(sudoku.to_s).to eq(expected_output)
  #     end

  #     it '#solve returns solved sudoku board' do
  #       expected_output = "435|269|781\n" \
  #                         "682|571|493\n" \
  #                         "197|834|562\n" \
  #                         "---+---+---\n" \
  #                         "826|195|347\n" \
  #                         "374|682|915\n" \
  #                         "951|743|628\n" \
  #                         "---+---+---\n" \
  #                         "519|326|874\n" \
  #                         "248|957|136\n" \
  #                         "763|418|259\n"

  #       expect(sudoku.solve).to be eq(expected_output)
  #     end
  #   end
  end

  context 'when the input is invalid' do
    context 'when input represents sudoku with errors' do
      let(:input) { '111111111010004000407000208005200000000098100040003000000360072070000003903000604' }

      it '#to_s returns sudoku in human readable form' do
        expected_output = "111|111|111\n" \
                          " 1 |  4|   \n" \
                          "4 7|   |2 8\n" \
                          "---+---+---\n" \
                          "  5|2  |   \n" \
                          "   | 98|1  \n" \
                          " 4 |  3|   \n" \
                          "---+---+---\n" \
                          "   |36 | 72\n" \
                          " 7 |   |  3\n" \
                          "9 3|   |6 4\n"
        expect(sudoku.to_s).to eq(expected_output)
      end

      it '#solve informs that solving is impossible' do
        expect(sudoku.solve).to eq ['can\'t be solved']
      end
    end

  #   context 'when input has incorrect characters' do
  #     let(:input) { 'abc!11111010004000407000208005200000000098100040003000000360072070000003903000604' }

  #     it '#to_s prints error message' do
  #       expect(sudoku.to_s).to eq ['incorrect input format']
  #     end

  #     it '#solve informs that solving is impossible' do
  #       expect(sudoku.solve).to eq ['can\'t be solved']
  #     end
  #   end

  #   context 'when input has incorrect length' do
  #     let(:input) { '11111' }

  #     it '#to_s prints error message' do
  #       expect(sudoku.to_s).to eq ['incorrect input format']
  #     end

  #     it '#solve informs that solving is impossible' do
  #       expect(sudoku.solve).to eq ['can\'t be solved']
  #     end
  #   end

  #   context 'when input is empty' do
  #     let(:input) { '' }

  #     it '#to_s prints error message' do
  #       expect(sudoku.to_s).to eq ['incorrect input format']
  #     end

  #     it '#solve informs that solving is impossible' do
  #       expect(sudoku.solve).to eq ['can\'t be solved']
  #     end
  #   end
  end
end
