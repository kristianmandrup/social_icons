module SocialIcons
	module Rails
		class Engine < ::Rails::Engine
			initializer "setup for rails" do
				ActionView::Base.send :include, SocialIcons::ViewHelpers 
			end
		end
	end
end
