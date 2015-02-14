#! /usr/bin/env ruby
require "./getMousePos.rb"



gmp = GetMousePos.new(3)
gmp.start
pos = gmp.getMousePos
puts "x:#{pos[0]} y:#{pos[1]}"
