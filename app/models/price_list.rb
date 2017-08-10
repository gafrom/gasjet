class PriceList
  include ActionView::Helpers::NumberHelper 

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
    i = 0
    @sheet = @book.create_worksheet name: 'Gasjet прайс лист'
    @sheet.row(i).concat %w{Артикул Наименование Цена Категория Производитель Описание}

    Product.all.order(:category_id, :producer_id).each do |product|
      row = @sheet.row(i += 1)
      row.push product.pretty_stock_number,
               product.name,
               price(product),
               product.category.name,
               product.producer.name,
               product.description
    end

    @sheet.row(i += 4).push 'Контактная информация'
    @sheet.row(i).default_format = Spreadsheet::Format.new weight: :bold
    @sheet.row(i += 1).push 'Адрес:', 'г. Новосибирск, ул. Никитина 112а, корпус 1'
    @sheet.row(i += 1).push 'Телефон:', '+7 (913) 916 20 55'
    @sheet.row(i += 1).push 'Email:', 'michael@gasjet.ru'
  end

  def price(product)
    return 'по запроcу' if product.price.blank?
    number_to_currency product.price
  end

  def format_it
    formats = {
      0 =>  8,
      1 => 30,
      2 => 10,
      3 => 20,
      4 => 30,
      5 => 60
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
