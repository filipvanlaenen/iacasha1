# encoding: utf-8
#

require 'spec_helper'
require '000/sha1_bitwise_compress0'
require '001/sha1_bitwise_compress0_o073329'

describe SHA1BitwiseCompress0_O073329, '#compress_0' do
  it 'detects when bits 073 and 329 are false' do
    expect { SHA1BitwiseCompress0_O073329.new.compress_0([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when bits 073 and 329 are true' do
    expect { SHA1BitwiseCompress0_O073329.new.compress_0([0x00000000, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when input vector is correct because bit 073 is true and 329 false' do
    expect { SHA1BitwiseCompress0_O073329.new.compress_0([0x00000000, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.not_to raise_error
  end

  it 'detects when input vector is correct because bit 073 is false and 329 true' do
    expect { SHA1BitwiseCompress0_O073329.new.compress_0([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.not_to raise_error
  end

  it 'calculates 512 * false + restrictions correctly' do
    iv = [0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]
    expected = SHA1BitwiseCompress0.new.compress_0(iv)
    actual = SHA1BitwiseCompress0_O073329.new.compress_0(iv)
    expect(actual).to eq(expected)
  end
end
