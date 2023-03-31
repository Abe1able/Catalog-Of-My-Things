require_relative '../src/game'

describe Game do
  before(:each) do
    @game = Game.new('2023-05-04', '2021-07-02', multiplayer: true)
  end

  context 'create game' do
    it 'check multiplayer' do
      expect(@game.multiplayer).to eq true
    end

    it 'check when last played' do
      expect(@game.last_played_at).to eq '2023-05-04'
    end

    it 'check if it can be archived' do
      @game.can_be_archived?
      expect(@game.can_be_archived?).to eq false
    end
  end
end
