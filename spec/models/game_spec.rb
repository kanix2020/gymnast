require 'rails_helper'
RSpec.describe Game, type: :model do
  before do
    @game = FactoryBot.build(:game)
  end

  describe '正常系[新規登録/ユーザー情報]' do
    it '全ての項目が問題なく入力されていれば登録できる' do
      expect(@game).to be_valid
    end
  end

  describe '異常系[新規登録/ユーザー情報]' do
    it '大会名が空では登録できない' do
      @game.name = ''
      @game.valid?
      expect(@game.errors.full_messages).to include('Nameを入力してください')
    end
    it '会場名が空では登録できない' do
      @game.venue = ''
      @game.valid?
      expect(@game.errors.full_messages).to include('Venueを入力してください')
    end
    it '県が「--」では登録できない' do
      @game.prefecture_id = '1'
      @game.valid?
      expect(@game.errors.full_messages).to include('Prefectureは「--」以外の値にしてください')
    end
    it '開催日が空では登録できない' do
      @game.event_day = ''
      @game.valid?
      expect(@game.errors.full_messages).to include('Event dayを入力してください')
    end
  end
end
