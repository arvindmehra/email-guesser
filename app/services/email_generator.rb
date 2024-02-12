# frozen_string_literal: true

class EmailGenerator
  def self.generate_email(format, first_name, last_name, domain)
    email_local_part = case format
                       when :first_initial_last_name
                         "#{first_name[0]}#{last_name}"
                       when :first_name_last_initial
                         "#{first_name}#{last_name[0]}"
                       when :first_name_last_name
                         "#{first_name}#{last_name}"
                       when :first_name_dot_last_name
                         "#{first_name}.#{last_name}"
                       else
                         return nil
                       end
    "#{email_local_part}@#{domain}"
  end
end
