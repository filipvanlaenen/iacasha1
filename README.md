# Iterative Algebraic Collision Attack on SHA-1

This project tries to produce a collision in the cryptographic hashing function
SHA-1. It tries to do this by reducing the function that calculates the first
chunk of 512 bits of the message algebraically for every bit that's fixed in the
input vector. A collision is found if this results in one of the input bits
being eliminated completely from the calculation.

