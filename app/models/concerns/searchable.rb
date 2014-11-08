module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    after_commit :upsert_to_search_index!

    # Reset search index for the entire model 1000 rows at a time
    def self.reset_search_index!
      self.import force: true, batch_size: 1000, transform: lambda {|item| item.to_search_mapping }
    end

    def self.search(query)
      __elasticsearch__.search(
        query: {
          match: {
            key: query.downcase
          }
        },
        size: 25
      ).records
    end
  end

  # Override this method to change the search mapping for this model
  def to_search_mapping
    if self.respond_to?(:label)
      key = self.label
    else
      key = self.name
    end

    { index:
      {
        _id: id,
        data: {
          key: key.downcase,
          type: self.class.table_name
        }
      }
    }
  end

  # Insert/update a single row instance
  def upsert_to_search_index!
    self.class.where(id: id).import transform: lambda {|item| item.to_search_mapping }
  end
end