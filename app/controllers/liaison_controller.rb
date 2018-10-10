class LiaisonController < ApplicationController
  def list
    @subjects = Subject.all.includes(:employees).order(:name)
  end
end