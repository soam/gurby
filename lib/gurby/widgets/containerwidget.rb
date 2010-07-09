require 'rubygems' 
require 'wx'
require 'blox'

require 'gurby/util/widget'
require 'gurby/util/misc'

module Gurby
module Widgets

class ContainerWidget < Blox::BlockCommand

  include Gurby::Util::Widget
  include Gurby::Util::Misc

  attr_reader :widget

  def find_containing_frame
    if Frame === self
      return @widget
    elsif @parent == nil
      return nil
    else
      return @parent.find_containing_frame
    end
  end

end

end
end
