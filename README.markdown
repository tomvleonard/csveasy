# csveasy

## Description
A ruby gem that reads and writes csv files. It reads a csv file and returns a collection 
of hashes. It writes to a csv file by processing an array of arrays OR an array of uniform hashes.

## Usage

### Reading 
```ruby
require 'csveasy'  

data = Csveasy.read('file/path')  
=> [ { 'first_name' => 'Fred',   'middle_name' => 'Sonic',     'last_name' => 'Smith' }, 
     { 'first_name' => 'Arthur', 'middle_name' => 'Two Sheds', 'last_name' => 'Jackson' } ]
```

### Writing from an array of arrays
```ruby
require 'csveasy'  

header_row = [ 'first_name', 'middle_name', 'last_name' ]
data_rows = [ [ 'Fred', 'Sonic', 'Smith' ], [ 'Arthur', 'Two Sheds', 'Jackson' ] ]
data = data_rows.insert(0, header_row)

Csveasy.write('file/path', data)
```
### Writing from an array of hashes
```ruby
require 'csveasy'  

data = [ { 'first_name' => 'Fred',   'middle_name' => 'Sonic',     'last_name' => 'Smith' }, 
         { 'first_name' => 'Arthur', 'middle_name' => 'Two Sheds', 'last_name' => 'Jackson' } ]

Csveasy.write('file/path', data)
```

### Requirements

Ruby 1.9.x (uses Ruby 1.9 CSV library)
