require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

class Border < Blox::Command
  attr_accessor :border_size, :border_where

  def visit
    @border_size = 0
    @border_where = []

    @args.each { |a| 
      if (Symbol === a) 
        @border_where << a
      elsif (Fixnum === a)
        @border_size = a
      else
        raise "bad argument to border #{a}"
      end
    }
  end
end

end
end
