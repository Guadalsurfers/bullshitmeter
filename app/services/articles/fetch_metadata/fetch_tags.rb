class Articles::FetchMetadata
  class FetchTags
    def call(page)
      fetch_tags_from_meta(page).uniq
    end

    private

    def fetch_tags_from_meta(page)
      page.css('meta[property="article:tag"]').flat_map { |tag| tag['content'].split(",")}
    end
  end
end
