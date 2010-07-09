require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

class Id < Blox::BlockCommand

  attr_reader :style
  
  def visit
    @style = {}
  end

  def id
    (@args == []) ? nil : @args[0]

    # i guess nil could be used as the default style
  end

  def got_child(child)
    case child
    when Proportion: 
        @style[:proportion] = child.value
    when Border: 
        @style[:border_size] = child.border_size 
        @style[:border_where] = child.border_where
    when Grow:
        @style[:grow] = child.value
    when Align:
        @style[:align] = child.value
    end
  end

end

end
end
