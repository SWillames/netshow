# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user_count = 1
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.username

  )
  user_count += 1

  user.save!
end

url_array = ['https://content.jwplatform.com/manifests/yp34SRmf.m3u8', 'https://cdn.jwplayer.com/manifests/RltV8MtT.m3u8']

video_count = 1
20.times do
  user_id = User.all.sample
  video = Video.new(
    title: Faker::DcComics.title,
    url: url_array.sample,
    count_view: 0,
    user: user_id
  )
  video_count += 1

  video.save!
end