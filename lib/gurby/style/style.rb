require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

# Something like this:
#   style do
#     id "buttonbar" do
#       proportion 1
#       border :all 2
#       grow :expand
#       align :right
#     end
#   end
class Style < Blox::BlockCommand

  attr_reader :styles

  def visit_before_block
    @styles = {}
  end

  def visit_after_block
    @children.each { |child|
      @styles[child.id] = child.style
    }

    Wx::get_app().stylesheet = styles
  end

end

end
end
