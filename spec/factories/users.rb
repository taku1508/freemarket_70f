FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk22@gmail.com"}
    password              {"0000aaaa"}
    first_name            {"山田"}
    second_name           {"太郎"}          
    hurigana_first        {"やまだ"}
    hurigana_second       {"たろう"}
    birthday_year         {1999}
    birthday_month        {3}
    birthday_day          {19}

    # password_confirmation {"00000000"}


  end

end