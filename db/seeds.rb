suv = Category.create(name: 'suv')
d_segment = Category.create(name: 'd_segment')
brand_apple = Category.create(name: 'brand_apple')

tim = User.create(email: 'tim@example.com', password: 'password', full_name: "tim TT")
jim = User.create(email: 'jim@example.com', password: 'password', full_name: "Jim JJ")
kim = User.create(email: 'kim@example.com', password: 'password', full_name: "Kim KK")


range_rover = Vehicle.create(name: '奇瑞路虎 揽胜极光 2015款 2.0T 五门风尚版',
                             short_description: '商品价格已包含购置税、上牌费、交强险费用）纹理真皮座椅，9速自动变速器，全景天窗，打造您的专属空间！',
                             cost_price: 488888.00,
                             description: '奇瑞路虎',
                             category: suv)

bmw3 = Vehicle.create(name: '2016款 宝马（BMW）3系 320i 时尚型 四门轿车',
                      short_description: '商品价格已包含购置税、上牌费、保险费用）优雅灵动，与生俱来的个性！',
                      cost_price: 389999.00,
                      description: '新BMW 3系起源于1975年，是运动型轿车的集大成之作。',
                      category: d_segment)

imac = Computer.create(name: '苹果（Apple）iMac MK462CH/A 27英寸一体电脑',
                      short_description: '配备Retina 5K 显示屏的iMac，画质如此夺目，足以让画面之外的世界都顿显失色！',
                      cost_price: 13488.00,
                      description: 'Retina 的大作，一款又一款。',
                      category: brand_apple)

macbook = Computer.create(name: '苹果（Apple）MacBook Pro MJLQ2CH/A 15.4英寸宽屏笔记本电脑',
                         short_description: '配备Retina 5K 显示屏的iMac，全新 MacBook，更为纤薄轻巧，更加出色！',
                         cost_price: 14288.00,
                         description: '13 英寸机型拥有超过 400 万像素，15 英寸机型拥有超过 500 万像素',
                         category: brand_apple)


review1 = Review.create(user: tim, 
                        product: range_rover,
                        content: "goood suv !!!",
                        rating: "5")

review2 = Review.create(user: jim, 
                        product: range_rover,
                        content: "delicious !!!",
                        rating: "5")

review3 = Review.create(user: kim, 
                        product: range_rover,
                        content: "nice !!!",
                        rating: "4")

cart_item = CartItem.create(user: tim, product: range_rover, position: 1)
cart_item = CartItem.create(user: tim, product: bmw3, position: 2)
cart_item = CartItem.create(user: tim, product: imac, position: 3)
cart_item = CartItem.create(user: tim, product: macbook, position: 4)
