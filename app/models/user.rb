class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    validates :birthday, presence: true

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カタカナを使用してください' } do
      validates :last_furigana
      validates :first_furigana
    end
  end
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で設定してください' } do
    validates :password
  end
end
