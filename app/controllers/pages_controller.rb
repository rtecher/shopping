class PagesController < ApplicationController
  def about_us
  end

  def communication
  end

  def references
  	@references = Reference.all
  end

  def sitemap
  	respond_to do |format|
        format.xml
    end
  end

  def robots
  	respond_to :text
  	expires_in 6.hours, public: true
  end
end
