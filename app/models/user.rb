class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable      
  
  has_many :cards 
  has_many :items
  # belongs_to :address, optional: true
  has_many  :addresses
  accepts_nested_attributes_for :addresses
  # バリデーション設定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_KANJI_KANA_KATAKANA_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANJI_REGEX = /\A[一-龥]+\z/
  # ふりがな
  VALID_KANA_REGEX = /\A[ぁ-んー－]+\z/
  # 全角ふりがな
  VALID_KANA_FUll_WIDTH = /\A^[ぁ-んァ-ヶー一-龠]+$\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i

  # ＜ユーザー情報：6項目＞
  # ニックネームが必須
  validates :nickname, presence: true, length: {maximum:50}
  # メールアドレスは一意
  validates :email, presence: true, uniqueness:true, length: { maximum:255 }, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'}

  # - パスワードは必須、7文字以上
  validates :password, presence:true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX, message:'は英字と数字両方を含むパスワードを設定してください'}
  # パスワードは確認用を含めて2回入力
  # validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}

  # <本人確認情報：5項目>
  # - ユーザー本名が、名字と名前でそれぞれ必須
  # - ユーザー本名は全角で(漢字、ひらがな、カタカナ）入力
  validates  :first_name,presence: true ,format: { with: VALID_KANJI_KANA_KATAKANA_REGEX, message:'は全角で入力してください'}
  validates  :second_name,presence: true ,format: { with: VALID_KANJI_KANA_KATAKANA_REGEX, message:'は全角で入力してください'}
  # - ユーザー本名のふりがなが、名字と名前でそれぞれ必須
  validates :hurigana_first, presence: true, length: { maximum: 35 }, format: { with: VALID_KANA_REGEX, message: 'はひらがなで入力して下さい'}
  validates :hurigana_second, presence: true, length: { maximum: 35 }, format: { with: VALID_KANA_REGEX, message: 'はひらがなで入力して下さい'}
  # - ユーザー本名のふりがなが、全角で必須
  validates :hurigana_first, presence: true, format: { with: VALID_KANA_FUll_WIDTH, message:'は全角で入力してください'}
  validates :hurigana_second, presence: true, format: { with: VALID_KANA_FUll_WIDTH, message:'は全角で入力してください'}
  # - 生年月日が必須
  def birthday
    "#{BirthYyyy.find(self.birth_yyyy_id).year}/#{BirthMm.find(self.birth_mm_id).month}/#{BirthDd.find(self.birth_dd_id).day}"
  end
  # - メールアドレスは@とドメインを含む必要がある
  # /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/
  
  # ＜商品送付先住所情報：6項目必須、2項目任意＞
  # 出品機能作成時に後ほど設定の為一旦保留
  # - 郵便番号が必須
  # validates :postaladdress, presence: true, format: { with: VALID_POSTAL_CODE, message: '郵便番号を入力してください'}
  # - 都道府県が必須
  # validates :Prefectures, presence: true
  # - 市区町村が必須
  # validates :Municipality, presence: true
  
  # - 送付先氏名が必要、名字と名前でそれぞれ必須
  # validates :Destination_name, presence: true
  # validates :first_name_kana, presence: true,format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  # validates :second_name_kana, presence: true,format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}

  # - 送付先氏名のふりがなが、名字と名前でそれぞれ必須
  # validates :validates :Destination name, presence: true,

  # - 番地が必須
  # validates :address, presence: true,

  # - マンション名やビル名、そしてその部屋番号は任意の為記載不要

  # - お届け先の電話番号は任意
  # /^\d{11}$/
  # record.errors[:name] << '電話番号は0から始まる必要があります'

end

