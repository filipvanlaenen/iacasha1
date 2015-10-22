# Iterative Algebraic Collision Attack on SHA-1

This project tries to produce a collision in the cryptographic hashing function
SHA-1. It tries to do this by reducing the function that calculates the first
chunk of 512 bits of the message algebraically for every bit that's fixed in the
input vector. A collision is found if this results in one of the input bits
being eliminated completely from the calculation.

License
-------

Iterative Algebraic Collision Attack on SHA-1 (IACASHA1)  
Copyright (C) 2015 Filip van Laenen <f.a.vanlaenen@ieee.org>

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
Street, Fifth Floor, Boston, MA 02110-1301 USA.
