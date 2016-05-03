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
    author "pirjospiruliina and purjospurdoliina and spurdospräläläälä"
    title "Otsikoiden ihmeet"
    journal "asd journal"
    year 2080
    volume 6
  end
  factory :article_with_tags, class: Article do
    reference "A2016"
    author "pirjospiruliina"
    title "purjojen sielunelämä"
    journal "asd journal"
    year 2016
    volume 2
    tags "spirulina ruokainen"
  end
  factory :book do
    reference "B2016"
    author "jarikorianteri"
    title "puffet on hyvää"
    publisher "asd publishing"
    year 2016
  end
  factory :book_multiple, class: Book do
    reference "B2080"
    author "Miäs Tyä and Juhla Vapu"
    title "ei lopu"
    publisher "asd publishing"
    year 2080
  end
  factory :book_with_tags, class: Book do
    reference "B2016"
    author "jarikorianteri"
    title "puffet on hyvää"
    publisher "asd publishing"
    year 2016
    tags "raikas fresh"
  end
  factory :inproceeding do
    reference "I2015"
    author "ville vallaton"
    title "otsikko"
    booktitle "jätskit kautta aikojen"
    year 2015
  end
  factory :inproceeding_multiple, class: Inproceeding do
    reference "I2080"
    author "Tiede Kerho and Muksu Puksu"
    title "Dinosaurus"
    booktitle "Isoja otuksia"
    year 2080
  end
  factory :inproceeding_with_tags, class: Inproceeding do
    reference "I2015"
    author "ville vallaton"
    title "otsikko"
    booktitle "jätskit kautta aikojen"
    year 2015
    tags "jaatelo runsas"
  end
end
