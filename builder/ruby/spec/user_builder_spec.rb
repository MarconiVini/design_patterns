require 'user_builder'
require 'user'

describe UserBuilder do
  let(:builder) { UserBuilder.new }
  let(:name) { "Marcos" }
  let(:age) { 30 }
  let(:cpf) { '363.838.939-44' }
  let(:credit_card_number) { '3254.5554.7364.5677' }
  let(:credit_card_log) { 'lorem lorem ipsun sammet.' }
  let(:credit_card_credit) { 30_043.44 }

  it 'initializes' do
    expect(builder).not_to eq nil
  end

  it 'builds basic ruby object' do
    expect(builder.build.class).to eq User
  end

  describe '#with_name' do
    it 'sets user name' do
      user = builder.with_name(name).build
      expect(user.name).to eq name
    end
  end

  describe '#with_age' do
    it 'sets user age' do
      user = builder.with_age(age).build
      expect(user.age).to eq age
    end
  end

  describe '#with_cpf' do
    it 'sets user cpf' do
      user = builder.with_cpf(cpf).build
      expect(user.cpf).to eq cpf
    end
  end

  describe '#with_basic_data' do
    it 'sets user cpf, name and age' do
      user = builder.with_basic_data(name, cpf, age).build
      expect(user.name).to eq name
      expect(user.age).to eq age
      expect(user.cpf).to eq cpf
    end
  end

  describe 'credit card' do
    describe '#with_credit_card_number' do
      it 'sets credit card number' do
        user = builder.with_credit_card_number(credit_card_number).build
        expect(user.credit_card.number).to eq credit_card_number
      end
    end

    describe '#with_credit_card_log' do
      it 'sets credit card log' do
        user = builder.with_credit_card_log(credit_card_log).build
        expect(user.credit_card.log).to eq credit_card_log
      end
    end

    describe '#with_credit_card_credit' do
      it 'sets credit card credit' do
        user = builder.with_credit_card_credit(credit_card_credit).build
        expect(user.credit_card.credit).to eq credit_card_credit
      end
    end

    describe '#with_credit_card_data' do
      it 'sets credit card information' do
        user = builder.with_credit_card_data(credit_card_number, credit_card_credit, credit_card_log).build
        expect(user.credit_card.number).to eq credit_card_number
        expect(user.credit_card.credit).to eq credit_card_credit
        expect(user.credit_card.log).to eq credit_card_log
      end
    end

    describe '#with_credit_card' do
      it 'sets credit card object' do
        credit_card = CreditCard.new
        credit_card.number = credit_card_number
        credit_card.credit = credit_card_credit
        credit_card.log = credit_card_log

        user = builder.with_credit_card(credit_card).build
        expect(user.credit_card.number).to eq credit_card_number
        expect(user.credit_card.credit).to eq credit_card_credit
        expect(user.credit_card.log).to eq credit_card_log
      end
    end
  end
end