class DashboardController < ApplicationController
  def index
    @mixtape = Current.user.mixtapes.new

    @draft_mixtapes     = Current.user.mixtapes.draft
    @secret_mixtapes    = Current.user.mixtapes.secret
    @published_mixtapes = Current.user.mixtapes.published
    @archived_mixtapes  = Current.user.mixtapes.archived
  end
end
