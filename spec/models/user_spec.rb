require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "is invalid without a password" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a passwoed_confirmation" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user, passwoed_confirmation: "")
      user.valid?
      expect(user.errors[:passwoed_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname that has more than 7 characters" do
      # ↑これはexampleの説明
    # 上記はネストを組む事でUserクラスにあるcreateメソッドをテストするという意味
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long maximum is 6 characters)")
    end


    it "is invalid with a nickname that has less than 6 characters" do
      user = build(:user, nickname: "aaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      # 初めにユーザーを登録
      another_user = build(:user)
      # 先に登録したユーザーと同じemailを持つユーザーのインスタンスを登録
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end