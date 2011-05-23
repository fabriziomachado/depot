module ApplicationHelper
  def display_date
    "#{Time.now.strftime("%A %B %d,")} #{Time.now.year}" 
  end

end
