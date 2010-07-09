require 'rubygems' 
require 'wx'
require 'gurby/widgets/sizer'

module Gurby
module Widgets

class Horizontal < Sizer

  def visit_before_block
    @widget = Wx::HBoxSizer.new()
  end

end

end
end
