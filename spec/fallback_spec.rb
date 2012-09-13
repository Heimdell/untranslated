require 'spec_helper'

describe Untranslated do
  it "should at least load I18n" do
    Untranslated.install

    ::I18n.t "this.key.not.exist"

    true
  end
end