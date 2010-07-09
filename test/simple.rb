#!/usr/bin/ruby 

# just for testing
$LOAD_PATH << (File.dirname(__FILE__) + '/../../blox/lib')
$LOAD_PATH << (File.dirname(__FILE__) + '/../lib/')

require 'gurby'

Gurby.app do

  style do
    id "text1" do
      proportion 0
      grow :expand
      border 2, :all
    end

    id "text2" do
      proportion 1
      grow :expand
      border 2, :all
    end

    id "buttonbar" do
      proportion 0
      border 2, :all
      align :right
    end
  end

  frame :title => "Hi" do
    vertical do
      name = 
        text :id => "text1", :value => "single line"

      description = 
        text :id => "text2", :style => :multiline, :value => "some\nsample\ntext\nwith\nmany\nlines"
      
      horizontal :id => "buttonbar" do
        button :label => 'a button', :on_click => proc { name.value = 'clicked!' }
        button :label => 'and another button'
        button :label => 'one more'
      end
    end
  end
end
