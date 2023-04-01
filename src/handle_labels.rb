require 'json'

module HandleLabels
  def list_labels
    ui_decorator('List of Labels', 15)
    if @labels.empty?
      puts 'No labels available'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) ID: #{label['id']} Title: #{label['title']} Color: #{label['color']}"
      end
    end
  end

  def save_label(curr_labels, label_obj)
    label_array = []
    curr_labels.each do |label|
      label_array << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end

    if Dir.exist?('storage') && File.exist?('storage/labels.json')
      labels = File.read('storage/labels.json')
      labels_data = JSON.parse(labels)

      labels_data << {
        id: label_obj.id,
        title: label_obj.title,
        color: label_obj.color
      }

      File.write('storage/labels.json', JSON.pretty_generate(labels_data))
    elsif Dir.exist?('storage') && !File.exist?('storage/labels.json')
      File.write('storage/labels.json', JSON.pretty_generate(label_array))
    else
      Dir.mkdir('storage')
      File.write('storage/labels.json', JSON.pretty_generate(label_array))
    end
  end

  # load books on app start
  def load_labels
    label_array = []
    return label_array unless Dir.exist?('storage') && File.exist?('storage/labels.json')

    labels = File.read('storage/labels.json')
    labels_data = JSON.parse(labels)
    labels_data.each do |label|
      label_array << label
    end
    label_array
  end
end
