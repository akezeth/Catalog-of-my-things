module BookAndLabel
  def list_all_books
    if @books.empty?
      puts 'No books availabel.'
    else
      @books.each_with_index do |book, index|
        label_title = book.label ? book.label.title : 'N/A'
        puts "#{index}) Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Label: #{label_title}"
      end
    end
  end

  def list_all_labels
    if @label.empty?
      puts 'No labels available.'
    else
      @label.each_with_index do |label, index|
        puts "#{index}) Label Title: #{label.title}, Label Color: #{label.color}"
      end
    end
  end
end
