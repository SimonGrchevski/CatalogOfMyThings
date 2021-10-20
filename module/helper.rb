require 'date'

module Helper
  def format_date(date)
    Date.parse(date).strftime('%Y/%m/%d')
  end
end
