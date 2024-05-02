module UsersHelper
  def placeholder_image_url width: 600, height: nil
    height = width if height.blank?

    hex_range = (0..9).to_a + ('a'..'f').to_a
    color = [hex_range.sample, hex_range.sample, hex_range.sample].join
    "https://via.placeholder.com/#{width}x#{height}/#{color}?text=+"
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

  def avatar_image_tag user:, width: nil, height: width, tilt: false, shadow: true
    height = width if height.blank?

    classes = []
    classes << 'rounded'
    classes << 'shadow' if shadow
    classes << random_tilted_class if tilt

    url = if user.avatar.attached?
            user.avatar.variant resize_to_limit: [width, width]
          else
            placeholder_image_url width:, height:
          end

    image_tag url, class: classes.join(' ')
  end

  def random_tilted_class
    "tilted-#{rand(1..13)}"
  end
end
