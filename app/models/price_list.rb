class PriceList
  attr_reader :filename, :data

  def initialize
    @book = Spreadsheet::Workbook.new
    @file_contents = StringIO.new
    @filename = "Gasjet прайс лист от #{I18n.l Time.zone.now, format: :filename}.xls"

    fill_in
    format_it
    prepare_data
  end

  private

  def fill_in
    @sheet = @book.create_worksheet name: 'Gasjet прайс лист'
    @sheet.row(0).concat %w{Наименование Цена Категория Производитель Описание}

    Product.all.each_with_index do |product, i|
      row = @sheet.row(i + 1)
      row.push product.name, 'по запроcу', product.category.name, product.producer.name, product.description
    end
  end

  def format_it
    formats = {
      0 => 30,
      1 => 10,
      2 => 20,
      3 => 30,
      4 => 60
    }

    formats.each do |col, width|
      @sheet.column(col).width = width
    end

    bold = Spreadsheet::Format.new weight: :bold

    @sheet.row(0).default_format = bold
  end

  def prepare_data
    @book.write @file_contents
    @data = @file_contents.string.force_encoding('binary')
  end
end
