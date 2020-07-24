FactoryBot.define do

  factory :user do
    email                     {"aaa@aaaa"}
    nickname                  {"hiro"}
    password                  {"aaaa1111"}
    password_confirmation     {"aaaa1111"}
    family_name               {"山田"}
    first_name                {"彩"}
    family_name_kana          {"ヤマダ"}
    first_name_kana           {"アヤ"}
    birth_year                {"1991"}
    birth_month               {"12"}
    birth_day                 {"24"}
  end
  
end