# frozen_string_literal: true

class DatasetReader
  def self.read_data_set(file_path = Rails.root.join('email_dataset.json'))
    JSON.parse(File.read(file_path))
  rescue Errno::ENOENT
    raise 'Dataset file not found'
  end
end
