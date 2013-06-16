require 'unshorten'

module PayloadAdapters

  class TweetContent

    def initialize(content)
      @content = content
    end

    def to_s
      content
    end

    def high_value?
      links_to_agile_aus?
    end

    def shortened_link_matcher
      /\w+.\w+\/[\S]+/
    end

    private

    attr_reader :content

    def links_to_agile_aus?
      unshortened_content.downcase.include? 'agileaustralia.com.au'
    end

    def unshortened_content
      @unshortened_content ||= begin
        unshortened = content
        shortened_links.each do |shortened_link|
          unshortened.gsub!(shortened_link, Unshorten[shortened_link])
        end
        unshortened
      end
    end

    def shortened_links
      content.scan(shortened_link_matcher).flatten
    end

  end

end
