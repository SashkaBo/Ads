require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :utils do
  desc "Publish approved posts"
  task :publish_approved_posts => :environment do
    for post in Post.all.select{|p| p.status == "approve"}
      puts "Publishing post with id=#{post.id}"
      post.publish!
    end
  end
end