require 'rails_helper'

RSpec.describe ::Chapters::CharacterUnveiling::FirstMeet do
  subject { described_class.(params) }

  let(:params) do
    {
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      user_model: 'User'
    }
  end

  it 'creates a new user' do
    expect { subject }.to change(User, :count).by(1)
  end

  it 'returns a user' do
    expect(subject.consequences[:user]).to be_a(User)
  end

  context 'when user is not saved' do
    before do
      allow_any_instance_of(User).to receive(:save).and_return false
    end

    it 'returns an error' do
      expect(subject.bad_twists).to have_key(:user_not_saved)
    end
  end
end
