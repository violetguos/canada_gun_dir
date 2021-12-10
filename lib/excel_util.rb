module ExcelUtil
  def self.parse_notes_for_licnese_info(notes)
    # using a regex, serach for keywords "pal", "rpal"
    licensed = false
    licensed = true if notes.include? 'pal'
  end
end
