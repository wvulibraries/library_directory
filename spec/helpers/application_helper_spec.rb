require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#name_prefixes' do
    it 'returns the yml prefixes' do
      prefixes = I18n.t('names.prefix')
      expect(helper.name_prefixes).to eq(prefixes)
    end

    it 'prefixes should be an array' do
      type = helper.name_prefixes.class
      expect(type).to eq(Array)
    end
  end

  describe '#name_suffixes' do
    it 'returns the yml suffixes' do
      suffixes = I18n.t('names.suffix')
      expect(helper.name_suffixes).to eq(suffixes)
    end

    it 'suffixes should be an array' do
      type = helper.name_suffixes.class
      expect(type).to eq(Array)
    end
  end

  describe '#us_states' do
    it 'should return a hash of abbreviations and states' do
      result = Hash[I18n.t('address.state_abbr').zip(I18n.t('address.state'))]
      expect(helper.us_states).to eq(result)
    end

    it 'should be hash' do
      expect(helper.us_states.class).to eq(Hash)
    end

    it 'expects that data is correct use wv to test' do
      expect(helper.us_states['wv']).to eq('West Virginia')
    end
  end

  describe '#link_to_add_fields' do
    it 'should be tested in integration not a unit test'
  end
end
