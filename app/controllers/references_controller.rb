class ReferencesController < ApplicationController

  def references
    @allRefs = []
    Dir[Rails.root.join('app/models/*.rb').to_s].each do |filename|
      model_name = File.basename(filename, '.rb').camelize.constantize
      next unless model_name.ancestors.include?(ActiveRecord::Base)
        @allRefs = @allRefs + model_name.all
    end

  end
end
