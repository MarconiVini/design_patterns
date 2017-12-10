# Ruby Builder Pattern

This is a simple desmonstration of how to use the pattern builder to assembly rather complex object in a way it does became very simple to read and construct. 

I like to use this pattern in configuration objects, in unit tests to build the elements I am going to use and in converter objects where I have the need to transport data from one object to another.

The pattern could be used to create valid and yet complex objects like this:

    user = UserBuilder.new
      .with_age(33)
      .with_cpf('343.425.555-33')
      .with_credit_card(CreditCard.new(20_999))
      .build

It becames very clear to us what properties the user will have after the builder is done with its work. The main thing is that you add new methods to UserBuilder to abstract any of User complex initializations, or even merging some data like "with_basic_data(name, cpf, age)" that initializes name, cpf and age in a single method.