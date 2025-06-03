class User < ApplicationRecord
  # Devise モジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }, if: :password_required?

  validates :nickname, presence: true

  # メール形式（@含む）・パスワード文字数・確認一致は Devise により自動適用されます

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }

  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }

  validates :birth_date, presence: true

  # アソシエーション
  has_many :items
  has_many :orders

  private

  # パスワードが必要な場合のみバリデーションをかける（新規登録 or パスワード入力時）
  def password_required?
    new_record? || !password.nil? || !password_confirmation.nil?
  end
end
