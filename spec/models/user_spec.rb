require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_furiganaが空では登録できない' do
      @user.last_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana can't be blank")
    end
    it 'first_furiganaが空では登録できない' do
      @user.first_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation Password is invalid. Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationは一致していないと登録できない' do
      @user.password = 'aa1234'
      @user.password_confirmation = 'a12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationは半角英数字でないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationは6文字以上でないと登録できない' do
      @user.password = 'a123'
      @user.password_confirmation = 'a123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'emailは一意性でないと登録できない' do
      @user.email = 'a@a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end
end

