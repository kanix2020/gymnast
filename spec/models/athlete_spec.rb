require 'rails_helper'
RSpec.describe Athlete, type: :model do
  before do
    @athlete = FactoryBot.build(:athlete)
  end

  describe '正常系[新規登録/ユーザー情報]' do
    it '全ての項目が問題なく入力されていれば登録できる' do
      expect(@athlete).to be_valid
    end
  end

  describe '異常系[新規登録/ユーザー情報]' do
    it '名前が空では登録できない' do
      @athlete.name = ''
      @athlete.valid?
      expect(@athlete.errors.full_messages).to include('Nameを入力してください')
    end
    it '所属が「--」では登録できない' do
      @athlete.affiliation_id = '1'
      @athlete.valid?
      expect(@athlete.errors.full_messages).to include('Affiliationは「--」以外の値にしてください')
    end
    it '県名が「--」では登録できない' do
      @athlete.prefecture_id = '1'
      @athlete.valid?
      expect(@athlete.errors.full_messages).to include('Prefectureは「--」以外の値にしてください')
    end
    it '生年月日が空では登録できない' do
      @athlete.birthday = ''
      @athlete.valid?
      expect(@athlete.errors.full_messages).to include('Birthdayを入力してください')
    end
  end
end
