require 'rubygems' 
require 'wx'
require 'blox'
require 'gurby/widgets/containerwidget'

module Gurby
module Widgets


class Frame < ContainerWidget

  def visit_before_block
    position = get_arg_func(:position, 
                            lambda { |p| Wx::Point.new(*p) },
                            Wx::DEFAULT_POSITION)

    size = get_arg_func(:size,
                        lambda { |s| Wx::Size.new(*s) },
                        Wx::DEFAULT_SIZE)

    style    = Wx::DEFAULT_FRAME_STYLE

    title = get_arg(:title, 'App')

    frame_parent = nil # TODO

    @widget = Wx::Frame.new(frame_parent, -1, title, 
                            position, size, style)
  end

  def visit_after_block
    # not sure we should do this automatically like this..
    show
  end

  def show
    @widget.show
  end

  def got_child(child)
    if (Sizer === child)
      @widget.set_sizer(child.widget)
    else
      raise "TODO"
    end
    # todo -- some smarter behaviour on more than one child? some
    # default sizer?
  end

end


end
end
