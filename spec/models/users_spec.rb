require 'rails_helper'
  describe User do
    describe '#create' do
      # # nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
      # it "is valid with a nickname, email, password, password_confirmation" do
      #   user = build(:user)
      #   expect(user).to be_valid
      # end
      # # nicknameが空では登録できないこと
      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      #  # emailは一意
      # it "is invalid with a duplicate email address" do
      #   user = create(:user)
      #   another_user = build(:user, email: user.email)
      #   another_user.valid?
      #   expect(another_user.errors[:email]).to include("has already been taken")
      # end
      # # emailが空では登録できないこと
      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      # # emailが7文字以下では登録できること
      it "is valid with a nickname that has less than 7 characters " do
        user = build(:user, nickname: "aaaaaaa")
        expect(user).to be_valid
      end
      # # passwordが空では登録できないこと
      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      # # passwordが7文字以上であれば登録できること
      # it "is valid with a password that has more than 7 characters " do
      #   user = build(:user, password: "0000000", password_confirmation: "0000000")
      #   user.valid?
      #   expect(user).to be_valid
      # end
      # # it "is invalid without a password_confirmation although with a password" do
      # #   user = build(:user, password_confirmation: "")
      # #   user.valid?
      # #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      # # end

      # # 名字が空では登録出来ないこと
      it "is invalid without a first_name" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end
      # # 名前が空では登録出来ないこと
      it "is invalid without a second_name" do
        user = build(:user, second_name: nil)
        user.valid?
        expect(user.errors[:second_name]).to include("can't be blank")
      end
      # # ふりがな名字が空では登録出来ないこと
      it "is invalid without a hurigana_first" do
        user = build(:user, hurigana_first: nil)
        user.valid?
        expect(user.errors[:hurigana_first]).to include("can't be blank")
      end
      # # ふりがな名前が空では登録出来ないこと
      it "is invalid without hurigana_second" do
        user = build(:user, hurigana_second: nil)
        user.valid?
        expect(user.errors[:hurigana_second]).to include("can't be blank")
      end
      # 生年月日が空では登録出来ないこと
      # it "is invalid without birthday" do
      #   user = build(:user, birthday: nil)
      #   user.valid?
      #   expect(user.errors[:birthday]).to include("can't be blank")
      
      it "is invalid with a duplicate email address" do
        はじめにユーザーを登録
        user = create(:user)
        #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      
    # end
  end
end

