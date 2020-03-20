class Prefecture < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  self.data = [
      {id: 1, area: '北海道'}, {id: 2, area: '青森県'}, {id: 3, area: '岩手県'},
      {id: 4, area: '宮城県'}, {id: 5, area: '秋田県'}, {id: 6, area: '山形県'},
      {id: 7, area: '福島県'}, {id: 8, area: '茨城県'}, {id: 9, area: '栃木県'},
      {id: 10, area: '群馬県'}, {id: 11, area: '埼玉県'}, {id: 12, area: '千葉県'},
      {id: 13, area: '東京都'}, {id: 14, area: '神奈川県'}, {id: 15, area: '新潟県'},
      {id: 16, area: '富山県'}, {id: 17, area: '石川県'}, {id: 18, area: '福井県'},
      {id: 19, area: '山梨県'}, {id: 20, area: '長野県'}, {id: 21, area: '岐阜県'},
      {id: 22, area: '静岡県'}, {id: 23, area: '愛知県'}, {id: 24, area: '三重県'},
      {id: 25, area: '滋賀県'}, {id: 26, area: '京都府'}, {id: 27, area: '大阪府'},
      {id: 28, area: '兵庫県'}, {id: 29, area: '奈良県'}, {id: 30, area: '和歌山県'},
      {id: 31, area: '鳥取県'}, {id: 32, area: '島根県'}, {id: 33, area: '岡山県'},
      {id: 34, area: '広島県'}, {id: 35, area: '山口県'}, {id: 36, area: '徳島県'},
      {id: 37, area: '香川県'}, {id: 38, area: '愛媛県'}, {id: 39, area: '高知県'},
      {id: 40, area: '福岡県'}, {id: 41, area: '佐賀県'}, {id: 42, area: '長崎県'},
      {id: 43, area: '熊本県'}, {id: 44, area: '大分県'}, {id: 45, area: '宮崎県'},
      {id: 46, area: '鹿児島県'}, {id: 47, area: '沖縄県'}
  ]
end