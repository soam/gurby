require 'rubygems' 
require 'wx'
require 'gurby/widgets/sizer'

module Gurby
module Widgets

class Vertical < Sizer

  def visit_before_block
    @widget = Wx::VBoxSizer.new()
  end

end

end
end
