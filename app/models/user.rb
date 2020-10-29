class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }

# メールアドレスが一意性であること


PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
# パスワードは、半角英数字混合での入力が必須であるこ
# パスワードは、確認用を含めて2回入力すること

validates :nickname, presence: true

with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
validates :last_name
validates :first_name
end
# ユーザー本名は、名字と名前がそれぞれ必須であること
# ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること

　with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: '全カタカナのみで使用してください' } do
　validates :last_name_kana,
  validates :first_name_kana
　end

# ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
# ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること

validates :birthday, presence: true


# メールアドレスが必須であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること
# パスワードは、6文字以上での入力が必須であること
# パスワードとパスワード（確認用）、値の一致が必須であること




# エラーハンドリングができていること