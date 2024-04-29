import NFA

#     # def from_nfa(nfa):
#     #     # https://www.geeksforgeeks.org/conversion-from-nfa-to-dfa/
#     #     # Step 1: Convert the given NFA to its equivalent transition table
#     #     # Step 2: Create the DFA’s start state
#     #     # Step 3: Create the DFA’s transition table
#     #     # Step 4: Create the DFA’s final states
#     #     # Step 5: Simplify the DFA
#     #     # Step 6: Repeat steps 3-5 until no further simplification is possible

class DFA:
    def __init__(self, states, alphabet, transitions, start_state, accept_states):
        self.states = states
        self.alphabet = alphabet
        self.transitions = transitions
        self.start_state = start_state
        self.accept_states = accept_states

    # def from_nfa(self, nfa):
    #     self.move(self, nfa)        
    
    def from_nfa(self, nfa):
    # def move(nfa): # move function
        print('in move')
        states = []
        accept_states = [] 
        alphabet = nfa.alphabet - {'eps'} #the same alphabet except the empty string
        start_state = []
        transitions = []
        newList = []
        nfa_dfa = [] #Tracks the nfa states that belong in the new dfa state
        
        state_counter = 0 # to keep track of states and to name the states as well
        in_accepting = False #if a state in nfa is accepting is encountered, then this is used
        oldList = [] #To keep track of prior newList, and if 
        in_state = nfa.start_state
        # queue = [start_state]
        # new_state = 's' + str(state_counter)

        #epsilon closure on start state, initializing/starting the dfa
        # print('start state')
        # print('nfa.states[0]:', nfa.states[0])
        newList.append(nfa.states[0])
        newList, in_accepting = self.epsilonClosure(nfa, newList, in_accepting)
        to_insert = []
        to_insert.append(newList)
        to_insert.append('start')
        nfa_dfa.append(to_insert)
        print('oldList:', oldList)
        
        #inserting this new state to relevant state trackers
        new_state = 's' + str(state_counter)  # Naming new state
        states.append(new_state)
        start_state.append(new_state)
        if in_accepting == True:
            accept_states.append(new_state)
        state_counter += 1

        #there are no transitions yet, this is only the start state.


        # kinda rigtigt neden under, men den itterer over nfa states i stedet for de dfa states der kommer til som i movefuntionen.
        # for states in nfa.states:
        # for i in range(len(states)): #dfa states
        #     for symbol in alphabet: #dfa's alphabet
        #         for transition in nfa.transitions: #the transitions that are searched through in move()
        #             if transition[0] == nfa.states[i] in the dfa state

        print(nfa_dfa)
        for dfa_state in nfa_dfa:
            print('newList:', newList)
            print('dfa_state', dfa_state)
            if dfa_state[0] != []:
                for symbol in alphabet:
                    newList = [] #reset for new symbol in alphabet
                    in_accepting = False #reset for new symbol
                    for transition in nfa.transitions:
                        #if the state going out from nfa is the current symbol, then the next state should be added to the dfa states
                        if (transition[0] in dfa_state[0]) and transition[1] == symbol:
                            # if transition[2] in nfa.accepting_states:
                            #     in_accepting = True
                            newList.append(transition[2])
                    # print('newList before epsilon closure:', newList) #Can be used to check if epsilon closure works and _
                    newList, in_accepting = self.epsilonClosure(nfa, newList, in_accepting)
                    # print('newList after epsilon closure:', newList) #Can be used to check if epsilon closure works and ^
                    
                    #If there are new states to add:
                    if newList != []:
                        to_insert = []
                        to_insert.append(newList)
                        to_insert.append(symbol)
                        nfa_dfa.append(to_insert)
                        # THIS ^^ COULD BE DONE TWICE IN IF STATEMENT BELLOW, LOOK INTO, MAKE BETTER

                        #if not exist already, then a new state is made
                        if newList not in dfa_state:
                            new_state = 's' + str(state_counter)  # Naming new state
                            states.append(new_state)
                            state_counter += 1
                            #if any nfa state in the newList is accepting then the new dfa state should also be accepting
                            if in_accepting:
                                accept_states.append(to_insert)
                         #if the list already exists, then a new transition should be added
                        elif newList in dfa_state:
                            #transition skal addes med symbol
                            pass

        print('nfa_dfa:', nfa_dfa)
        return DFA(states, alphabet, transitions, start_state, accept_states)


    
    def epsilonClosure(self, nfa, newList, in_accepting):
        for state in newList:
            for transition in nfa.transitions:
                if transition[1] == 'eps' and transition[0] == state:
                    newList.append(transition[2])
                    
        #if any state in nfa in this list is accepting then the dfa state should be accepting
        if any(state in nfa.accept_states for state in newList): #could be set up into the other method. 
            print('in_accepting')
            in_accepting = True
        
        return newList, in_accepting



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



print("------------------------")
print("------------------------")
regex = "a"
nfa = NFA
nfa = nfa.NFA.from_regexp(regex)
# nfa.states = ['q0', 'q1', 'q3', 'q4', 'q5']
# nfa.alphabet = {'a', 'b'}
# nfa.transitions = [['q0', 'eps', 'q1'], ['q0', 'eps', 'q3'], ['q1', 'a', 'q2'], ['q2', 'eps', 'q5'], ['q3', 'b', 'q4'], ['q4', 'eps', 'q5']]
# nfa.accept_states = ['q5']
print("regexpr:", regex)
print("States:", nfa.states)
print("Alphabet:", nfa.alphabet)
print("Transitions:", nfa.transitions)
print("Start State:", nfa.start_state)
print("Accept States:", nfa.accept_states)

print("~~~~~~~~~~~~~~~~~~~~~~~~")
states = []
alphabet = {}
transitions = []
start_state = []
accept_states = []
dfa = DFA(states, alphabet, transitions, start_state, accept_states)
dfa = dfa.from_nfa(nfa)
print("Alphabet:", dfa.alphabet)
print("States:", dfa.states)
print("Transitions:", dfa.transitions)
print("Start State:", dfa.start_state)
print("Accept States:", dfa.accept_states)
print("------------------------")

print("------------------------")
regex = "a|b"
nfa.states = ['q0', 'q1', 'q3', 'q4', 'q5']
nfa.alphabet = {'a', 'b', 'eps'}
nfa.transitions = [['q0', 'eps', 'q1'], ['q0', 'eps', 'q3'], ['q1', 'a', 'q2'], ['q2', 'eps', 'q5'], ['q3', 'b', 'q4'], ['q4', 'eps', 'q5']]
nfa.accept_states = ['q5']
print("regexpr:", regex)
print("States:", nfa.states)
print("Alphabet:", nfa.alphabet)
print("Transitions:", nfa.transitions)
print("Start State:", nfa.start_state)
print("Accept States:", nfa.accept_states)

print("~~~~~~~~~~~~~~~~~~~~~~~~")
states = []
alphabet = {}
transitions = []
start_state = []
accept_states = []
dfa = DFA(states, alphabet, transitions, start_state, accept_states)
dfa1 = dfa.from_nfa(nfa)
print("Alphabet:", dfa1.alphabet)
print("States:", dfa1.states)
print("Transitions:", dfa1.transitions)
print("Start State:", dfa1.start_state)
print("Accept States:", dfa1.accept_states)




#Currently epsilon does not appear in NFA, but the epsilon closure is part of conversion
#Læs i method afsnit