module Untranslated

  class Spy < ::I18n::ExceptionHandler

    def initialize
      at_exit do
        keys.each do |locale, key|
          ::File.open("untranslated.#{locale}.yml", 'w') do |f|
            prefixed = {}
            prefixed[locale] = key
            f.write(prefixed.to_yaml)
          end
        end
      end
    end

    def keys
      @keys ||= {}
    end

    def push locale, key
      path = [locale, key].join ::I18n.default_separator
      packed = pack path
      keys.deep_merge! packed
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

    def call(exception, locale, key, options)
      push locale, key

      super(exception, locale, key, options)
    end
  end

end