require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'ユーザー新規登録' do
  it "nicknameが空だと登録できない" do
    user = FactoryBot.build(:user)  # Userのインスタンス生成
    user.nickname = ""  # nicknameの値を空にする
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
  end


end
end


# それぞれのカラム名について記入する
# ニックネームが必須であること 完了

メールアドレス
メールアドレスが必須であること
メールアドレスが一意性であること
メールアドレスは、@を含む必要があること