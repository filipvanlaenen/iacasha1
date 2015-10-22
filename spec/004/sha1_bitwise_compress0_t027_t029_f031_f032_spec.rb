# encoding: utf-8
#

require 'spec_helper'
require '000/sha1_bitwise_compress0'
require '004/sha1_bitwise_compress0_t027_t029_f031_f032'

describe SHA1BitwiseCompress0_T027_T029_F031_F032, '#compress_0' do
  it 'detects when bit 027 is false' do
    expect { SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0([0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when bit 029 is false' do
    expect { SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0([0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when bit 031 is true' do
    expect { SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0([0x0000002A, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when bit 032 is true' do
    expect { SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0([0x00000029, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.to raise_error(ArgumentError)
  end

  it 'detects when input vector is correct' do
    expect { SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0([0x00000028, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]) }.not_to raise_error
  end

  it 'calculates 512 * false + restrictions correctly' do
    iv = [0x00000028, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000]
    expected = SHA1BitwiseCompress0.new.compress_0(iv)
    actual = SHA1BitwiseCompress0_T027_T029_F031_F032.new.compress_0(iv)
    expect(actual).to eq(expected)
  end
end
