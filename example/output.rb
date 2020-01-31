require './mdap.rb'

# 100 Loop
puts "100 Loop"
mdap(300) { sleep 0.01 }

# Specify Desc
puts "Specify Desc"
mdap(300, desc: 'Download') { sleep 0.01 }

# Specify Datetime Format
puts "Specify Datetime Format"
mdap(300, datetime_format: "%H:%M:%S") { sleep 0.01 }

# Specify Bar Shape
puts "Specify Bar Shape"
mdap(300, bar_shape: ["=", "."]) { sleep 0.01 }
