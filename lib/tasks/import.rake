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
    data =
      Roo::Spreadsheet.open(
        'lib/assets/master_spreadsheet/Meetup Spreadsheet of Boomsticks.xlsx'
      )
    headers = data.row(1) # index starts at 1 JFC
    data.each_with_index do |row, idx|
      next if idx == 0 # skip header  # create hash from headers and cells
      user_data = Hash[[headers, row].transpose]
      user_data.transform_keys! { |k| header_mapping[k].to_sym }
      next if user_data[:reddit_username].nil?
      user_data[:notes].downcase! # convert all notes to lower case
      user = User.new(user_data)
      user.save!
    end
  end
end
