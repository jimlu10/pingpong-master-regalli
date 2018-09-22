class Game < ActiveRecord::Base
  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  before_create :calculate_result

  validates_presence_of :player, :opponent
  validate :score

  scope :played_by, ->(player_id) { where('player_id = ? OR opponent_id = ?', player_id, player_id) }

  def calculate_result
    self.winner_id = player_score > opponent_score ? player_id : opponent_id
  end

  def score
    if player_score >= 21 || opponent_score >= 21
      return true if (player_score - opponent_score).abs >= 2
      errors.add(:base, 'The winner needs to have a two point difference')
    else
      errors.add(:base, 'The minimun score to have a winner in 21')
    end
    false
  end
end
