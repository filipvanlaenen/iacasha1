# Results

The results of this project can be measured using different indicators. The
sections below give an overview of the project using the total complexity of
the function, the number of operations in the function and the number of
assignments.

## Lowest Number of Direct Output Occurrences

The number of direct output occurrences is measured as the number of times an input bit
occurs directly in the last expressions of the calculation of the output bits. Elimination
of an input bit from the last expressions of the calculation of the output bits is the
first step towards a total elimination of the input bit from the calculation.

The performance of the project can be benchmarked against a linear reduction of
the lowest number of direct output occurrences, starting from the lowest number of
direct output occurrences for the situation where no input bit has been fixed, to a
value of 0 for 511 input bits fixed.

Results better than the linear reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 60 | 60 | 60 |
| 1 | 60 | 60 | 60 |
| 501 | 1 | 66 | 70 |
| 502 | 1 | 66 | 74 |
| 503 | 1 | 66 | 74 |
| 504 | 1 | 64 | 76 |
| 505 | 1 | 64 | 74 |
| 506 | 1 | 60 | 77 |
| 507 | 0 | 64 | 79 |
| 508 | 0 | 66 | 78 |
| 509 | 0 | 66 | 81 |
| 510 | 0 | 58 | 91 |
| 511 | 0 | 63 | 95 |

![Lowest Number of Direct Output Occurrences](Lowest_Number_of_Direct_Output_Occurrences.png "Lowest Number of Direct Output Occurrences")

![Lowest Number of Direct Output Occurrences for 500 Restrictions and More](Lowest_Number_of_Direct_Output_Occurrences_500_or_Higher.png "Lowest Number of Direct Output Occurrences for 500 Restrictions and More")

## Lowest Number of Direct Occurrences

The number of direct occurrences is measured as the number of times an input bit
occurs directly in an expression in the calculation. If an input bit has been
eliminated from the calculation of the output bits, a collission has been found
as the result of the function will be the same regardless of the value of the
eliminiated input bit. In that case, its number of direct occurrences will have
been reduced to zero.

The performance of the project can be benchmarked against a linear reduction of
the lowest number of direct occurrences, starting from the lowest number of
direct occurrences for the situation where no input bit has been fixed, to a
value of 0 for 511 input bits fixed.

Results better than the linear reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 4,060 | 4,060 | 4,060 |
| 1 | 4,052 | 4,060 | 4,060 |
| 501 | 79 | 3,899 | 4,322 |
| 502 | 72 | 3,882 | 4,203 |
| 503 | 64 | 3,914 | 3,979 |
| 504 | 56 | 3,890 | 4,012 |
| 505 | 48 | 3,885 | 4,550 |
| 506 | 40 | 3,880 | 4,614 |
| 507 | 32 | 3,879 | 4,636 |
| 508 | 24 | 4,032 | 4,632 |
| 509 | 16 | 4,018 | 5,046 |
| 510 | 8 | 3,892 | 5,189 |
| 511 | 0 | 0 | 0 |

![Lowest Number of Direct Occurrences](Lowest_Number_of_Direct_Occurrences.png "Lowest Number of Direct Occurrences")

![Lowest Number of Direct Occurrences for 500 Restrictions and More](Lowest_Number_of_Direct_Occurrences_500_or_Higher.png "Lowest Number of Direct Occurrences for 500 Restrictions and More")

## Number of Direct Occurrences

The number of direct occurrences is measured as the number of times an input bit
occurs directly in an expression in the calculation. When all input bits have
been fixed, the number of direct occurrences will have been reduced to zero.

A reduction of the number of direct occurrences may give an indication that the
project is approaching a collision, and if the number of direct occurrences is
reduced to zero without all input bits being fixed, a collision has indeed been
found. However, it can be expected that if this project will find a collision,
the collision will be found long before the number of direct occurrences has
been reduced to zero. Also, a large reduction in the number of direct
occurrences doesn't guarantee that a collision will be found: as long as every
input bit remains present at least once in the calculation of an output bit, a
collision has not been found.

The performance of the project can be benchmarked against a linear reduction of
the number of direct occurrences, starting from the number of direct occurrences
for the situation where no input bit has been fixed, to a value of 0 for 511
input bits fixed.

Results better than the linear reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 2,284,331 | 2,284,331 | 2,284,331 |
| 1 | 2,279,861 | **2,278,927** | 2,278,927 |
| 501 | 44,703 | **44,575** | 50,610 |
| 502 | 40,233 | 40,493 | 46,201 |
| 503 | 35,763 | 36,771 | 37,872 |
| 504 | 31,292 | 32,682 | 33,861 |
| 505 | 26,822 | 28,444 | 33,073 |
| 506 | 22,352 | 24,454 | 29,071 |
| 507 | 17,881 | 20,407 | 24,180 |
| 508 | 13,411 | 16,523 | 19,530 |
| 509 | 8,941 | 12,523 | 15,520 |
| 510 | 4,470 | 7,978 | 10,583 |
| 511 | 0 | 0 | 0 |

![Number of Direct Occurrences](Number_of_Direct_Occurrences.png "Number of Direct Occurrences")

![Number of Direct Occurrences for 500 Restrictions and More](Number_of_Direct_Occurrences_500_or_Higher.png "Number of Direct Occurrences for 500 Restrictions and More")

## Complexity of the Least Complex Input Bit

The complexity of an input bit is calculated as the number of times it appears
in the calculation of an output bit. If an input bit has been eliminated from
the calculation of the output bits, a collission has been found as the result
of the function will be the same regardless of the value of the eliminiated
input bit. In that case, its complexity will have been reduced to zero.

The performance of the project can be benchmarked against an exponential
reduction of the complexity of the least complex input bit, starting from the
complexity of the least complex input bit for the situation where no input bit
has been fixed. The goal is to reduce this value to zero for 511 input bits
fixed. Notice however that the measured values will not necessarily relate to
the same input bit: a restriction may reduce the complexity of one input bit
below the complexity of the least complex input bit from the previous round.

Results better than the exponential reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 2.618×10^327 | 2.618×10^327 | 2.618×10^327 |
| 1 | 5.986×10^326 | 2.618×10^327 | 2.618×10^327 |
| 65 | 5.886×10^285 | 1.299×10^336 | 1.299×10^336 |
| 501 | 2.548×10^6 | 2.573×10^298 | 2.560×10^369 |
| 502 | 5.820×10^5 | 2.159×10^295 | 4.953×10^369 |
| 503 | 1.293×10^5 | 1.812×10^295 | 7.816×10^302 |
| 504 | 2.587×10^4 | 1.228×10^294 | 6.681×10^302 |
| 505 | 6.058×10^3 | 9.897×10^293 | 1.353×10^367 |
| 506 | 1.419×10^3 | 3.483×10^295 | 1.836×10^296 |
| 507 | 3.323×10^2 | 1.759×10^294 | 1.169×10^296 |
| 508 | 7.783×10^1 | 2.702×10^292 | 9.300×10^362 |
| 509 | 1.823×10^1 | 2.939×10^288 | 2.423×10^368 |
| 510 | 4.270×10^0 | 3.900×10^272 | 3.300×10^364 |
| 511 | 1.000×10^0 | 6.700×10^1 | 9.500×10^1 |

![Least Complex Input Bit](Least_Complex_Input_Bit.png "Least Complex Input Bit")

![Least Complex Input Bit for 500 Restrictions and More](Least_Complex_Input_Bit_500_or_Higher.png "Least Complex Input Bit for 500 Restrictions and More")

## Total Complexity

The complexity of the function is measured as the total number of times each
input bit appears in the calculation of an output bit. When all input bits
have been fixed, the total complexity will have been reduced to zero.

A reduction of the total complexity may give an indication that the project
is approaching a collision, and if the complexity is reduced to zero without
all input bits being fixed, a collision has indeed been found. However, it can
be expected that if this project will find a collision, the collision will be
found long before the total complexity has been reduced to zero. Also, a large
reduction in the total complexity doesn't guarantee that a collision will be
found: as long as every input bit remains present at least once in the
calculation of an output bit, a collision has not been found.

The performance of the project can be benchmarked against an exponential
reduction of the total complexity, starting from the total complexity for the
situation where no input bit has been fixed, to a value of 1 for 511 input bits
fixed. If a collision can be found, the total complexity will actually be
reduced to 0 for 511 input bits restricted.

Results better than the exponential reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 2.611×10^405 | 2.611×10^405 | 2.611×10^405 |
| 1 | 4.202×10^404 | 2.611×10^405 | 2.611×10^405 |
| 65 | 7.034×10^353 | 7.898×10^403 | 7.898×10^403 |
| 501 | 8.586×10^7 | 2.732×10^300 | 6.550×10^371 |
| 502 | 1.382×10^7 | 1.053×10^299 | 9.656×10^371 |
| 503 | 2.223×10^6 | 8.191×10^298 | 5.002×10^304 |
| 504 | 3.578×10^5 | 2.341×10^297 | 2.463×10^306 |
| 505 | 5.758×10^4 | 4.597×10^296 | 3.063×10^369 |
| 506 | 9.266×10^3 | 2.153×10^295 | 4.573×10^349 |
| 507 | 1.491×10^3 | 1.631×10^295 | 1.001×10^297 |
| 508 | 2.400×10^2 | 1.456×10^293 | 2.243×10^365 |
| 509 | 3.862×10^1 | 6.969×10^289 | 1.167×10^369 |
| 510 | 6.214×10^0 | 8.145×10^272 | 6.864×10^364 |
| 511 | 1.000×10^0 | 6.700×10^1 | 9.500×10^1 |

![Total Complexity](Total_Complexity.png "Total Complexity")

![Total Complexity for 500 Restrictions and More](Total_Complexity_500_or_Higher.png "Total Complexity for 500 Restrictions and More")

## Number of Operations

The number of operations is measured as the number of times the boolean
operators and (“&”), or (“|”) and xor (“^”) appear in the calculation. When all
input bits have been fixed, the number of operators will have been reduced to
zero.

A reduction of the number of operations may give an indication that the project
is approaching a collision, and if the number of operations is reduced to zero
without all input bits being fixed, a collision has indeed been found. However,
it can be expected that if this project will find a collision, the collision
will be found long before the number of operations has been reduced to zero.
Also, a large reduction in the number of operations doesn't guarantee that a
collision will be found: as long as every input bit remains present at least
once in the calculation of an output bit, a collision has not been found.

The performance of the project can be benchmarked against a linear reduction of
the number of operations, starting from the number of operations for the
situation where no input bit has been fixed, to a value of 0 for 511 input bits
fixed.

Results better than the linear reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 25,956,122 | 25,956,122 | 25,956,122 |
| 1 | 25,905,327 | 25,950,718 | 25,950,718 |
| 65 | 22,654,463 | 25,500,762 | 25,500,762 |
| 501 | 507,948 | 11,147,863 | 21,239,184 |
| 502 | 457,153 | 10,950,245 | 21,224,790 |
| 503 | 406,358 | 10,956,999 | 11,565,584 |
| 504 | 355,563 | 10,902,150 | 11,824,083 |
| 505 | 304,769 | 10,894,435 | 21,032,498 |
| 506 | 253,974 | 10,695,662 | 18,273,276 |
| 507 | 203,179 | 10,857,293 | 10,905,494 |
| 508 | 152,384 | 10,807,632 | 20,663,448 |
| 509 | 101,590 | 10,514,066 | 21,102,747 |
| 510 | 50,795 | 9,126,531 | 20,564,230 |
| 511 | 0 | 0 | 0 |

![Number of Operations](Number_of_Operations.png "Number of Operations")

![Number of Operations for 500 Restrictions and More](Number_of_Operations_500_or_Higher.png "Number of Operations for 500 Restrictions and More")

## Number of Assignments

The number of assignments is measured as the number of local variables used in
the calculation. When all input bits have been fixed, the number of assignments
will have been reduced to zero.

A reduction of the number of assignments may give an indication that the project
is approaching a collision, and if the number of assignments is reduced to zero
without all input bits being fixed, a collision has indeed been found. However,
it can be expected that if this project will find a collision, the collision
will be found long before the number of assignments has been reduced to zero.
Also, a large reduction in the number of assignments doesn't guarantee that a
collision will be found: as long as every input bit remains present at least
once in the calculation of an output bit, a collision has not been found.

The performance of the project can be benchmarked against a linear reduction of
the number of assignments, starting from the number of assignments for the
situation where no input bit has been fixed, to a value of 0 for 511 input bits
fixed.

Results better than the linear reduction are marked in bold.

| Restrictions | Linear Reduction | Best Reduction | Worst Reduction |
|:------------:|:----------------:|:--------------:|:---------------:|
| 0 | 47,947 | 47,947 | 47,947 |
| 1 | 47,853 | 47,947 | 47,947 |
| 65 | 41,848 | **24,116** | 24,116 |
| 501 | 938 | 31,248 | 39,424 |
| 502 | 844 | 30,918 | 39,554 |
| 503 | 751 | 31,072 | 31,606 |
| 504 | 657 | 30,670 | 31,333 |
| 505 | 563 | 30,333 | 38,550 |
| 506 | 469 | 29,988 | 36,943 |
| 507 | 375 | 30,061 | 30,543 |
| 508 | 281 | 29,698 | 37,772 |
| 509 | 188 | 29,319 | 38,006 |
| 510 | 94 | 27,700 | 37,558 |
| 511 | 0 | 0 | 0 |

![Number of Assignments](Number_of_Assignments.png "Number of Assignments")

![Number of Assignments for 500 Restrictions and More](Number_of_Assignments_500_or_Higher.png "Number of Assignments for 500 Restrictions and More")
