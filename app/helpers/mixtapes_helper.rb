module MixtapesHelper
  def visibility_badge mixtape
    badge_classes = 'badge text-light '

    badge_classes << case mixtape.visibility.to_sym
                     when :draft     then 'text-bg-warning'
                     when :secret    then 'text-bg-info'
                     when :published then 'text-bg-primary'
                     when :archived  then 'text-bg-danger'
                     else                 'text-bg-secondary'
                     end

    content_tag :span, mixtape.visibility.upcase, class: badge_classes
  end
end
