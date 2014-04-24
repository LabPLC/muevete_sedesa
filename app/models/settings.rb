class Settings

  ALL = {
    facebook: [ :api_key, :api_secret ],
    twitter: [ :api_key, :api_secret ],
    google_oauth2: [ :api_key, :api_secret ]
  }


  def self.method_missing(m, *args, &block)
    ALL.keys.include?(m) ? Presenter.new( m, ALL.fetch(m) ) : super
  end

  private

  class Presenter

    def initialize(namespace, settings)
      @namespace, @settings = namespace, settings
    end

    def method_missing(m, *args, &block)
      if settings.include?(m.to_sym)
        ENV[ [namespace, m].join("_").upcase ]
      else
        super
      end
    end

    private

    attr_reader :namespace, :settings

  end

end
