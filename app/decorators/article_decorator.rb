class ArticleDecorator < ApplicationDecorator
  delegate :title, :keywords, :pdf, :volume_id, :pdf_file_name
  decorates_associations :volume, :authors

  def author_names
    authors.map { |author| "<span class=nowrap>#{author.full_name}</span>" }.join(', ').html_safe
  end

  def pages
    source.first_page.to_s + source.other_pages.to_s
  end

  def keyword_list
    keywords.pluck(:name).join(', ')
  end

  def pdf_download_link
    h.link_to('Download', pdf.url) if pdf_file_name
  end

  def page_title
    [volume.roman_numeral, pages].reject(&:blank?).join(': ')
  end
end
