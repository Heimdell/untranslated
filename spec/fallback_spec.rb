require 'spec_helper'

describe Untranslated do
  it "should save all keys, untranslated by I18n" do
    Untranslated.install

    ::I18n.t "this.key.not.exist"
    ::I18n.t "this.key.not.existent.too"
    ::I18n.t "this.is.same"
    ::I18n.t "just.trying.to.test"

    require "yaml"

    hash = YAML.load_file "log/untranslated.en.yml"

    hash.should == {
        'en' => {
            'this' => {
                'key' => {
                    'not' => {
                        'exist' => '',
                        'existent' => { 'too' => '' }
                    }
                },
                'is' => { 'same' => '' }
            },
            'just' => { 'trying' => { 'to' => { 'test' => '' } } }
        }
    }
  end
end