class Task < ApplicationRecord
  # name属性に値が設定されていない場合には、データベースへの保存ができなくなります(検証)
  validates :name, presence: true, length: { maximum: 30 }
  # 自前の検証メソッドを定義する
  validate :validate_name_not_include_comma
  # 検証前に実行されるコールバックメソッド(アプリでは使用しないのでコメントアウト)
  # before_validation :set_nameless_name

  belongs_to :user

  private

  # def set_nameless_name
  #   self.name = '名前なし' if name.blank?
  # end

  def validate_name_not_include_comma
    # name属性にカンマが含まれている場合には、エラーを追加する(&.でnilの場合には処理をスキップするようにしているがDBでnull制約をしているので検証エラーが発生する)
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
