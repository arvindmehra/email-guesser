# frozen_string_literal: true

module EmailFormatDeterminer
  def self.determine_format(name, email)
    local_part = email.split('@').first
    first_name, last_name = name.downcase.split
    if local_part == first_name[0] + last_name
      :first_initial_last_name
    elsif local_part == first_name + last_name[0]
      :first_name_last_initial
    elsif local_part == first_name + last_name
      :first_name_last_name
    elsif local_part == "#{first_name}.#{last_name}"
      :first_name_dot_last_name
    else
      :unknown
    end
  end
end
