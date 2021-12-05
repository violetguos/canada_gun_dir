class User < ApplicationRecord
  def self.search(params)
    if params.empty?
      nil
    elsif params
      users =
        User.where(club: params[:club], greater_region: params[:greater_region])
    end
    users
  end
end
