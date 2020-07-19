FactoryBot.define do
  factory :item do
    name                 {"A"}
    description          {"aaa"}
    condition            {"新品、未使用"}
    delivery_fee         {"送料込み(出品者負担)"}
    delivery_regions     {"北海道"}
    shipping_schedule    {"1~2日で発送"}
    brand                {"コム・デ・ギャルソン"}
    price                {"100000"}
    user_id              {create(:user).id}
    category_id          {create(:category).id}
  end
end