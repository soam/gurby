require 'rubygems'
require 'wx'
require 'blox'

Dir.glob(File.dirname(__FILE__) + '/gurby/**/*.rb') { |file| 
  require file
}

module Gurby
  module Lang
    Blox::create_language(self, Gurby)
  end

  class App < Wx::App
    include Lang
  end

  class SimpleApp < App
    attr_accessor :app_contents
    attr_accessor :stylesheet
    def on_init
      instance_eval &app_contents
    end
  end

  def self.app(&b)
    a = SimpleApp.new
    a.app_contents = b
    a.main_loop
  end

end

