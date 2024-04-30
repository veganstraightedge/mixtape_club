module SettingsHelper
  def link_to_settings page:
    link_to settings_link_text(page),
            settings_link_path(page),
            class: settings_link_classes(page),
            aria:  { current: settings_link_aria_current(page) }
  end

  private

  def settings_link_text page
    page.to_s.humanize.capitalize
  end

  def settings_link_path page
    :"#{page}_settings"
  end

  def settings_link_classes page
    classes = %w[list-group-item list-group-item-action]

    classes << 'active' if request.path == "/settings/#{page.to_s.dasherize}"
    classes << 'active' if params[:form_name] == page.to_s

    classes.join ' '
  end

  def settings_link_aria_current page
    (action_name == page.to_s).presence
  end
end
