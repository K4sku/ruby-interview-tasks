### Polish Reverse Notation
Your task is to write the `ReversePolishNotation` class, and make all tests green.

### What is the Reverse Polish Notation
Reverse Polish Notation is a mathematical notation in which operators are after the operands. 

Examples:

`2 3 +`  translates to `2 + 3` 

`1 2* 3+` translates to `1 * 2 + 3` 

`1 2 3*-` translates to `1 - (2*3)`   


### How to run?
Install rspec
```
gem install rspec
```

Run reverse_polish_notation_calculator specs
```
rspec reverse_polish_notation_calculator_spec.rb
```
