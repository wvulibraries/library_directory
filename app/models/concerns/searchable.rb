# Searchable
#
# @author David J. Davis
# @concern
# @since 0.0.1
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks
    index_name [base_class.to_s.pluralize.underscore, Rails.env].join('_')
    
    # set number of shards 
    settings number_of_shards: 1
    
    # create
    after_commit on: [:create] do
      __elasticsearch__.index_document if self.status == 'enabled'
    end

    # update
    after_commit on: [:update] do
      if self.status == 'enabled'
        __elasticsearch__.update_document
      else
        __elasticsearch__.delete_document
      end
    end

    # delete
    after_commit on: [:destroy] do
      __elasticsearch__.delete_document
    end
  end
end
