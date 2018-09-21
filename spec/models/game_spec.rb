require 'rails_helper'

RSpec.describe Game, type: :model do

  context 'Active record Validations' do
    it { is_expected.to validate_presence_of(:player) }

    it { is_expected.to validate_presence_of(:opponent) }
  end

  context 'when score is incorrect' do

    it 'should return error by point difference' do
      game = build(:game, player_score: 21, opponent_score: 20)
      expect(game.valid?).to be_falsey
    end

    it 'should return error by minimum score of 21' do
      game = build(:game, player_score: 20, opponent_score: 20)
      expect(game.valid?).to be_falsey
    end
  end

  context 'when score is correct' do
    it 'should not have any error with score' do
      game = build(:game, player_score: 21, opponent_score: 18)
      expect(game.valid?).to be true
    end

    it 'should be player the winner' do
      game = create(:game, player_score: 21, opponent_score: 18)
      expect(game.winner).to eq(game.player)
    end

    it 'should be opponent the winner' do
      game = create(:game, player_score: 21, opponent_score: 23)
      expect(game.opponent).to eq(game.opponent)
    end
  end
end