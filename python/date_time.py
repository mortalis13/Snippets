# == DateTime

def date_test():
  from datetime import date, time, datetime, timedelta
  import time
  import locale
  
  
  print('\n---- datetime')
# --------
  now = datetime.now()
  day = datetime(2018, 11, 30, 14)
  
  print('now:', now)
  print('day:', day)
  print()
  
# --------
  # === format ===
  #   %Y-%m-%d %H:%M:%S
  #   %Y -> 2019, %y -> 19
  #   %B -> January, %b -> Jan, %A -> Sunday, %a -> Sun
  #   %w -> [week], %Z -> UTC
  # ==============
  
  str_to_date = datetime.strptime('2017-06-21', '%Y-%m-%d')
  date_to_str = day.strftime('%Y-%m-%d %H:%M:%S')
  
  date_to_timestamp = day.timestamp()
  timestamp_to_date = datetime.fromtimestamp(1543582800)
  
  print('str_to_date:', str_to_date)
  print('date_to_str:', date_to_str)
  print('date_to_timestamp:', date_to_timestamp)
  print('timestamp_to_date:', timestamp_to_date)
  print()
  
# --------
  time_offset = now + timedelta(microseconds=0, milliseconds=0, seconds=0, minutes=0, hours=2, days=1, weeks=0)
  print('time_offset: {}, now: {}'.format(time_offset, now))
  
  sec_diff = datetime.strptime('2018-07-18 10:06:31', '%Y-%m-%d %H:%M:%S').timestamp() - datetime.strptime('2018-02-11 18:27:26', '%Y-%m-%d %H:%M:%S').timestamp()
  date_diff = datetime(2018, 11, 30) - datetime(2018, 10, 7)
  
  print('seconds diff [2018-07-18 10:06:31 - 2018-02-11 18:27:26]:', sec_diff)
  print('date_diff [2018-11-30 - 2018-10-07]: "{}" => days: {}, seconds: {}, microseconds: {}; total_seconds: {}'.format(date_diff, date_diff.days, date_diff.seconds, date_diff.microseconds, date_diff.total_seconds()))
  
  print('\n---- time')
# --------
  str_to_time_struct = time.strptime('2017-06-21', '%Y-%m-%d')
  time_struct_to_str = time.strftime('%Y-%m-%d %H:%M:%S', str_to_time_struct)
  time_struct_to_timestamp = time.mktime(str_to_time_struct)
  
  now_timestamp = time.time()
  timestamp_to_time_struct = time.localtime(now_timestamp)
  
  print('str_to_time_struct:', str_to_time_struct)
  print('time_struct_to_str:', time_struct_to_str)
  print('time_struct_to_timestamp:', time_struct_to_timestamp)
  print('now_timestamp:', now_timestamp)
  print('timestamp_to_time_struct:', timestamp_to_time_struct)
  print()
# --------
  _date = now.date()
  print(f'datetime to date: {now} => {_date}')
  print()

# --------------
date_test()
