module ModelToBib
  extend ActiveSupport::Concern

  def toBibTex
    str = '@' + self.model_name.singular + '{' + self.reference + ',' + '\n' +
    self.attribute_names.to_s
  end


  def encode_special_chars(string)
    tabel = [
        ["ä", "\\\"{a}\""],
        ["Ä", "\\\"{A}\""],
        ["ö", "\\\"{o}\""],
        ["Ö", "\\\"{O}\""],
        ["AAA", "{A}{A}{A}"],
        ["CS", "{C}{S}"]
    ]

    tabel.each do |t|
      string.gsub!(t[0], t[1])
    end

    string
  end
end
