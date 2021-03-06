# encoding: UTF-8

# Original source: http://pastie.org/457710

module SHA1
  IV = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0]

  def self.circular_shift(bits, word)
    0xFFFFFFFF & (((word) << (bits)) | ((word) >> (32 - (bits))))
  end

  def self.compress(words, chain)

    constants = [0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6]

    16.upto(79) do |t|
      words[t] = circular_shift(1,words[t-3] ^ words[t-8] ^ words[t-14] ^ words[t-16])
    end
  
    aa = chain[0]
    bb = chain[1]
    cc = chain[2]
    dd = chain[3]
    ee = chain[4]

    0.upto(19) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5,aa) + ((bb & cc) | ((~bb) & dd)) + ee + words[t] + constants[0])
      ee = dd
      dd = cc
      cc = circular_shift(30,bb)
      bb = aa
      aa = tt
    end
  
    20.upto(39) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5,aa) + (bb ^ cc ^ dd) + ee + words[t] + constants[1])
      ee = dd
      dd = cc
      cc = circular_shift(30,bb)
      bb = aa
      aa = tt
    end

    40.upto(59) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5,aa) + ((bb & cc) | (bb & dd) | (cc & dd)) + ee + words[t] + constants[2])
      ee = dd
      dd = cc
      cc = circular_shift(30,bb)
      bb = aa
      aa = tt
    end
  
    60.upto(79) do |t|
      tt = 0xFFFFFFFF & (circular_shift(5,aa) + (bb ^ cc ^ dd) + ee + words[t] + constants[3])
      ee = dd
      dd = cc
      cc = circular_shift(30,bb)
      bb = aa
      aa = tt
    end

   return [0xFFFFFFFF & (chain[0] + aa),
            0xFFFFFFFF & (chain[1] + bb),
            0xFFFFFFFF & (chain[2] + cc),
            0xFFFFFFFF & (chain[3] + dd),
            0xFFFFFFFF & (chain[4] + ee)]
  end

  def self.hexdigest(message)
    fill   = "\x00" * (64 - (message.length + 9) % 64)
    length = "\x00" * 4 + [message.length * 8].pack('N*')
    # Original code throws an error:
    # words = (message + "\x80" + fill + length).unpack('N*')
    words1 = (message + "\x80" + fill).unpack('N*')
    words2 = length.unpack('N*')
    all_words = words1 + words2
    words = all_words
    chain = IV
    0.upto(words.length / 16 - 1) do |t|
      chain = compress(words[t * 16, 16], chain)
    end

    chain.map { |c| '%08x' % c }.join('')
  end
end
