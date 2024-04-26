import NFA #Probably not nessesary

# class DFA:
#     def __init__(self, states, alphabet, transition, start_state, accept_states):
#         self.states = states
#         self.alphabet = alphabet
#         self.transition = transition
#         self.start_state = start_state
#         self.accept_states = accept_states

#     # def from_nfa(nfa):
#     #     # https://www.geeksforgeeks.org/conversion-from-nfa-to-dfa/
#     #     # Step 1: Convert the given NFA to its equivalent transition table
#     #     # Step 2: Create the DFA’s start state
#     #     # Step 3: Create the DFA’s transition table
#     #     # Step 4: Create the DFA’s final states
#     #     # Step 5: Simplify the DFA
#     #     # Step 6: Repeat steps 3-5 until no further simplification is possible

#     def from_nfa(nfa):
#         start_state = frozenset([nfa.start_state])
#         transitions = {}
#         queue = [start_state]
#         states = set([start_state])
#         accept_states = []
#         alphabet = nfa.alphabet

#         while queue:
#             current_state = queue.pop(0)
#             if isinstance(current_state, str):
#                 current_state = frozenset([current_state])
#             if current_state.intersection(nfa.accept_states):
#                 accept_states.append(current_state)
#             for symbol in alphabet:
#                 next_states = set()
#                 for state in current_state:
#                     for transition in nfa.transitions:
#                         if transition[0] == state and transition[1] == symbol:
#                             next_states.add(transition[2])
#                 next_state = frozenset(next_states)
#                 transitions.setdefault(current_state, {})[symbol] = next_state
#                 if next_state not in states:
#                     states.add(next_state)
#                     queue.append(next_state)

#         return DFA(states, alphabet, transitions, start_state, accept_states)

class DFA:
    def __init__(self, states, alphabet, transition, start_state, accept_states):
        self.states = states
        self.alphabet = alphabet
        self.transition = transition
        self.start_state = start_state
        self.accept_states = accept_states

    @staticmethod
    def from_nfa(nfa):
        start_state = frozenset([nfa.start_state])
        transitions = {}
        queue = [start_state]
        states = set([start_state])
        
        # Convert accept_states to a set here
        accept_states = set(nfa.accept_states)
        
        alphabet = nfa.alphabet

        while queue:
            current_state = queue.pop(0)
            if isinstance(current_state, str):
                current_state = frozenset([current_state])
            # Now you can safely perform the intersection
            if current_state.intersection(accept_states):
                accept_states.append(current_state)
            for symbol in alphabet:
                next_states = set()
                for state in current_state:
                    for transition in nfa.transitions:
                        if transition[0] == state and transition[1] == symbol:
                            next_states.add(transition[2])
                next_state = frozenset(next_states)
                transitions.setdefault(current_state, {})[symbol] = next_state
                if next_state not in states:
                    states.add(next_state)
                    queue.append(next_state)

        return DFA(states, alphabet, transitions, start_state, accept_states)


def move(states, symbol):
    """
    Function to compute the set of states reachable from a given set of states
    using a specific input symbol.
    """
    new_states = set()
    for state in states:
        # Compute the set of states reachable from 'state' using 'symbol'
        # Add them to 'new_states'
    return new_states

def closure(states):
    """
    Function to compute the closure of a set of states in the NFA.
    """
    # Implement the closure algorithm to compute the epsilon closure of 'states'

# Define the NFA transitions and final states

# Compute the epsilon closure of each state in the NFA

# Create an empty DFA transition table and set of DFA states

# Initialize the DFA with the epsilon closure of the initial state of the NFA as the start state

# Iterate over each state in the DFA
    # For each input symbol
        # Compute the move from the current DFA state using the move function
        # Compute the epsilon closure of the move
        # If the resulting set of states is not in the DFA states
            # Add it to the DFA states
        # Add the transition to the DFA transition table

# Determine final states of the DFA based on final states of the NFA

# Output the DFA transition table and final states



# Usage example:
nfa = NFA
nfa = nfa.NFA.from_regexp("a")
print(f"nfa acceptstates: {nfa.accept_states}")
dfa = DFA
dfa = dfa.from_nfa(nfa)

# nfa.from_regexp("a")
# print(nfa.accept_states)
# nfa = NFA(states={'q0', 'q1'}, alphabet={'0', '1'}, transitions=[], start_state='q0', accept_states=['q1'])
# dfa = DFA.from_nfa(nfa)

#Currently epsilon does not appear in NFA, but the epsilon closure is part of conversion
#Læs i method afsnit