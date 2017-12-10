require 'credit_card'

class User
  attr_accessor :name, :age, :cpf, :credit_card

  def initialize
    self.credit_card = CreditCard.new
  end
  
end