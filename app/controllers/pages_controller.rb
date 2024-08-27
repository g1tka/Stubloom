class PagesController < ApplicationController
  layout "customPage1", only: [:page1]

  def page1
  end
end
