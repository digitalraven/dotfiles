def alphabetise(num: int) -> int:
    ''' Take an arbitrary natural number
    and return the digits in alphabetical order
    '''

    order = [8,5,4,9,1,7,6,3,2,0]
    num = str(num)
    result = ""

    for i in order:
        i = str(i)
        result += (i*num.count(i))

    return int(result)