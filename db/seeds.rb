images = [
  'bairann.jpg',
  'niku.jpg',
  'ramen.jpg',
  'saize.png',
  'sutaba.jpg',
  'ume.jpg',
  'watami.jpg'
]

parkings = [
  5,
  10,
  15,
  20,
  25,
  30
]

50.times do
  Shop.create!(
    shop_name: Faker::Name.name,
    address: '東京都阪神区阪神3-3-4',
    shop_image:File.open("./public/images/#{images[rand(0..6)]}"),
    parking: parkings[rand(0..5)]
  )
end

10.times do
  ShopCategory.create!(
    shop_id: rand(11.. 50),
    category_id: rand(1..7)
  )
end

10.times do
  ShopPayment.create!(
    shop_id: rand(11.. 50),
    payment_id: rand(1..6)
  )
end
