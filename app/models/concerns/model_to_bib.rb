module ModelToBib
  extend ActiveSupport::Concern

  def toBibTex
    str = '@' + self.model_name.singular + '{' + self.reference + ',' + "\n"

    self.attributes.except("id", "reference", "created_at", "updated_at").each { |key, value|
        next unless value.present?

        line = "\t" << key << ' = {' << value.to_s << '},' << "\n"
        str << encode_special_chars(line)
    }
    str << "}\n\n"
    str
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
