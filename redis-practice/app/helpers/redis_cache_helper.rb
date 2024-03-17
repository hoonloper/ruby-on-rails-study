module RedisCacheHelper
  def cache_posts_index
    puts "call post.all"
    posts = Post.all

    # posts_json = Rails.cache.fetch('posts', expires_in: 7.minutes, race_condition_ttl: 30.seconds) do
    #   posts.to_json
    # end
    # posts_json = Rails.cache.fetch(Post.cache_post_index, expires_in: 7.minutes, race_condition_ttl: 3) do
    #   posts.to_json
    # end
    posts_json = Rails.cache.fetch(posts.cache_key, expires_in: 7.minutes, race_condition_ttl: 3) do
      posts.to_json
    end

    JSON.parse(posts_json)
  end
end