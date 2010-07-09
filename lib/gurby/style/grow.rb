require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

class Grow < Blox::Command
  def value
    (@args == []) ? nil : @args[0]
  end
end

end
end
