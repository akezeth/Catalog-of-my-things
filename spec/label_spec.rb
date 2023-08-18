require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  let(:base_params) do
    {
      title: 'Science Fiction',
      color: 'Blue'
    }
  end

  describe '#initialize' do
    it 'sets title and color' do
      label = Label.new(base_params)
      expect(label.title).to eq('Science Fiction')
      expect(label.color).to eq('Blue')
    end

    it 'initializes id' do
      label = Label.new(base_params)
      expect(label.instance_variable_get(:@id)).not_to be_nil
    end

    it 'initializes items as an empty array' do
      label = Label.new(base_params)
      expect(label.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      label = Label.new(base_params)
      item = Item.new(genre: 'Sci-Fi', author: 'Author', publish_date: '2000-01-01')

      label.add_item(item)

      expect(label.instance_variable_get(:@items)).to include(item)
    end

    it 'calls add_label on the item' do
      label = Label.new(base_params)
      item = Item.new(genre: 'Sci-Fi', author: 'Author', publish_date: '2000-01-01')

      expect(item).to receive(:add_label).with(label)

      label.add_item(item)
    end

    it 'does not add the same item multiple times' do
      label = Label.new(base_params)
      item = Item.new(genre: 'Sci-Fi', author: 'Author', publish_date: '2000-01-01')

      label.add_item(item)
      label.add_item(item)

      expect(label.instance_variable_get(:@items).uniq.count).to eq(1)
    end
  end
end
