require 'spec_helper'

describe Untranslated do
  it "should at least load I18n" do
    Untranslated.install

    ::I18n.t "this.key.not.exist"
    ::I18n.t "this.key.not.existent.too"
    ::I18n.t "this.is.same"
    ::I18n.t "just.trying.to.test"

    true
  end
end