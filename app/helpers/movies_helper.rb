module MoviesHelper

  def format_date(date)
    date.strftime("%b %d, %Y")
  end

  def year(date)
    date.strftime("%Y ")
  end

end