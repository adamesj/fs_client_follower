Time::DATE_FORMATS[:humanized_ago]  = ->(time) do
  st = Time.now.beginning_of_day
  nd = Time.now.end_of_day

  case 
  when time.between?(st + 1.day, nd + 1.day)
    "Tomorrow #{time.strftime('%l:%M %p')}"
  when time.between?(st, nd)
    "Today #{time.strftime('%l:%M %p')}"
  when time.between?(st - 1.day, nd - 1.day)
    "Yesterday #{time.strftime('%l:%M %p')}"
  when time.between?(st - 6.day, nd - 2.day)
    time.strftime('%a %l:%M %p')
  else 
    time.strftime('%b %d, %l:%M %p')
  end
end