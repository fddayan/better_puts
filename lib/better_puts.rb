require "better_puts/version"
require 'rainbow'

module BetterPuts

  def self.config
    @config ||= {color: :red}
  end

  module Helper
    def bp(*values)
      bp_line
      values.each do |v|
        OUT.out(v)
      end
      bp_line
    end

    def bp_line(ch="-",n=100)
      OUT.out(ch * n)
    end

    def bp_wrap
      bp_line
      yield
      bp_line
    end
  end

  class Out
    def out(line)
      puts Rainbow(line).color(BetterPuts.config[:color])
    end
  end

  OUT = Out.new
end

include BetterPuts::Helper