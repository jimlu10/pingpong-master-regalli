class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable


  def username
    email.split('@').first.titleize
  end

  def games_played
    Game.played_by(id)
  end

  def opponents
    User.where.not(id: id)
  end
end