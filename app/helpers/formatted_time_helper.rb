module FormattedTimeHelper
	def custom_format(date)
		date_today = Date.today.to_s
		date_yesterday = Date.yesterday.to_s

	  if date == date_today
	    "Today"
	  elsif date == date_yesterday
	    "Yesterday"
	  elsif (date > date.today - 7) && (date < Date.yesterday)
	    date.strftime("%A")
	  else
	    date.strftime("%B %-d")
	  end
	end
end