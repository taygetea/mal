import re

class Reader:
    def __init__(tokens):
        self.position = 0
        self.tokens = tokens
    def peek():
        return self.tokens[self.position]
    def next():
        self.position += 1
        return self.tokens[self.position-1]

def tokenizer(str):
    return re.findall("""[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"|;.*|[^\s\[\]{}('"`,;)]*)""", str)


def read_str(lispstr):
    tokens = tokenizer(lispstr)
    reader = Reader(tokens)
    return read_form(reader)

def read_form(reader):
    if reader.peek() == "(":
        return read_list(reader)
    else:
        return read_atom(reader)

def read_list(reader
