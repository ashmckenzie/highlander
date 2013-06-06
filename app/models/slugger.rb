module Slugger
  extend ActiveSupport::Concern

  included do
    class << self
      alias_method :original_find, :find
      alias_method :find, :with_id_or_slug
    end

    validates :slug, uniqueness: true, presence: true, on: :create

    before_validation :set_slug, on: :create

    def to_param
      slug
    end

    def set_slug
      new_slug = name.downcase.gsub(/[^a-z0-9\.\-\s]/i, '').gsub(/[\s+\.]/, '-')
      self.slug = new_slug
    end
  end

  module ClassMethods

    def with_id_or_slug lookup
      query = lookup.to_s.match(/^\d+$/) ? "#{table_name}.id = ?" : "#{table_name}.slug = ?"
      where(query, lookup).first
    end
  end
end
