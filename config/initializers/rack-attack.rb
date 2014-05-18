class Rack::Attack

  KNOWN_URL_SCANS = %w{
    /phpTest/zologize/axa.php
    /manager/html
    /rom-0
  }

  blacklist('known url scans') do |req|
    KNOWN_URL_SCANS.include?(req.path)
  end

end
