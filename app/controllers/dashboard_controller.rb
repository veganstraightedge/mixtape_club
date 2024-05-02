class DashboardController < ApplicationController
  def index
    @draft_mixtapes     = Current.user.mixtapes.draft
    @secret_mixtapes    = Current.user.mixtapes.secret
    @published_mixtapes = Current.user.mixtapes.published
    @archived_mixtapes  = Current.user.mixtapes.archived
  end
end
