require 'user'
require 'credit_card'

class UserBuilder
  attr_accessor :user, :credit_card
  def initialize
    self.user = User.new
    self.credit_card = CreditCard.new
  end

  def with_name(name)
    self.user.name = name
    self
  end

  def with_cpf(cpf)
    self.user.cpf = cpf
    self
  end

  def with_age(age)
    self.user.age = age
    self
  end

  def with_basic_data(name, cpf, age)
    with_name(name)
    with_cpf(cpf)
    with_age(age)
    self
  end

  def with_credit_card_number(credit_card_number)
    self.credit_card.number = credit_card_number
    self
  end

  def with_credit_card_log(credit_card_log)
    self.credit_card.log = credit_card_log
    self
  end

  def with_credit_card_credit(credit_card_credit)
    self.credit_card.credit = credit_card_credit
    self
  end

  def build
    self.user.credit_card = self.credit_card
    self.user
  end
end