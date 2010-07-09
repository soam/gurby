module Gurby
module Util
module Widget

  def get_style_arg(key, default) 
    a = get_arg(key, nil)
    if (a != nil)
      return a
    end

    id = get_arg(:id, nil)
    style = Wx::get_app().stylesheet[id]
    if (style != nil and style[key] != nil)
      #puts "using stylesheet for #{id}'s #{key}"
      return style[key]
    end
    
    default
  end

  # get the proportion argument
  def proportion
    prop = get_style_arg(:proportion, 0)
  end

  # calculate the wx flags based on the :grow and :align keys
  def flags 
    flags = 0

    # growth of the widget inside the part of the sizer
    grow = get_style_arg(:grow, nil)
    if (grow != nil)
      flags |= { 
        :expand => Wx::EXPAND,
        :shaped => Wx::SHAPED }[grow]
    end

    # alignment within the part of the sizer
    align = get_style_arg(:align, [])
    unless (Array === align)
      align = [align]
    end
    align.each { |a|
      flags |= {
        :top     => Wx::ALIGN_TOP,
        :bottom  => Wx::ALIGN_BOTTOM,
        :right   => Wx::ALIGN_RIGHT,
        :left    => Wx::ALIGN_LEFT,
        :hcenter => Wx::ALIGN_CENTER_HORIZONTAL,
        :vcenter => Wx::ALIGN_CENTER_VERTICAL,
        :center  => Wx::ALIGN_CENTER }[a]
    }
    
    # where to add the border
    border_where = get_style_arg(:border_where, [:all])
    border_where.each { |w| 
      flags |= { 
        :all => Wx::ALL,
        :top => Wx::TOP,
        :bottom => Wx::BOTTOM,
        :left => Wx::LEFT,
        :right => Wx::RIGHT }[w]
    }

    # done
    flags
  end

  # the border argument
  def border
    get_style_arg(:border_size, 0)
  end

end
end
end
