require 'json'

module SaveBookAndLabelData
  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end
end
