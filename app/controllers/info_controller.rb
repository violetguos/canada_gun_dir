class InfoController < ApplicationController
  def documentation
    respond_to { |format| format.html { render :documentation } }
  end
end
