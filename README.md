Gurby is a library to write simple, beautiful GUI code.  It uses
WxRuby for the widgets, and borrows syntax ideas from _why's excellent
Shoes project.

Gurby separates style (how to arrange the widgets on the screen) from
the main content (what widgets are there).

    Gurby.app do
      style do
        id 'my text' do
          proportion 1
          grow :expand
        end
        id 'my button' do
          proportion 0
          align :right
        end
      end

      frame :title => 'My App' do
        vertical do
          text :id => 'my text', :style => :multiline
          button :id => 'my button', :label => 'a button'
        end
      end
    end 


Gurby is implemented using blox, a library for making such domain
specific languages very easy to implement.
