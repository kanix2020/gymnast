require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '正常系[新規登録/ユーザー情報]' do
    it '全ての項目が問題なく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  describe '異常系[新規登録/ユーザー情報]' do
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'メールアドレスが一意であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスに＠が含まれていること' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードは、全角では登録できないこと' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    # it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
    #   @user.lastname = ''
    #   @user.firstname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include('苗字を入力してください')
    # end
  end
end
