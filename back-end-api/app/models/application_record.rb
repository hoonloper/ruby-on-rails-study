class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # 글로벌 오브젝트 형식 전역 오버라이딩
  # def as_json(**options)
  #   unless options.has_key? :include
  #     options.merge!(
  #       include: self.class.reflect_on_all_associations.map(&:name)
  #     )
  #   end
  #   super(options)
  # end
end
