require 'spec_helper'

describe Untranslated do
  it "should at least load I18n" do
    Untranslated.run.should eq("translation missing: en.this.key.not.exist")
  end
end