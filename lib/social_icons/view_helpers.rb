module SocialIcons

  module ViewHelpers

    mattr_reader :social_icons_options

    # default options that can be overridden on the global level
    @@social_icons_options = {
      :icon_set     => 'default',
      :size => 48
    }

    def social_icons(opts={}, &block)
      builder = SocialIconsBuilder.new(self, opts)
      builder.to_html(&block)
    end

    class SocialIconsBuilder

      attr_accessor :url, :title, :desc, :popup, :size, :icon_set, :icon_path, :template, :html_options

      def initialize(template, options={})
        
        @template = template
        
        #initialize defaults values
        options = {
            :url => "http://" + request.env["HTTP_HOST"] + request.request_uri,
            :title => nil,
            :desc => nil,
            :size => social_icons_options[:size],
            :popup => false,
            :icon_set => social_icons_options[:icon_set],
            :icon_path => nil
        }.update(options.symbolize_keys)

        #attributes
        options.keys.each do |key|
          send "#{key}=", options.delete(key)
        end

        self.html_options = options

        #..and endly icon path
        self.icon_path = "social_icons/#{icon_set}/#{size}"

        self
      end

      def to_html(&block)
        content_tag :div, {:class => 'social_icons'}.update(html_options) do
          block.call(self)
        end
      end

      def facebook_like
        content_tag :div, :class=> "facebook_like" do
          content_tag :iframe, '',
              :src => "http://www.facebook.com/plugins/like.php?href=#{url}&layout=button_count&show_faces=true&width=272&action=like&colorscheme=light&height=80",
              :scrolling => "no",
              :frameborder=>"0",
              :style=>"border:none;overflow:hidden; width:272px; height:80px;",
              :allowTransparency=>"true"
        end
      end

      # <a title="Click to share this post on Twitter"
      #    href="http://twitter.com/home?status=Currently reading &lt;?php the_permalink(); ?&gt;" target="_blank" class="twitter">Share on Twitter</a>
      #
      def twitter
        link_to "http://twitter.com/home?status=#{title}+#{url}",
#                :title => t('social_icons.twitter'),
                :target => "_blank" do
          image_tag "#{icon_path}/twitter.png" #, :alt => t('social_icons.twitter'))
        end

      end

      # <a name="fb_share" type="button_count" share_url="http://google.com" href="http://www.facebook.com/sharer.php">Share</a><script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
      #
      # NOT: facebook encode edilmiş permalinkleri sevmiyor!
      def facebook
        facebook_url = "http://www.facebook.com/sharer.php?u=#{CGI.unescape(url)}&t=#{title}"
        link_options = { :target => '_blank'}.update(popup ? { :onclick => "window.open('#{facebook_url}','sharer','toolbar=0,status=0,width=626,height=436'); return false;" }  : {})
        link_to facebook_url, link_options do
          image_tag "#{icon_path}/facebook.png"#,
#            :alt => t("social_icons.facebook")#,
#            :title => t("social_icons.facebook") )
        end
      end

      # <a title="Digg this post" href="http://digg.com/submit?phase=2&amp;url=http%3A%2F%2Fwww.weddingbee.com%2F2009%2F03%2F11%2Fadd-share-icons-for-social-media%2F" rel="nofollow" target="_blank"><img alt="Digg this post" src="http://www-static.weddingbee.com/images/digg.gif" style="border: medium none ;"></a>
      def digg
        link_to "http://digg.com/submit?phase=2&url=#{url}&title=#{title}",
                :title => title,
                #:label => t("social_icons.digg"),
                :target => "_blank",
                :rel => "nofollow" do
          image_tag "#{icon_path}/digg.png" #, :alt => t("social_icons.digg"), :title => t("social_icons.digg"))
        end
      end

       # <a href="http://delicious.com/save?url=<?php urlencode(the_permalink()); ?>&amp;title=<?php urlencode(the_title()); ?>" onclick="window.open('http://delicious.com/save?v=5&amp;noui&amp;jump=close&amp;url=<?php urlencode(the_permalink()); ?>&amp;title=<?php urlencode(the_title()); ?>', 'delicious', 'toolbar=no,width=550,height=550'); return false;" title="Bookmark this post on del.icio.us"> </a>
      def delicious
        link_to "http://delicious.com/save?url=#{url}&title=#{title}",
            :onclick => "window.open(
              'http://delicious.com/save?v=5&amp;noui&amp;jump=close&amp;url=#{url}&amp;title=#{title}',
              'delicious',
              'toolbar=no,width=550,height=550'
              );
            return false;",
            :title => t("social_icons.delicious") do
            image_tag("#{icon_path}/delicious.png", :alt => t("social_icons.delicious"), :title => t("social_icons.delicious"))
        end
      end

      # <a href="http://reddit.com/submit?url=<?php the_permalink(); ?>" rel="nofollow" title="Submit to Reddit" target="_blank"> </a>
      def social_icon_reddit(opts)
        link_to "http://reddit.com/submit?url=#{url}&title=#{title}",
          :rel => "nofollow",
          :title => title,
          :target => "_blank" do
          image_tag("#{icon_path}/reddit.png", :alt => t("social_icons.reddit"), :title => t("social_icons.reddit"))
        end
      end

      def method_missing(*args,&block)
        if block
          template.send *args, &block
        else
          template.send *args
        end

      end

    end
    
  end

end
