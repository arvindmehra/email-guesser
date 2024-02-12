require 'rails_helper'

RSpec.describe EmailFormatDeterminer do
  describe '.determine_format' do
    subject { described_class.determine_format(name, email) }

    let(:name) { 'arvind mehra' }

    context 'when email is first initial and last name' do
      let(:email) { 'amehra@example.com' }
      it { is_expected.to eq(:first_initial_last_name) }
    end

    context 'when email is first name and last initial' do
      let(:email) { 'arvindm@example.com' }
      it { is_expected.to eq(:first_name_last_initial) }
    end

    context 'when email is first name dot last name' do
      let(:email) { 'arvind.mehra@example.com' }
      it { is_expected.to eq(:first_name_dot_last_name) }
    end

    context 'when email is first name and last name' do
      let(:email) { 'arvindmehra@example.com' }
      it { is_expected.to eq(:first_name_last_name) }
    end


    context 'with an unrecognized format' do
      let(:email) { 'unknownformat@example.com' }
      it { is_expected.to eq(:unknown) }
    end
  end
end
