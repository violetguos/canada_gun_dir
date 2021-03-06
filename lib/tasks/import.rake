require './lib/excel_util'
namespace :import do
  desc 'Import data from spreadsheet'
  header_mapping = {
    # mapping from excel to my db. the typos are real and need to be here!!
    'ab' => 'province',
    'Greater Region' => 'greater_region',
    'Username' => 'reddit_username',
    'Club' => 'club',
    'Additional Notes' => 'notes',
    'Specific CIty' => 'specific_city'
  }

  task data: :environment do
    data = Roo::Spreadsheet.open('lib/assets/master_spreadsheet/meetup.xlsx')
    headers = data.row(1) # index starts at 1 JFC
    data.each_with_index do |row, idx|
      next if idx == 0 # skip header  # create hash from headers and cells
      user_data = Hash[[headers, row].transpose]
      user_data.transform_keys! { |k| header_mapping[k].to_sym }
      next if user_data[:reddit_username].nil?
      if User.exists?(reddit_username: user_data[:reddit_username])
        puts "User with name '#{user_data[:reddit_username]}' already exists"
        next
      end
      if user_data[:notes]
        user_data[:notes].downcase!
        if ExcelUtil.parse_notes_for_licnese_info(user_data[:notes])
          user_data[:licensed] = 'licensed'
        else
          user_data[:licensed] = 'unknown'
        end
      end
      user = User.new(user_data)
      user.save!
    end
  end
end
