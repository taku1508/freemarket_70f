# User.create!(
#   [
#     {
#       email: 'test1@test.com',
#       password: 'aaaaaa',
#       nickname: 'hhhhhh',
#       first_name: 'iu',
#       second_name: 'eo',
#       hurigana_first: 'iu',
#       hurigana_second: 'eo',
#       birthday_year: "1999",
#       birthday_month: "08",
#       birthday_day: "16"
#     }
#   ]
# )
# lady = Category.create(name: "レディース")

# lady_tops = lady.children.create(name: "トップス")
# lady_jacket = lady.children.create(name: "ジャケット/アウター")
# lady_pants = lady.children.create(name: "パンツ")
# lady_skirt = lady.children.create(name: "スカート")
# lady_onepiece = lady.children.create(name: "ワンピース")
# lady_shoes = lady.children.create(name: "靴")
# lady_roomwear = lady.children.create(name: "ルームウェア/パジャマ")
# lady_legwear = lady.children.create(name: "レッグウェア")
# lady_hat = lady.children.create(name: "帽子")
# lady_bag = lady.children.create(name: "バッグ")
# lady_accessories = lady.children.create(name: "アクセサリー")
# lady_hairaccessories = lady.children.create(name: "ヘアアクセサリー")
# lady_smallarticle = lady.children.create(name: "小物")
# lady_watch = lady.children.create(name: "時計")
# lady_wig = lady.children.create(name: "ウィッグ/エクステ")
# lady_yukata = lady.children.create(name: "浴衣/水着")
# lady_suit = lady.children.create(name: "スーツ/フォーマル")
# lady_maternity = lady.children.create(name: "マタニティー")
# lady_other = lady.children.create(name: "その他")

# lady_tops.children.create([{name: "Tシャツ/カットソー（半袖/袖なし）"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"},{name: "ポロシャツ"}])
# lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])
# lady_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"},{name: "ハーフパンツ"}])
# lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"},{name: "その他"}])
# lady_onepiece.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"},{name: "その他"}])
# lady_shoes.children.create([{name: "ハイヒール/パンプス"}, {name: "ブーツ"}, {name: "サンダル"},{name: "その他"}])
# lady_roomwear.children.create([{name: "パジャマ"}, {name: "ルームウェア"}, {name: "その他"}])
# lady_legwear.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "ストッキング/タイツ"},{name: "その他"}])
# lady_hat.children.create([{name: "ニットキャップ/ビーニー"}, {name: "ハット"}, {name: "ハンチング/ベレー帽"},{name: "その他"}])
# lady_bag.children.create([{name: "ハンドバッグ"}, {name: "トートバッグ"}, {name: "エコバッグ"},{name: "その他"}])
# lady_accessories.children.create([{name: "ネックレス"}, {name: "ブレスレット"}, {name: "バングル/リストバンド"},{name: "その他"}])
# lady_hairaccessories.children.create([{name: "ヘアゴム/シュシュ"}, {name: "ヘアバンド/カチューシャ"}, {name: "ヘアピン"},{name: "その他"}])
# lady_smallarticle.children.create([{name: "長財布"}, {name: "折り財布"}, {name: "コインケース/小銭入れ"},{name: "その他"}])
# lady_watch.children.create([{name: "腕時計(アナログ)"}, {name: "腕時計(デジタル)"}, {name: "ラバーベルト"},{name: "その他"}])
# lady_wig.children.create([{name: "前髪ウィッグ"}, {name: "ロングストレート"}, {name: "ロングカール"},{name: "その他"}])
# lady_yukata.children.create([{name: "浴衣"}, {name: "着物"}, {name: "振袖"},{name: "その他"}])
# lady_suit.children.create([{name: "スカートスーツ上下"}, {name: "パンツスーツ上下"}, {name: "ドレス"},{name: "その他"}])
# lady_maternity.children.create([{name: "トップス"}, {name: "アウター"}, {name: "インナー"},{name: "その他"}])
# lady_other.children.create([{name: "コスプレ"}, {name: "下着"}, {name: "その他"}])

Item.create!(
  [
    {
      name: 'taku',
      description: '25歳、独身、無職、大阪市内居住',
      status: '新品',
      shipping_charges: '無料',
      area: '大阪府',
      days: '2日以内',
      price: '300',
      user_id: '1',
      category_id: '1'
    }
  ]
)
Image.create!(
  [
    {
      image: File.open('./app/assets/images/food_spaghetti_neapolitan.png'),
      item_id: '1'
    }
  ]
)