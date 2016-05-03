FactoryGirl.define do
  factory :article do
    reference "A2016"
    author "pirjospiruliina"
    title "purjojen sielunelämä"
    journal "asd journal"
    year 2016
    volume 2
  end
  factory :article_specials, class: Article do
    reference "A2016b"
    author "Ääkkönen Yrjö"
    title "AAA CS"
    journal "asd journal"
    year 2015
    volume 2
  end
  factory :article_multiple, class: Article do
    reference "A2080"
    author "Pitäjä Yllä and Koodari Kalle"
    title "Otsikoiden ihmeet"
    journal "asd journal"
    year 2080
    volume 6
  end
  factory :book do
    reference "B2016"
    author "jarikorianteri"
    title "puffet on hyvää"
    publisher "asd publishing"
    year 2016
  end
  factory :inproceeding do
    reference "I2015"
    author "ville vallaton"
    title "otsikko"
    booktitle "jätskit kautta aikojen"
    year 2015
  end
end
