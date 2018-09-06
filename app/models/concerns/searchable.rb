# Searchable
#
# @author David J. Davis
# @concern
# @since 0.0.1
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name [base_class.to_s.pluralize.underscore, Rails.env].join('_')
  end
end
