# encoding: utf-8
#

require 'spec_helper'
require 'sha1'

# Tests from http://www.ietf.org/rfc/rfc3174.txt
describe SHA1, '#hexdigest' do
  it 'digests an empty string correctly' do
    digest = SHA1.hexdigest('')
    expect(digest).to eq('da39a3ee5e6b4b0d3255bfef95601890afd80709')
  end

  it "digests 'abc' correctly" do
    digest = SHA1.hexdigest('abc')
    expect(digest).to eq('a9993e364706816aba3e25717850c26c9cd0d89d')
  end

  it 'digests a string of length 448 bits correctly' do
    digest = SHA1.hexdigest('abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq')
    expect(digest).to eq('84983e441c3bd26ebaae4aa1f95129e5e54670f1')
  end

  it 'digests a string of length 896 bits correctly' do
    digest = SHA1.hexdigest('abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu')
    expect(digest).to eq('a49b2446a02c645bf419f995b67091253a04a259')
  end

  it "digests a million times 'a' correctly" do
    digest = SHA1.hexdigest('a' * 1_000_000)
    expect(digest).to eq('34aa973cd4c4daa4f61eeb2bdbad27316534016f')
  end

  it 'digests an exact multiple of 512 bits correctly' do
    digest = SHA1.hexdigest('0123456701234567012345670123456701234567012345670123456701234567' * 10)
    expect(digest).to eq('dea356a2cddd90c7a7ecedc5ebb563934f460452')
  end
end
