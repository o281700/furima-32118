FactoryBot.define do
  factory :comment do
    text { 'コメントテスト' }
    user { create(:user) }
    item { create(:item) }
  end
end
