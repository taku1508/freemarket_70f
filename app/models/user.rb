class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :cards 
  has_many :items
  # belongs_to :address, optional: true
  has_one :address

  # バリデーションの設定
⭕️ユーザー情報
# - ニックネームが必須
validates :nickname, presence: true, 
# - メールアドレスは一意である
validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

# - メールアドレスは@とドメインを含む必要がある
/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/

# - パスワードが必須
validates :password, presence: true, 

# - パスワードは7文字以上
validates :title,  length: { minimum: 7 } 


# - パスワードは確認用を含めて2回入力する


⭕️本人確認情報

- ユーザー本名が、名字と名前でそれぞれ必須

validates :phoneticName, presence: true, 
validates :名字, presence: true, 
validates :名前, presence: true, 


# - ユーザー本名は全角で入力させる
validates : 
,/^[ぁ-んァ-ヶー一-龠]+$/

- ユーザー本名のふりがなが、名字と名前でそれぞれ必須
validates :ふりがな名字, presence: true, 
validates :ふりがな名前, presence: true, 

# - ユーザー本名のふりがなは全角で入力させる
validates : 
,/^[ぁ-んァ-ヶー一-龠]+$/

# - 生年月日が必須
validates :＿＿, presence: true, 

# - 商品送付先住所情報
validates :＿＿, presence: true,

- 送付先氏名が、名字と名前でそれぞれ必須

validates :＿＿, presence: true,  

- 送付先氏名のふりがなが、名字と名前でそれぞれ必須
validates :＿＿, presence: true,  

# - 郵便番号が必須
validates :postalAddress, presence: true, 

# - 都道府県が必須
validates :＿＿, presence: true, 

# - 市区町村が必須
validates :＿＿, presence: true, 

# - 番地が必須
validates :＿＿, presence: true, 

- マンション名やビル名、そしてその部屋番号は任意
validates :email, presence: true, uniqueness: true, 



- お届け先の電話番号は任意
/^\d{11}$/
record.errors[:name] << '電話番号は0から始まる必要があります'


end
