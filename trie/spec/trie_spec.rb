# frozen_string_literal: true

require 'trie'

RSpec.describe Trie do
  subject(:param_1) { described_class.new }

  describe '#initialize' do
    context 'should initialize new empty trie' do
      subject(:obj) { described_class.new }

      it 'returns object id ' do
        expect(obj).to be_truthy
      end
    end
  end

  describe '#add' do
    context 'should add a new word to a trie' do
      it 'returns true' do
        expect(param_1.add('cat')).to be_truthy
      end
    end
  end

  describe '#find' do
    context 'should find a word in a trie' do
      it "returns false if word isn't in a trie" do
        expect(param_1.find('cat')).to be_falsey
      end

      it 'returns true if word is in a trie' do
        param_1.add('cat')
        expect(param_1.find('cat')).to be_truthy
      end
    end
  end

  describe '#list' do
    context 'should find words that start with specifit letters' do
      it 'returns all words' do
       # expect(param_1.list("c")).to eq("cat", "cape", "cow", "captain")
      end
    end
  end
end
