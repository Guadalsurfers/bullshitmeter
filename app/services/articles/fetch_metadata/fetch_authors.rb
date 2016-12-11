class Articles::FetchMetadata
  class FetchAuthors
    def call(page)
      [
        *fetch_authors_from_meta(page),
        *fetch_authors_from_schema(page)
      ].uniq
    end

    private

    def fetch_authors_from_meta(page)
      page.css('meta[name="author"]').map { |tag| tag['content']}
    end

    def fetch_authors_from_schema(page)
      page.search("//*[@itemtype='http://schema.org/Person' and @itemprop='author']").
           search("[@itemprop='name']").map(&:text)
    end
  end
end
