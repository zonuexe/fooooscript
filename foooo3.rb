#!/usr/bin/env ruby
require 'strscan'

module FooooScript
  OUTPUT_STRING = 'foooo'
  RE_VALID_LINE = /^(fo*)\n/
  class Scanner < StringScanner; end
  class Interpreter
    def self.open(path)
      raise unless File.exist? path
      code = Kernel.open(path, 'r'){|r| r.read}
      new code
    end
    def initialize(str)
      @n = 0
      @scanner = Scanner.new(str)
    end
    def run
      (@parsed || parse) && out
    end
    def out
      OUTPUT_STRING * @n
    end
    def parse
      s = @scanner
      while ! s.eos?
        case
        when (s.scan RE_VALID_LINE)
          @n += 1
        else
          raise
        end
      end
      @parsed = true
    end
  end
end

def FooooScript(path)
  FooooScript::Interpreter.open path
end

if $0 == __FILE__
    puts FooooScript(ARGV[0]).run
end

