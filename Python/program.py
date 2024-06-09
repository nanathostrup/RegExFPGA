import NFA 
import DFA
import Traversal

def main():
    #regexp = "a(b|c)*d"
    regexp = "ab"
    nfa = NFA.from_regexp(regexp)
    dfa = DFA.from_nfa(nfa)
    trav = Traversal.traverse("d")
    