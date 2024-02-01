class Post < ApplicationRecord
  belongs_to :user

  # 모델 내의 오버라이딩
  def as_json(**options)
    unless options.has_key? :include
      options.merge!(include: [:user])
    end
    super(options)
  end
end
