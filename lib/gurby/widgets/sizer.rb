require 'rubygems' 
require 'wx'
require 'blox'
require 'gurby/widgets/containerwidget'

module Gurby
module Widgets

class Sizer < ContainerWidget
  
  def visit_after_block
    @children.each { |child| 
      @widget.add(child.widget,
                  child.proportion,
                  child.flags,
                  child.border)
    }
    
    self
  end

end

end
end
