module MarkdownHelper
  def render_markdown text, inline_tags_only: false, allow_links: true, user: nil
    render_raw_markdown auto_linked_text(text, user:),
                        inline_tags_only:,
                        allow_links:
  end

  private

  def render_raw_markdown text, inline_tags_only: false, allow_links: true
    return if text.blank?

    html = Kramdown::Document.new(
      text,
      input:                     :kramdown,
      remove_block_html_tags:    false,
      transliterated_header_ids: true
    ).to_html.html_safe # rubocop:disable Rails/OutputSafety

    inline_tags_only ? strip_tags(html, allow_links:) : html
  end

  def hashtag_url_base user: nil
    hashtag_url_base  = ''
    hashtag_url_base  = user.path if user.present?
    hashtag_url_base += '/hashtags/'
    hashtag_url_base
  end

  # TEMP: remove rubocop magic comment after implementing twitter-text
  # rubocop:disable Lint/UnusedMethodArgument
  def auto_linked_text text, user: nil
    # use twitter-text gem?
    # auto_link text,
    #           username_include_symbol: true,
    #           username_url_base:       '/@',
    #           hashtag_url_base:        hashtag_url_base(user:),
    #           invisible_tag_attrs:     true
    text
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def strip_tags html, allow_links: true
    sanitize(html, tags: allowed_tags(allow_links:))
  end

  def allowed_tags allow_links: true
    allowed_tags = %w[b strong i em s code]
    allowed_tags << 'a' if allow_links

    allowed_tags
  end
end
