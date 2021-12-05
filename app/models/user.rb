class User < ApplicationRecord
  def self.search(params)
    if params.empty?
      nil
    elsif params
      # apparently you can't pass in the entire hash like this `users = User.where(params)` B/C sql injection
      raw_sql = ''
      params.each do |key, val|
        raw_sql << key << ' = ' << "\'" << val << "\'" if val
        raw_sql << ' AND ' if key != params.keys.last
      end
      users = User.where(raw_sql)
    end
    users
  end
end
