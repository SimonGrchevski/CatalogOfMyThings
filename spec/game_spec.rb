require_relative 'spec_helper'

describe Game do
  let(:game) { Game.new(true, '2001-01-02', { publish_date: '1999-01-02', archieved: false }) }
  describe '#new' do
    it 'should return an instance of Author' do
      expect(game).to be_an_instance_of Game
      expect(game).to be_kind_of Item
    end
  end

  describe '#multiplayer' do
    it 'should return true' do
      expect(game.multiplayer).to eq true
    end
    it 'should respond to multiplayer' do
      expect(game).to respond_to(:multiplayer)
    end
  end

  describe '#last_played_at' do
    it 'should return 2001-01-02' do
      expect(game.last_played_at).to eq '2001-01-02'
    end
    it 'should respond to last_played_at' do
      expect(game).to respond_to(:last_played_at)
    end
  end

  describe '#can_be_archived' do
    context 'when publish_date is less than 10 years and last played more than 2 years' do
      game1 = Game.new(true, '2018-01-02', { publish_date: '2019-01-02', archieved: false })
      it 'should return false' do
        expect(game1.can_be_archived?).to be_falsey
      end
    end

    context 'when publish_date is less than 10 years and last played less than 2 years' do
      game2 = Game.new(true, '2020-01-02', { publish_date: '2019-01-02', archieved: false })
      it 'should return false' do
        expect(game2.can_be_archived?).to be_falsey
      end
    end

    context 'when publish_date is over 10 years and last played over 2 years' do
      game3 = Game.new(true, '2001-01-02', { publish_date: '1999-01-02', archieved: false })
      it 'should return true' do
        expect(game3.can_be_archived?).to be_truthy
      end
    end

    context 'when publish_date is over 10 years and last played less than 2 years' do
      game4 = Game.new(true, '2020-01-02', { publish_date: '1999-01-02', archieved: false })
      it 'should return false' do
        expect(game4.can_be_archived?).to be_falsey
      end
    end
  end
end
