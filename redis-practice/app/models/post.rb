class Post < ApplicationRecord
  def self.cache_post_index
    sql = "SELECT MAX(updated_at) max_updated_time, COUNT(updated_at) total_count FROM (SELECT posts.updated_at FROM posts) E;"
    # latest_data = Post.all.maximum(:updated_at)
    latest_data = ActiveRecord::Base.connection.execute(sql)

    {
      serializer: "posts",
      notice_data_total_count: latest_data.first["total_count"] == 0 ? 0 : latest_data.first["total_count"],
      latest_data_update: latest_data.first["max_updated_time"].nil? ? nil : latest_data.first["max_updated_time"].to_time.strftime('%Y-%m-%d %H:%M:%S UTC+0')
    }
  end
end
