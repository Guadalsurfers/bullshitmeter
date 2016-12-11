class Articles::FetchMetadata
  class FetchAuthors
    def call(page)
      authors = []
      authors += fetch_authors_from_meta(page)
    end

    private

    def fetch_authors_from_meta(page)
      page.css('meta[name="author"]').map { |tag| tag['content']}
    end

    def fetch_authors_from_schema(page)
      page.css('meta[name="author"]').map { |tag| tag['content']}

    end
  end
end
