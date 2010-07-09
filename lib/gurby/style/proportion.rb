require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

class Proportion < Blox::Command
  def value
    (@args == []) ? 0 : @args[0]
  end
end

end
end
