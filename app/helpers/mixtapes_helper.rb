module MixtapesHelper
  def color_for_visibility visibility
    case visibility.to_sym
    when :draft     then 'warning'
    when :secret    then 'info'
    when :published then 'primary'
    when :archived  then 'danger'
    else                 'secondary'
    end
  end

  def visibility_badge mixtape
    badge_classes = "badge text-light text-bg-#{color_for_visibility mixtape.visibility}"

    content_tag :span, mixtape.visibility.upcase, class: badge_classes
  end

  def cover_image_tag mixtape:, width: nil, height: width
    height = width if height.blank?

    url = if mixtape.cover.attached?
            mixtape.cover.variant resize_to_limit: [width, height]
          else
            placeholder_image_url width:, height:
          end

    image_tag url
  end
end
