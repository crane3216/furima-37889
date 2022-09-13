FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { 'あああ' }
    house_number    { 'あああ' }
    building        { 'あああ' }
    phone_number    { '08011111111' }
    token           {"tok_abcdefghijk00000000000000000"}
  end
end