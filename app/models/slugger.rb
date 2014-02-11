module Slugger
  extend ActiveSupport::Concern

  included do
    class << self
      alias_method :original_find, :find
      alias_method :find, :find_by_id_or_slug
    end

    before_validation :set_slug, on: :create

    validates :slug, uniqueness: true, presence: true, on: :create

    def to_param
      slug
    end

    def set_slug
      self.slug = name.downcase.gsub(/[^a-z0-9\.\-\s]/i, '').gsub(/[\s+\.]/, '-')
    end
  end

  module ClassMethods

    def find_by_id_or_slug lookup
      where_id_or_slug(lookup).first
    end

    def where_id_or_slug lookup
      query = lookup.to_s.match(/^\d+$/) ? "#{table_name}.id = ?" : "#{table_name}.slug = ?"
      where(query, lookup)
    end
  end
end
