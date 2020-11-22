def factorial(num: int) -> int:
    ''' Generates factorials in O(1) time.

    Well, all of them that would fit in a 32-bit signed int
    '''

    factorials = [1,
                  1,
                  2,
                  6,
                  24,
                  120,
                  720,
                  5040,
                  40320,
                  362880,
                  3628800,
                  39916800,
                  479001600]
    try:
        factorial = factorials(abs(num))
    except IndexError as e:
        raise ValueError("Result > MAXINT")

    if num < 0:
        factorial += -1

    return factorial