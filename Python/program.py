import NFA 
import DFA

def main():
    #regexp = "a(b|c)*d"
    regexp = "ab"
    nfa = NFA.from_regexp(regexp)
    dfa = DFA.from_nfa(nfa)
    