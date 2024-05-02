module MixtapesHelper
  def visibility_badge mixtape
    return unless mixtape.user == Current.user

    badge_classes = 'badge text-light '

    badge_classes << case mixtape.visibility.to_sym
                     when :draft     then 'text-bg-warning'
                     when :secret    then 'text-bg-info'
                     when :published then 'text-bg-dark'
                     when :archived  then 'text-bg-danger'
                     else                 'text-bg-secondary'
                     end

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
