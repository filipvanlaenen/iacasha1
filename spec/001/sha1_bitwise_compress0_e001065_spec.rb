# encoding: utf-8
#

require 'spec_helper'
require '000/sha1_bitwise_compress0'
require '001/sha1_bitwise_compress0_e001065'

describe SHA1BitwiseCompress0_E001065, '#compress_0' do
  it 'detects when bits 001 is false and 065 true' do
    expect { SHA1BitwiseCompress0_E001065.new.compress_0([0x00000000, 0x00000000, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when bits 001 is true and 065 false' do
    expect { SHA1BitwiseCompress0_E001065.new.compress_0([0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when input vector is correct because bits 001 and 065 are false' do
    expect { SHA1BitwiseCompress0_E001065.new.compress_0([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.not_to raise_error
  end

  it 'detects when input vector is correct because bits 001 and 065 are true' do
    expect { SHA1BitwiseCompress0_E001065.new.compress_0([0x80000000, 0x00000000, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.not_to raise_error
  end

  it 'calculates 512 * false + restrictions correctly' do
    iv = [0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]
    expected = SHA1BitwiseCompress0.new.compress_0(iv)
    actual = SHA1BitwiseCompress0_E001065.new.compress_0(iv)
    expect(actual).to eq(expected)
  end
end
