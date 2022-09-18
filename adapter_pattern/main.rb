# Sources One and Two have common interface
#     { @incomes is array of integers
#       .incomes attr_reader
#       .update_incomes method to change values of @incomes
#      }
# SourceThree uses different interface
#      { @incomes is an array of strings
#        get_incomes getter for @incomes
#        .update_data method to change values of @incomes
#      }
# Adapter class allows Client to use interface of classes SourceOne and SourceTwo on SourceThree
# .incomes method calls get_income getter and transforms data to integers
# .update_incomes method calls .update_data
# This way we do not need to tell Client class how to deal with SourceThree

module AdapterPattern
  require_relative 'client'
  require_relative 'adapter'
  require_relative 'source_one'
  require_relative 'source_two'
  require_relative 'source_three'

  client = Client.new(SourceOne.new, SourceTwo.new, Adapter.new(SourceThree.new))
  client.collect_incomes
  puts 'Current median: ' + client.median_income.to_s
  puts 'update_sources'
  client.update_sources
  client.collect_incomes
  puts 'Current median: ' + client.median_income.to_s
end