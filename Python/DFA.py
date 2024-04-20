import NFA #Probably not nessesary

class DFA:
    def __init__(self, states, alphabet, transition, start_state, accept_states):
        self.states = states
        self.alphabet = alphabet
        self.transition = transition
        self.start_state = start_state
        self.accept_states = accept_states

    def from_nfa(nfa):
        #Implemet here
        pass

#Currently epsilon does not appear in NFA, but the epsilon closure is part of conversion
#Læs i method afsnit