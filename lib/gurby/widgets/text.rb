require 'rubygems' 
require 'wx'
require 'blox'
require 'gurby/widgets/widget'

module Gurby
module Widgets

class Text < Widget

  def visit
    position = get_arg_func(:position, 
                            lambda { |p| Wx::Point.new(*p) },
                            Wx::DEFAULT_POSITION)

    size = get_arg_func(:size,
                        lambda { |s| Wx::Size.new(*s) },
                        Wx::DEFAULT_SIZE)

    value = get_arg(:value, '')

    wx_style_values = { 
      :multiline => Wx::TE_MULTILINE,
      :password => Wx::TE_PASSWORD,
      :readonly => Wx::TE_READONLY }
    style_arg = 0
    styles = get_arg_func(:style, lambda {|s| Symbol === s ? [s] : s}, [])
    styles.each { |s|
      style_arg = style_arg | wx_style_values[s]
    }
    
    containing_frame = @parent.find_containing_frame

    @widget = Wx::TextCtrl.new(containing_frame, 
                               Wx::ID_ANY,
                               value,
                               position, size, style_arg)
    
    self
  end

  def value=(val)
    @widget.set_value(val)
  end
  def value
    @widget.get_value
  end

  attr_reader :widget

end


end
end
