require 'rubygems' 
require 'wx'
require 'blox'

module Gurby
module Style

class Align < Blox::Command
  def value
    @args
  end
end

end
end
