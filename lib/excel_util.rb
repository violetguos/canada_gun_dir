# frozen_string_literal: true

module ExcelUtil
  def self.parse_notes_for_licnese_info(notes)
    # using a regex, serach for keywords "pal", "rpal"
    if notes.include? 'pal'
      true
    else
      false
    end
  end
end
