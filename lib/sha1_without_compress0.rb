# encoding: UTF-8

# Original source: http://pastie.org/457710

class SHA1WithoutCompress0
  def word_to_bits(word)
    bits = []
    bits[0] = (0x80000000 & word) == 0x80000000
    bits[1] = (0x40000000 & word) == 0x40000000
    bits[2] = (0x20000000 & word) == 0x20000000
    bits[3] = (0x10000000 & word) == 0x10000000
    bits[4] = (0x08000000 & word) == 0x08000000
    bits[5] = (0x04000000 & word) == 0x04000000
    bits[6] = (0x02000000 & word) == 0x02000000
    bits[7] = (0x01000000 & word) == 0x01000000
    bits[8] = (0x00800000 & word) == 0x00800000
    bits[9] = (0x00400000 & word) == 0x00400000
    bits[10] = (0x00200000 & word) == 0x00200000
    bits[11] = (0x00100000 & word) == 0x00100000
    bits[12] = (0x00080000 & word) == 0x00080000
    bits[13] = (0x00040000 & word) == 0x00040000
    bits[14] = (0x00020000 & word) == 0x00020000
    bits[15] = (0x00010000 & word) == 0x00010000
    bits[16] = (0x00008000 & word) == 0x00008000
    bits[17] = (0x00004000 & word) == 0x00004000
    bits[18] = (0x00002000 & word) == 0x00002000
    bits[19] = (0x00001000 & word) == 0x00001000
    bits[20] = (0x00000800 & word) == 0x00000800
    bits[21] = (0x00000400 & word) == 0x00000400
    bits[22] = (0x00000200 & word) == 0x00000200
    bits[23] = (0x00000100 & word) == 0x00000100
    bits[24] = (0x00000080 & word) == 0x00000080
    bits[25] = (0x00000040 & word) == 0x00000040
    bits[26] = (0x00000020 & word) == 0x00000020
    bits[27] = (0x00000010 & word) == 0x00000010
    bits[28] = (0x00000008 & word) == 0x00000008
    bits[29] = (0x00000004 & word) == 0x00000004
    bits[30] = (0x00000002 & word) == 0x00000002
    bits[31] = (0x00000001 & word) == 0x00000001
    bits
  end

  def bits_to_word(bits)
    (bits[0] ? 0x80000000 : 0) +
      (bits[1] ? 0x40000000 : 0) +
      (bits[2] ? 0x20000000 : 0) +
      (bits[3] ? 0x10000000 : 0) +
      (bits[4] ? 0x08000000 : 0) +
      (bits[5] ? 0x04000000 : 0) +
      (bits[6] ? 0x02000000 : 0) +
      (bits[7] ? 0x01000000 : 0) +
      (bits[8] ? 0x00800000 : 0) +
      (bits[9] ? 0x00400000 : 0) +
      (bits[10] ? 0x00200000 : 0) +
      (bits[11] ? 0x00100000 : 0) +
      (bits[12] ? 0x00080000 : 0) +
      (bits[13] ? 0x00040000 : 0) +
      (bits[14] ? 0x00020000 : 0) +
      (bits[15] ? 0x00010000 : 0) +
      (bits[16] ? 0x00008000 : 0) +
      (bits[17] ? 0x00004000 : 0) +
      (bits[18] ? 0x00002000 : 0) +
      (bits[19] ? 0x00001000 : 0) +
      (bits[20] ? 0x00000800 : 0) +
      (bits[21] ? 0x00000400 : 0) +
      (bits[22] ? 0x00000200 : 0) +
      (bits[23] ? 0x00000100 : 0) +
      (bits[24] ? 0x00000080 : 0) +
      (bits[25] ? 0x00000040 : 0) +
      (bits[26] ? 0x00000020 : 0) +
      (bits[27] ? 0x00000010 : 0) +
      (bits[28] ? 0x00000008 : 0) +
      (bits[29] ? 0x00000004 : 0) +
      (bits[30] ? 0x00000002 : 0) +
      (bits[31] ? 0x00000001 : 0)
  end

  def circular_shift(bits, word)
    0xFFFFFFFF & (((word) << (bits)) | ((word) >> (32 - (bits))))
  end

  def compress_n(words, chain)
    constants = [0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6]

    16.upto(79) do |t|
      words[t] = circular_shift(1, words[t - 3] ^ words[t - 8] ^ words[t - 14] ^ words[t - 16])
    end

    aa = chain[0]
    bb = chain[1]
    cc = chain[2]
    dd = chain[3]
    ee = chain[4]

    0.upto(19) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5, aa) + ((bb & cc) | ((~bb) & dd)) + ee + words[t] + constants[0])
      ee = dd
      dd = cc
      cc = circular_shift(30, bb)
      bb = aa
      aa = tt
    end

    20.upto(39) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5, aa) + (bb ^ cc ^ dd) + ee + words[t] + constants[1])
      ee = dd
      dd = cc
      cc = circular_shift(30, bb)
      bb = aa
      aa = tt
    end

    40.upto(59) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5, aa) + ((bb & cc) | (bb & dd) | (cc & dd)) + ee + words[t] + constants[2])
      ee = dd
      dd = cc
      cc = circular_shift(30, bb)
      bb = aa
      aa = tt
    end

    60.upto(79) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5, aa) + (bb ^ cc ^ dd) + ee + words[t] + constants[3])
      ee = dd
      dd = cc
      cc = circular_shift(30, bb)
      bb = aa
      aa = tt
    end

    [0xFFFFFFFF & (chain[0] + aa),
     0xFFFFFFFF & (chain[1] + bb),
     0xFFFFFFFF & (chain[2] + cc),
     0xFFFFFFFF & (chain[3] + dd),
     0xFFFFFFFF & (chain[4] + ee)]
  end

  def hexdigest(message)
    fill   = "\x00" * (64 - (message.length + 9) % 64)
    length = "\x00" * 4 + [message.length * 8].pack('N*')
    # Original code throws an error:
    # words = (message + "\x80" + fill + length).unpack('N*')
    words1 = (message + "\x80" + fill).unpack('N*')
    words2 = length.unpack('N*')
    all_words = words1 + words2
    words = all_words
    chain = compress_0(words[0, 16])
    1.upto(words.length / 16 - 1) do |t|
      chain = compress_n(words[t * 16, 16], chain)
    end

    chain.map { |c| '%08x' % c }.join('')
  end

  def compress_0(words)
    www_01 = word_to_bits(words[0])
    www_02 = word_to_bits(words[1])
    www_03 = word_to_bits(words[2])
    www_04 = word_to_bits(words[3])
    www_05 = word_to_bits(words[4])
    www_06 = word_to_bits(words[5])
    www_07 = word_to_bits(words[6])
    www_08 = word_to_bits(words[7])
    www_09 = word_to_bits(words[8])
    www_10 = word_to_bits(words[9])
    www_11 = word_to_bits(words[10])
    www_12 = word_to_bits(words[11])
    www_13 = word_to_bits(words[12])
    www_14 = word_to_bits(words[13])
    www_15 = word_to_bits(words[14])
    www_16 = word_to_bits(words[15])
    ov = bit_compress_0(www_01[0], www_01[1], www_01[2], www_01[3], www_01[4], www_01[5], www_01[6], www_01[7], www_01[8], www_01[9], www_01[10], www_01[11], www_01[12], www_01[13], www_01[14], www_01[15], www_01[16], www_01[17], www_01[18], www_01[19], www_01[20], www_01[21], www_01[22], www_01[23], www_01[24], www_01[25], www_01[26], www_01[27], www_01[28], www_01[29], www_01[30], www_01[31], www_02[0], www_02[1], www_02[2], www_02[3], www_02[4], www_02[5], www_02[6], www_02[7], www_02[8], www_02[9], www_02[10], www_02[11], www_02[12], www_02[13], www_02[14], www_02[15], www_02[16], www_02[17], www_02[18], www_02[19], www_02[20], www_02[21], www_02[22], www_02[23], www_02[24], www_02[25], www_02[26], www_02[27], www_02[28], www_02[29], www_02[30], www_02[31], www_03[0], www_03[1], www_03[2], www_03[3], www_03[4], www_03[5], www_03[6], www_03[7], www_03[8], www_03[9], www_03[10], www_03[11], www_03[12], www_03[13], www_03[14], www_03[15], www_03[16], www_03[17], www_03[18], www_03[19], www_03[20], www_03[21], www_03[22], www_03[23], www_03[24], www_03[25], www_03[26], www_03[27], www_03[28], www_03[29], www_03[30], www_03[31], www_04[0], www_04[1], www_04[2], www_04[3], www_04[4], www_04[5], www_04[6], www_04[7], www_04[8], www_04[9], www_04[10], www_04[11], www_04[12], www_04[13], www_04[14], www_04[15], www_04[16], www_04[17], www_04[18], www_04[19], www_04[20], www_04[21], www_04[22], www_04[23], www_04[24], www_04[25], www_04[26], www_04[27], www_04[28], www_04[29], www_04[30], www_04[31], www_05[0], www_05[1], www_05[2], www_05[3], www_05[4], www_05[5], www_05[6], www_05[7], www_05[8], www_05[9], www_05[10], www_05[11], www_05[12], www_05[13], www_05[14], www_05[15], www_05[16], www_05[17], www_05[18], www_05[19], www_05[20], www_05[21], www_05[22], www_05[23], www_05[24], www_05[25], www_05[26], www_05[27], www_05[28], www_05[29], www_05[30], www_05[31], www_06[0], www_06[1], www_06[2], www_06[3], www_06[4], www_06[5], www_06[6], www_06[7], www_06[8], www_06[9], www_06[10], www_06[11], www_06[12], www_06[13], www_06[14], www_06[15], www_06[16], www_06[17], www_06[18], www_06[19], www_06[20], www_06[21], www_06[22], www_06[23], www_06[24], www_06[25], www_06[26], www_06[27], www_06[28], www_06[29], www_06[30], www_06[31], www_07[0], www_07[1], www_07[2], www_07[3], www_07[4], www_07[5], www_07[6], www_07[7], www_07[8], www_07[9], www_07[10], www_07[11], www_07[12], www_07[13], www_07[14], www_07[15], www_07[16], www_07[17], www_07[18], www_07[19], www_07[20], www_07[21], www_07[22], www_07[23], www_07[24], www_07[25], www_07[26], www_07[27], www_07[28], www_07[29], www_07[30], www_07[31], www_08[0], www_08[1], www_08[2], www_08[3], www_08[4], www_08[5], www_08[6], www_08[7], www_08[8], www_08[9], www_08[10], www_08[11], www_08[12], www_08[13], www_08[14], www_08[15], www_08[16], www_08[17], www_08[18], www_08[19], www_08[20], www_08[21], www_08[22], www_08[23], www_08[24], www_08[25], www_08[26], www_08[27], www_08[28], www_08[29], www_08[30], www_08[31], www_09[0], www_09[1], www_09[2], www_09[3], www_09[4], www_09[5], www_09[6], www_09[7], www_09[8], www_09[9], www_09[10], www_09[11], www_09[12], www_09[13], www_09[14], www_09[15], www_09[16], www_09[17], www_09[18], www_09[19], www_09[20], www_09[21], www_09[22], www_09[23], www_09[24], www_09[25], www_09[26], www_09[27], www_09[28], www_09[29], www_09[30], www_09[31], www_10[0], www_10[1], www_10[2], www_10[3], www_10[4], www_10[5], www_10[6], www_10[7], www_10[8], www_10[9], www_10[10], www_10[11], www_10[12], www_10[13], www_10[14], www_10[15], www_10[16], www_10[17], www_10[18], www_10[19], www_10[20], www_10[21], www_10[22], www_10[23], www_10[24], www_10[25], www_10[26], www_10[27], www_10[28], www_10[29], www_10[30], www_10[31], www_11[0], www_11[1], www_11[2], www_11[3], www_11[4], www_11[5], www_11[6], www_11[7], www_11[8], www_11[9], www_11[10], www_11[11], www_11[12], www_11[13], www_11[14], www_11[15], www_11[16], www_11[17], www_11[18], www_11[19], www_11[20], www_11[21], www_11[22], www_11[23], www_11[24], www_11[25], www_11[26], www_11[27], www_11[28], www_11[29], www_11[30], www_11[31], www_12[0], www_12[1], www_12[2], www_12[3], www_12[4], www_12[5], www_12[6], www_12[7], www_12[8], www_12[9], www_12[10], www_12[11], www_12[12], www_12[13], www_12[14], www_12[15], www_12[16], www_12[17], www_12[18], www_12[19], www_12[20], www_12[21], www_12[22], www_12[23], www_12[24], www_12[25], www_12[26], www_12[27], www_12[28], www_12[29], www_12[30], www_12[31], www_13[0], www_13[1], www_13[2], www_13[3], www_13[4], www_13[5], www_13[6], www_13[7], www_13[8], www_13[9], www_13[10], www_13[11], www_13[12], www_13[13], www_13[14], www_13[15], www_13[16], www_13[17], www_13[18], www_13[19], www_13[20], www_13[21], www_13[22], www_13[23], www_13[24], www_13[25], www_13[26], www_13[27], www_13[28], www_13[29], www_13[30], www_13[31], www_14[0], www_14[1], www_14[2], www_14[3], www_14[4], www_14[5], www_14[6], www_14[7], www_14[8], www_14[9], www_14[10], www_14[11], www_14[12], www_14[13], www_14[14], www_14[15], www_14[16], www_14[17], www_14[18], www_14[19], www_14[20], www_14[21], www_14[22], www_14[23], www_14[24], www_14[25], www_14[26], www_14[27], www_14[28], www_14[29], www_14[30], www_14[31], www_15[0], www_15[1], www_15[2], www_15[3], www_15[4], www_15[5], www_15[6], www_15[7], www_15[8], www_15[9], www_15[10], www_15[11], www_15[12], www_15[13], www_15[14], www_15[15], www_15[16], www_15[17], www_15[18], www_15[19], www_15[20], www_15[21], www_15[22], www_15[23], www_15[24], www_15[25], www_15[26], www_15[27], www_15[28], www_15[29], www_15[30], www_15[31], www_16[0], www_16[1], www_16[2], www_16[3], www_16[4], www_16[5], www_16[6], www_16[7], www_16[8], www_16[9], www_16[10], www_16[11], www_16[12], www_16[13], www_16[14], www_16[15], www_16[16], www_16[17], www_16[18], www_16[19], www_16[20], www_16[21], www_16[22], www_16[23], www_16[24], www_16[25], www_16[26], www_16[27], www_16[28], www_16[29], www_16[30], www_16[31])
    [bits_to_word(ov[0, 32]), bits_to_word(ov[32, 32]), bits_to_word(ov[64, 32]), 
     bits_to_word(ov[96, 32]), bits_to_word(ov[128, 32])]
  end

  def verify_restriction(a, b)
    raise ArgumentError, "Input vector doesn't respect all restrictions" unless a == b  
  end
end
