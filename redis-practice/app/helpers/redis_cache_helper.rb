module RedisCacheHelper
  def cache_posts_index
    postsData = Post.all

    postsJson = Rails.cache.fetch('posts', expires_in: 7.minutes, race_condition_ttl: 30.seconds) do
      postsData.to_json
    end

    JSON.parse(postsJson)
  end
end