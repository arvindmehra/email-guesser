require 'rails_helper'

RSpec.describe EmailGenerator do
  describe '.generate_email' do
    subject { described_class.generate_email(format, first_name, last_name, domain) }

    let(:first_name) { 'arvind' }
    let(:last_name) { 'mehra' }
    let(:domain) { 'example.com' }

    context 'when format is :first_initial_last_name' do
      let(:format) { :first_initial_last_name }

      it 'generates email with first initial and last name' do
        expect(subject).to eq('amehra@example.com')
      end
    end

    context 'when format is :first_name_last_initial' do
      let(:format) { :first_name_last_initial }

      it 'generates email with first name and last initial' do
        expect(subject).to eq('arvindm@example.com')
      end
    end

    context 'when format is :first_name_dot_last_name' do
      let(:format) { :first_name_dot_last_name }

      it 'generates email with first name dot last name' do
        expect(subject).to eq('arvind.mehra@example.com')
      end
    end

    context 'when format is :first_name_last_name' do
      let(:format) { :first_name_last_name }

      it 'generates email with first_name_last_name' do
        expect(subject).to eq('arvindmehra@example.com')
      end
    end

    context 'when format is unknown' do
      let(:format) { :unknown }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end
  end
end
