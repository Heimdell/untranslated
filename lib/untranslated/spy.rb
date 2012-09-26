module Untranslated

  class Spy < ::I18n::ExceptionHandler

    def call(exception, locale, key, options)
      push locale, key

      super(exception, locale, key, options)
    end

    def push locale, key
      path = [locale, key].join ::I18n.default_separator
      packed = pack path
      keys.deep_merge! packed

      cached_store key
    end

    def pack key
      path = key.split ::I18n.default_separator

      reverse_path = path.reverse

      reverse_path.inject('') do |k, hash|
        out = {}
        out[hash] = k
        out
      end
    end

    def cached_store key
      @cache ||= {}

      store unless @cache[key]

      @cache[key] ||= true
    end

    def store
      ensure_log_dir_exist

      keys.each do |locale, key|
        ::File.open("./log/untranslated.#{locale}.yml", 'w') do |f|
          prefixed = {}
          prefixed[locale] = key
          f.write(prefixed.to_yaml)
        end
      end
    end

    def ensure_log_dir_exist
      return if Dir.exist? './log'

      Dir.mkdir './log'
    end

    def keys
      @keys ||= {}
    end

  end

end