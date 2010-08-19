require 'test_helper'

class SocialIconsTest < ActionView::TestCase
  include SocialIcons::ViewHelpers

  def setup
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  def test_initialize
    params = {:url => "url", :title => "title", :desc => "desc"}
    builder = SocialIconsBuilder.new(params)
    params.each do |k,v|
      assert_equal params[k], builder.send(k)
    end
  end

  def test_facebook_like_button
    params = {:url => "url", :title => "title", :desc => "desc"}
    builder = SocialIconsBuilder.new(params)
    assert builder.facebook_like_button
  end
  
end
