Geocoder.configure(

  # geocoding service (see below for supported options):
  # :lookup => :yandex,

  # IP address geocoding service (see below for supported options):
  # :ip_lookup => :maxmind,

  # to use an API key:
  :api_key => ENV['GOOGLE_GEOCODER_KEY'],

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  :units => :km,

  # Proxy used with quotaguard, in heroku
  :http_proxy => ENV['QUOTAGUARD_URL']

  # caching (see below for details):
  # :cache => Redis.new,
  # :cache_prefix => "..."

  # :use_https => true
)