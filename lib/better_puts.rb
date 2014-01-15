require "better_puts/version"
require 'rainbow'

module BetterPuts
  COLORS = [:magenta,:cyan,:green,:yellow,:red]

  module Helper
    def bp(line="",&block)
      @out ||= Out.new

      @out.out(line,&block)
    end
  end

  class Out
    def out(line)
      file, line_num = caller.first.split(":")
      location = "[#{file}:#{line_num}]"
      identation = indent_char * (index)

      puts colored(identation + location + line.to_s)

      if block_given?
        self.index = self.index + 1
        st = Time.now
        yield
        et = Time.now
        self.index = self.index - 1
        puts colored(identation + location + "END (#{(et - st)} s.)")
      end
    end

    def colored(l)
      Rainbow(l).color(COLORS[self.index])
    end

    def index=(i)
      i =  0 if i > (COLORS.length-1)
      @@index = i
    end

    def index
      @@index ||= 0
    end

    def indent_char=(chr)
      @@indent_char = chr
    end

    def indent_char
      @@indent_char ||= "\t"
    end


  end

end

include BetterPuts::Helper
