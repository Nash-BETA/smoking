require 'rails_helper'

RSpec.describe User, type: :model do
    describe "名前入力" do
        it "テスト君で入力" do
            user_name = User.new(name: "テスト君")
            expect(user_name.name).to eq "テスト君"
        end
    end
    describe "入力" do
        it "入力" do
            user_email = User.new(email: "test@gmail.com")
            expect(user_email.email).to eq "test@gmail.com"
        end
    end
end

