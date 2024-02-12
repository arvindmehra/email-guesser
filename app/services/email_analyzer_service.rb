# frozen_string_literal: true

class EmailAnalyzerService
  def initialize(first_name, last_name, domain)
    @data_set = DatasetReader.read_data_set
    @first_name = first_name.downcase
    @last_name = last_name.downcase
    @domain = domain.downcase
  end

  def call
    email_format = find_email_format
    EmailGenerator.generate_email(email_format, @first_name, @last_name, @domain) if email_format
  end

  private

  def find_email_format
    @data_set.each do |name, email|
      return EmailFormatDeterminer.determine_format(name, email) if email.split('@').last.downcase == @domain
    end
    nil
  end
end
