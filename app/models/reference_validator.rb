class ReferenceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    Dir[Rails.root.join('app/models/*.rb').to_s].each do |filename|
      model_name = File.basename(filename, '.rb').camelize.constantize
      next unless model_name.ancestors.include?(ActiveRecord::Base)
        unless (model_name.find_by reference: value).nil?
          record.errors[attribute] << (options[:message] || " must be unique")
      end
    end
  end

end
