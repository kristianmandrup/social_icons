require 'rails/generators'

class SocialIconsGenerator < Rails::Generators::Base
  desc "Install the images icons into /public/images/social_icons and the default stylesheet file into /public/stylesheets/social_icons.css"
    
  def install_assets
    source_root = File.expand_path("../templates", __FILE__)
    dest_file = File.join(Rails.root, "public", "images")
    src_file = File.join(source_root, "images", "social_icons")
    FileUtils.cp_r(src_file, dest_file)

    dest_file = File.join(Rails.root, "public", "stylesheets")
    src_file = File.join(source_root, "stylesheets", "social_icons.css")
    FileUtils.cp_r(src_file, dest_file)
    puts "Files copied in public/images and public/stylesheets"
  end
  
end
