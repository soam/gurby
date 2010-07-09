require 'rubygems' 
require 'wx'
require 'blox'

require 'gurby/util/widget'
require 'gurby/util/misc'

module Gurby
module Widgets

class Widget < Blox::Command
  include Gurby::Util::Widget
  include Gurby::Util::Misc

  attr_reader :widget

end

end
end
