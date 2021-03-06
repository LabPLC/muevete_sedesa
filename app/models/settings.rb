class Settings

  ALL = {
    facebook: [ :api_key, :api_secret ],
    twitter: [ :api_key, :api_secret ],
    google_oauth2: [ :api_key, :api_secret ]
  }


  def self.method_missing(m, *args, &block)
    ALL.keys.include?(m) ? Presenter.new( m, ALL.fetch(m) ) : super
  end

  def self.respond_to?(m)

    ALL.keys.include?(m) || super
  end

  private

  class Presenter

    def initialize(namespace, settings)
      @namespace, @settings = namespace, settings
    end

    def method_missing(m, *args, &block)
      if settings.include?(m)
        ENV[ [namespace, m].join("_").downcase ]
      else
        super
      end
    end

    def respond_to?(m)
      settings.include?(m) || super
    end

    private

    attr_reader :namespace, :settings

  end

end
