def READ(input):
    return input


def EVAL(input):
    return input


def _PRINT(input):
    return input


def rep(input):
    return _PRINT(EVAL(READ(input)))


def main():
    while True:
        try:
            command = rep(raw_input("user> "))
            print command
        except EOFError:
            print '\n'
            quit()



main()
