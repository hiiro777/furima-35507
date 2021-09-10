require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題ない場合' do
    it '全て正常' do
      expect(@user).to be_valid
    end
  end

  context '内容に問題がある場合' do
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
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationは一致していないと登録できない' do
      @user.password = 'aa1234'
      @user.password_confirmation = 'a12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数字でないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end
    it 'passwordは半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end
    it 'passwordは半角英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = 'a123'
      @user.password_confirmation = 'a123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'emailは一意性でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@がないと登録できない' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'ab1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
    end
    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'ab1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
    end
    it 'last_furiganaが全角カタカナでなければ登録できない' do
      @user.last_furigana = 'あ1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last furigana には全角カタカナを使用してください')
    end
    it 'first_furiganaが全角カタカナでなければ登録できない' do
      @user.first_furigana = 'あ1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('First furigana には全角カタカナを使用してください')
    end
  end
end
