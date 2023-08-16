require 'json'

module LoadData
  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def load_labels
    label_hash = []
    return label_hash unless File.exist?('data/label.json')

    label_hash = load_data_from_file('data/label.json')

    label_hash.each do |label|
      label_obj = Label.new(label['color'], label['title'])
      label_obj.id = label['id']
      @label << label_obj
    end
  end
end
