# csveasy

## Description
A simple ruby gem that reads and writes csv files. Uses the Ruby 1.9 CSV library and therefore 
requires Ruby 1.9.x. It reads a csv file and returns a collection of hashes. It writes to a csv
file by processing a collection of arrays, where the first array is the header row.

## Usage

### Reading 
```require 'csveasy'
Csveasy.read('file/path')
=> [ { 'first' => 'Wilma', 'last' => 'Flintsone' }, { 'first' => 'Betty', 'last' => 'Rubble' } ]
```

### Write
```require 'csveasy'
data = [ [ 'first', 'last' ], [ 'Barney', 'Rubble' ], [ 'Fred', 'Flintstone' ] ]
Csveasy.write('file/path', data)
```

### Requirements

Ruby 1.9.x - because it uses the 1.9 CSV library.
