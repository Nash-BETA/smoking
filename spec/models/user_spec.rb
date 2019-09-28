require 'rails_helper'

RSpec.describe User, type: :model do
    it "名前入力のテスト" do
        user = User.new(
                name: "テスト君"
        )
        expect(user.name).to eq "テスト君"
    end
end
