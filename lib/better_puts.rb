require "better_puts/version"
require 'rainbow'

module BetterPuts
  COLORS = [:magenta,:cyan,:green,:yellow,:red]

  def self.bp(line)
    file, line_num = caller.first.split(":")
    location = "[#{file}:#{line_num}]"
    identation = self.indent_char * (self.index)

    puts identation + location + colored(line)

    if block_given?
      self.index = self.index + 1
      st = Time.now
      yield
      et = Time.now
      self.index = self.index - 1
      puts identation + location + colored("END (#{et - st} s.)")
    end
  end



  def self.colored(l)
    Rainbow(l).color(COLORS[self.index])
  end

  def self.index=(i)
    i =  0 if i > (COLORS.length-1)
    @@index = i
  end

  def self.index
    @@index ||= 0
  end

  def self.indent_char=(chr)
    @@indent_char = chr
  end

  def self.indent_char
    @@indent_char ||= "\t"
  end
end
