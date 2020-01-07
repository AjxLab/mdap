mdap
====

A displaying progress utility for Ruby.


## Usage
### Simple Example
```ruby
# 100 Loop
mdap(100) { sleep 0.01 }
# [#########################──────────] 21% (72/100) [37:26-37:29 64.371566it/s]

# Specify Desc
mdap(100, desc: 'Download') { sleep 0.01 }
# Download: [##################───────] 21% (72/100) [37:26-37:29 64.371566it/s]

# Specify Datetime Format
mdap(100, datetime_format: "%Y:%M:%S") { sleep 0.01 }
# Download: [##############─────] 21% (72/100) [03:37:26-03:37:29 64.371566it/s]

# Specify Bar Shape
mdap(100, bar_shape: ["=", "."]) { sleep 0.01 }
# Download: [==============.....] 21% (72/100) [03:37:26-03:37:29 64.371566it/s]
```


## Installation
```sh
$ git clone https://github.com/AjxLab/mdap
$ cd mdap
```
