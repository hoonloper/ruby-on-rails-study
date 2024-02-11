# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

50.times do
  # 극장 생성
  theater = Theater.create(name: Faker::Lorem.name, max_audience_count: Faker::Number.number(digits: 1))

  # 영화 생성
  movie = Movie.create(title: Faker::Lorem.word, director: Faker::Name.name)

  # 극장과 영화에 맞는 상영시간 생성
  screening = Screening.create(
      theater: theater,
      movie: movie,
      show_date: Faker::Date.between(from: '2022-01-01', to: '2023-12-31'),
      start_time: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
      end_time: Faker::Date.between(from: '2023-01-01', to: '2023-12-31')
  )
end