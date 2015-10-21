# encoding: utf-8
#

require 'spec_helper'
require '000/sha1_bitwise_compress0'

describe SHA1BitwiseCompress0, '#hexdigest' do
  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it 'digests an empty string correctly' do
    digest = SHA1BitwiseCompress0.new.hexdigest('')
    expect(digest).to eq('da39a3ee5e6b4b0d3255bfef95601890afd80709')
  end

  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it "digests 'abc' correctly" do
    digest = SHA1BitwiseCompress0.new.hexdigest('abc')
    expect(digest).to eq('a9993e364706816aba3e25717850c26c9cd0d89d')
  end

  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it 'digests a string of length 448 bits correctly' do
    digest = SHA1BitwiseCompress0.new.hexdigest('abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq')
    expect(digest).to eq('84983e441c3bd26ebaae4aa1f95129e5e54670f1')
  end

  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it 'digests a string of length 896 bits correctly' do
    digest = SHA1BitwiseCompress0.new.hexdigest('abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu')
    expect(digest).to eq('a49b2446a02c645bf419f995b67091253a04a259')
  end

  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it "digests a million times 'a' correctly" do
    digest = SHA1BitwiseCompress0.new.hexdigest('a' * 1_000_000)
    expect(digest).to eq('34aa973cd4c4daa4f61eeb2bdbad27316534016f')
  end

  # Test from http://www.ietf.org/rfc/rfc3174.txt
  it 'digests an exact multiple of 512 bits correctly' do
    digest = SHA1BitwiseCompress0.new.hexdigest('0123456701234567012345670123456701234567012345670123456701234567' * 10)
    expect(digest).to eq('dea356a2cddd90c7a7ecedc5ebb563934f460452')
  end
end

describe SHA1BitwiseCompress0, '#compress_0' do
  it 'does the first round for an empty string correctly' do
    result_0 = SHA1BitwiseCompress0.new.compress_0([0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000])
    expect(result_0).to eq([0xDA39A3EE, 0x5E6B4B0D, 0x3255BFEF, 0x95601890, 0xAFD80709])
  end

  it "does the first round for 'abc' correctly" do
    result_0 = SHA1BitwiseCompress0.new.compress_0([0x61626380, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000018])
    expect(result_0).to eq([0xA9993E36, 0x4706816A, 0xBA3E2571, 0x7850C26C, 0x9CD0D89D])
  end
end
