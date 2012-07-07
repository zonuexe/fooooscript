#!/usr/bin/env ruby
open(ARGV[0],'r'){|r|puts r.readlines.map{|l|(l=~/\Afo*\Z/)?'foooo':raise}.join}
