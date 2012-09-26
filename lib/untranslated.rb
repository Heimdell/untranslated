require 'i18n'

module Untranslated
  autoload :Spy, "untranslated/spy"

  def self.install
    ::I18n.exception_handler = Spy.new
  end
end
