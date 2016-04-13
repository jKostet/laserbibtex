module ModelToBib
  extend ActiveSupport::Concern

  def toBibTex
    str = '@' + self.model_name.singular + '{' + self.reference + ',' + "\n"

    self.attributes.reject{|x| x == id or x == reference}.each { |key, value|

      if value.to_s != "" && key != "id" && key != "reference" && key != "created_at" && key != "updated_at"
        line = "\t" << key << ' = {' << value.to_s << '},' << "\n"
        str << encode_special_chars(line)
       #puts "#{key} is #{value}"

      end
    }

    return str
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
