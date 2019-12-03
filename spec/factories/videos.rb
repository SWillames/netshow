FactoryBot.define do
  factory :video do
    title { Faker::Movie.quote }
    url { 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8' }
    cont_view { 1 }
    user { create(:user) }
  end
end
