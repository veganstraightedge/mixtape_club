module UsersHelper
  def placeholder_profile_image_url size: 600
    hex_range = (0..9).to_a + ('a'..'f').to_a
    color = [hex_range.sample, hex_range.sample, hex_range.sample].join
    "https://via.placeholder.com/#{size}/#{color}?text=+"
  end

  def avatar_image_tag user:, width: nil, tilt: false, shadow: true
    classes = []
    classes << 'rounded'
    classes << 'shadow' if shadow
    classes << random_tilted_class if tilt

    url = if user.avatar.attached?
            user.avatar.variant(resize_to_limit: [width, width])
          else
            placeholder_profile_image_url size: width
          end

    image_tag url, class: classes.join(' ')
  end

  def random_tilted_class
    "tilted-#{rand(1..13)}"
  end
end
