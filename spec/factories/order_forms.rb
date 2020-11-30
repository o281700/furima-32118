FactoryBot.define do
  factory :order_form do
    postal { '123-4567' }
    area_id { '15' }
    city { '横浜区緑区' }
    add { '青山1-1-1' }
    bldg { '柳ビル103' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
