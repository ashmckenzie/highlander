module Slugger
  extend ActiveSupport::Concern

  included do
    class << self
      alias_method :original_find, :find
      alias_method :find, :with_id_or_slug
    end
  end

  module ClassMethods

    def with_id_or_slug lookup
      query = lookup.to_s.match(/^\d+$/) ? "#{table_name}.id = ?" : "#{table_name}.slug = ?"
      where(query, lookup).first
    end
  end
end
