require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should save " do
      user = User.new(
        first_name: "James",
        last_name:"Booker",
        email: "test@test.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save
      expect(user.errors.full_messages).to include()
    end
  end

 
    it "missing an email" do
        user = User.new(
          first_name: "James",
          last_name:"Booker",
          email: "",
          password: "string",
          password_confirmation: "string"
        )
        user.save
        expect(user.errors.full_messages).to include("Email is invalid")
      end

      it "missing a first name" do
        user = User.new(
          first_name: nil,
          last_name:"Booker",
          email: "test@test.com",
          password: "string",
          password_confirmation: "string"
        )
        user.save
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it "missing a last name" do
        user = User.new(
          first_name: "James",
          last_name:nil,
          email: "test@test.com",
          password: "string",
          password_confirmation: "string"
        )
        user.save
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it "passwords dont match" do
        user = User.new(
          first_name: "James",
          last_name: "Booker",
          email: "test@test.com",
          password: "string",
          password_confirmation: "ring"
        )
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "email must be unique" do
        user = User.new(
          first_name: "James",
          last_name: "Booker",
          email: "test@test.com",
          password: "string",
          password_confirmation: "string"
        )
        user1 = User.new(
          first_name: "James",
          last_name: "Booker",
          email: "Test@test.com",
          password: "string",
          password_confirmation: "string"
        )
        user.save
        user1.save
        expect(user1.errors.full_messages).to include("Email has already been taken")
      end

       it "should not save if number of password characters is less than 3" do
      user = User.new(
        first_name:"James",
        last_name:"Booker",
        email: "test@test.com",
        password: "st",
        password_confirmation: "st"
      )
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
    describe '.authenticate_with_credentials' do
      it "should pass with valid credentials" do
      user = User.new(
        first_name:"James",
        last_name:"Booker",
        email: "test@test.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save
      result = User.authenticate_with_credentials("test@test.com", "string")
      expect(result).not_to be(nil)
    end

    it "should not pass with invalid credentials" do
      user = User.new(
        first_name:"James",
        last_name:"Booker",
        email: "test@test.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save
      result = User.authenticate_with_credentials("test@test.com", "str")
      expect(result).to be(nil)
    end
   
    it "should pass with caps in email" do
      user = User.new(
        first_name:"James",
        last_name:"Booker",
        email: "test@test.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save
      result = User.authenticate_with_credentials("tEst@Test.com", "string")
      expect(result).not_to be(nil)
    end

    it "should pass with spaces around email" do
      user = User.new(
        first_name:"James",
        last_name:"Booker",
        email: "test@test.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save
      result = User.authenticate_with_credentials(" test@test.com ", "string")
      expect(result).not_to be(nil)
    end

  end
end
