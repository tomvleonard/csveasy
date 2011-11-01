# csveasy

## Description
A ruby gem that reads and writes csv files. It reads a csv file and returns a collection 
of hashes. It writes to a csv file by processing an array of arrays OR an array of uniform hashes.

## Usage

### Reading 
#### Input
```
first_name,middle_name,last_name
Fred,Sonic,Smith
Arthur,Two Sheds,Jackson
```

```ruby
require 'csveasy'  

data = Csveasy.read('file/path')  
=> [ { 'first_name' => 'Fred',   'middle_name' => 'Sonic',     'last_name' => 'Smith' }, 
     { 'first_name' => 'Arthur', 'middle_name' => 'Two Sheds', 'last_name' => 'Jackson' } ]
```

### Writing
#### From an array of arrays
```ruby
require 'csveasy'  

data = [ [ 'header_1', 'header_2' ], [ 'value_a', 'value_b' ], [ 'value_c', 'value_d' ] ]
Csveasy.write('file/path', data)
```
#### From an array of hashes
```ruby
require 'csveasy'  

data = [ { 'header_1' => 'value_a', 'header_2' => 'value_b' },  { 'header_1' => 'value_c', 'header_2' => 'value_d' } ]

Csveasy.write('file/path', data)
```
#### Output
```
header_1,header_2
value_a,value_b
value_c,value_d
```

### Requirements
Ruby 1.9.x (uses Ruby 1.9 CSV library)
