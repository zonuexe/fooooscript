#!/usr/bin/env ruby
require 'strscan'

code = open(ARGV[0]){|f| f.read }

s = StringScanner.new(code)
n = 0

while ! s.eos?
  case
    when (s.scan /^(fo+)\n/)
      n += 1
    else
      raise
  end
end

puts 'foooo' * n
