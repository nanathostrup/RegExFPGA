# import DFA
# import NFA
# class Traversal: 
#     def reset(self):
#         """Reset the DFA to the initial state."""
#         self.current_state = self.start_state

#     def make_transition(self, input_symbol):
#         """Make a transition based on the input symbol."""
#         if input_symbol in self.alphabet:
#             self.current_state = self.transition_function[self.current_state][input_symbol]
#         else:
#             raise ValueError(f"Input symbol {input_symbol} is not in the alphabet")

#     def is_accepting(self):
#         """Check if the current state is an accepting state."""
#         return self.current_state in self.accept_states

#     def traverse(self, input_string):
#         """Traverse the DFA with a given input string."""
#         self.reset()
#         for symbol in input_string:
#             self.make_transition(symbol)
#         return self.is_accepting()


# #Basic one string
# print("------------------------")
# regex = "a"
# nfa = NFA
# nfa = nfa.NFA.from_regexp(regex)
# print("regexpr:", regex)
# print("States:", nfa.states)
# print("Alphabet:", nfa.alphabet)
# print("Transitions:", nfa.transitions)
# print("Start State:", nfa.start_state)
# print("Accept States:", nfa.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# states = []
# alphabet = {}
# transitions = []
# start_state = []
# accept_states = []
# dfa = DFA.DFA(states, alphabet, transitions, start_state, accept_states)
# dfa = dfa.from_nfa(nfa)
# print("Alphabet:", dfa.alphabet)
# print("States:", dfa.states)
# print("Transitions:", dfa.transitions)
# print("Start State:", dfa.start_state)
# print("Accept States:", dfa.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# trav = Traversal.traverse("")
# print("------------------------")

