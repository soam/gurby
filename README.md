Gurby is a library to write simple, beautiful GUI code.  It uses
WxRuby for the widgets, and borrows syntax ideas from _why's excellent
Shoes project.

Gurby separates style (how to arrange the widgets on the screen) from
the main content (what widgets are there).

Here's a sample:

    require 'gurby'
    
    Gurby.app do
      # The _style_ part: borders, proportions, resizing rules, etc.
      style do
        id 'text1' do
          proportion 0
          grow :expand
          border 2, :all
        end
    
        id 'text2' do
          proportion 1
          grow :expand
          border 2, :left, :right
        end
    
        id 'buttonbar' do
          proportion 0
          border 2, :all
          align :right
        end
      end

      # The main content -- textboxes, buttons, etc.
      frame :title => 'My App' do
        vertical do
          name = 
            text :id => 'text1', :value => 'single line'
    
          description = 
            text :id => 'text2', :style => :multiline, 
                 :value => "some\nsample\ntext\nwith\nmany\nlines"
          
          horizontal :id => 'buttonbar' do
            button :label => 'a button', 
                   :on_click => proc { name.value = 'clicked!' }
            button :label => 'and another button'
            button :label => 'one more'
          end
        end
      end
    end


Gurby is implemented using blox, a library for making such domain
specific languages very easy to implement.
