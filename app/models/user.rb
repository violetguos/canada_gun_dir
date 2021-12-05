class User < ApplicationRecord
  def self.search(search)
    if search.empty?
      nil
    elsif search
      users = User.where('club = ?', search[:club]) if search[:club]
    end
    users
  end
end
