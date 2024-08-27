class AboutController < ApplicationController
  skip_before_action :authenticate_user!

  def privacy; end
  def terms;   end
end
