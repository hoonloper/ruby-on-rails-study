# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "테이블에 더미데이터 입력 시작"
nickname = ["뽀롱이", "사슴", "고래", "구구", "뽀삐", "리눅스 토발즈", "우주", "영칠", "철수", "영희", "심쿵", "냐옹이", "댕댕이"]
for i in 1..30000
  Post.create(nickname: nickname.sample(1)[0], title: "안녕하세요 #{SecureRandom.hex(6)}")
end
puts "테이블에 더미데이터 입력 종료"