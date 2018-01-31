class PagesController < ApplicationController
  def about_us
  end

  def communication
  end

  def references
  	@references = Reference.all
  end
end
