class Turn
  attr_accessor :user_guess, :current_card
  def initialize (user_guess, current_card)
    @user_guess = user_guess
    @current_card = current_card
  end
  def guess
    @user_guess
  end
  def card
    @current_card
  end
  def correct?
    @user_guess == @current_card.answer ? true : false
  end

  def feedback
    @user_guess == @current_card.answer ? "Correct!" : "Incorrect."
  end
end