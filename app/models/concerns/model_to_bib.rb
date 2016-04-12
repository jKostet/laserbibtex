module ModelToBib
  extend ActiveSupport::Concern

  def toBibTex
    str = '@' + self.model_name.singular + '{' + self.reference + ',' + '\n' +
    self.attribute_names.to_s
  end
end
