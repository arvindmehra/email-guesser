require 'rails_helper'

RSpec.describe EmailAnalyzerService do
  describe '#call' do
    let(:first_name) { 'Arvind' }
    let(:last_name) { 'Mehra' }
    let(:domain) { 'babbel.com' }
    subject(:service) { described_class.new(first_name, last_name, domain) }

    context 'when email format is found' do
      it 'returns the correct email address' do
        expect(service.call).to eq('amehra@babbel.com')
      end
    end

    context 'when email format is not found' do
      let(:domain) { 'unknown.com' }

      it 'returns nil' do
        expect(service.call).to be_nil
      end
    end
  end
end
