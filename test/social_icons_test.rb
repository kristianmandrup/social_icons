require 'test_helper'

class SocialIconsTest < ActionView::TestCase
  include SocialIcons::ViewHelpers


  def test_init
    params = {:url => "url", :title => "title", :desc => "desc"}
    builder = SocialIconsBuilder.new(self.controller, params)
    params.each do |k,v|
      assert_equal params[k], builder.send(k)
    end
  end

  def test_facebook_like_button
    params = {:url => "url", :title => "title", :desc => "desc"}
    builder = SocialIconsBuilder.new(self, params)
    assert builder.facebook_like_button
  end
  
end
