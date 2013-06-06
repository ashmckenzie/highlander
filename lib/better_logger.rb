class BetterLogger

  # Inspiration from http://cbpowell.wordpress.com/2012/04/05/beautiful-logging-for-ruby-on-rails-3-2/

  SEVERITY_TO_COLOR_MAP = { 'DEBUG'=>'0;37', 'INFO'=>'32', 'WARN'=>'33', 'ERROR'=>'31', 'FATAL'=>'31', 'UNKNOWN'=>'37' }

  def call severity, time, program_name, message
    "#{formatted_time(time)} ##{$$} [#{formatted_severity(severity)}] #{message.strip}\n"
  end

  def formatted_time time
    time.utc.strftime('%Y-%m-%d %H:%M:%S UTC')
  end

  def formatted_severity severity
    if development?
      sprintf("\033[%sm%s\033[0m", SEVERITY_TO_COLOR_MAP[severity], severity)
    else
      severity
    end
  end

  def development?
    Rails.env == 'development'
  end

  def tagged arg
    yield
  end

  def clear_tags!
  end
end
