require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it "should save" do
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if first_name field is blank" do
        user = User.new(
            first_name: "",
            last_name: 'chang',
            email: 'schang@codingdojo.com')
      expect(user).to be_invalid
    end
# +++++++++++++++++++++++++++++++++++++++++++++++++++
    it "should not save if last_name field is blank" do

      user2 = User.new(
        first_name: "asdsd",
        last_name: '',
        email: 'schang@codingdojo.com')
      expect(user2).to be_invalid
    end
  #++++++++++++++++++++++++++++++++++++++++++++++++++++
    it "should not save if email already exists" do
      user3 = User.new(first_name:"Ali", last_name:"asd", email:"schang@codingdojo.com")
      user3.save
      user4 = User.new(
        first_name: "asdsd",
        last_name: 'asdads ',
        email: 'schang@codingdojo.com')
  expect(user4).to be_invalid
    end
  #++++++++++++++++++++++++++++++++++++++++++++++++
    it "should contain a valid email" do
      user5 = User.new(first_name:"Ali", last_name:"asd", email:"schang@codingdojo")

  expect(user5).to be_invalid
end

  end #end of context
end
