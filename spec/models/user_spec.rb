require 'spec_helper'

describe User do
  subject { User.new(params) }
  let(:params) { {first_name: "Jim", last_name: "Bob"} }

  it 'returns first and last name for full name' do
    subject.full_name.should eq "Jim Bob"
  end

  context 'with no last name' do
    let(:params) { {first_name: "John"} }

    it 'returns the first name only, with no trailing space' do
      subject.full_name.should eq "John"
    end
  end
end