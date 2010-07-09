require 'rubygems' 
require 'wx'
require 'blox'
require 'gurby/widgets/widget'

module Gurby
module Widgets


class Button < Widget

  def visit
    position = get_arg_func(:position, 
                            lambda { |p| Wx::Point.new(*p) },
                            Wx::DEFAULT_POSITION)

    size = get_arg_func(:size,
                        lambda { |s| Wx::Size.new(*s) },
                        Wx::DEFAULT_SIZE)

    style = 0
    
    label = get_arg(:label, '')

    containing_frame = @parent.find_containing_frame

    @widget = Wx::Button.new(containing_frame, 
                             Wx::ID_ANY,
                             label, 
                             position, size, style)

    handler = get_arg(:on_click, nil)
    if (handler != nil)
      Wx::get_app().evt_button(@widget, &handler)
    end
    
    self
  end

  attr_reader :widget

end


end
end
