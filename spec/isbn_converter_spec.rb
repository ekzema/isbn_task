# frozen_string_literal: true

require 'spec_helper'
require_relative '../isbn_converter'

RSpec.describe IsbnConverter do
  subject(:isbn_converter) { IsbnConverter.new('978014300723') }

  context "check the getter and setter isbn_digits accessors" do
    it 'should have initialize object' do
      is_expected.to have_attributes(isbn_digits: '978014300723')
    end
    it 'should have get isbn_digits' do
      expect(isbn_converter.isbn_digits).to eq('978014300723')
    end
    it "should have write isbn_digits" do
      subject.isbn_digits = '978014300723'
      expect(subject.isbn_digits).to eq('978014300723')
    end
  end

  it 'check isbn converting' do
    subject.isbn_digits = '978014300723'
    expect(subject.convert).to eq('9780143007234')
  end

  it 'should have raise error' do
    subject.isbn_digits = '978014300723qw'
    expect { subject.convert }.to raise_error RuntimeError
  end
end
