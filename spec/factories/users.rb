FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_furigana          { 'ヤマダ' }
    first_furigana         { 'タロウ' }
    email                  { 'a@a' }
    password               { 'aa1234' }
    password_confirmation  { password }
    birthday               { '1950/1/1' }
  end
end
