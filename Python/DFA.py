import NFA
class DFA:
    def __init__(self, states, alphabet, transitions, start_state, accept_states):
        self.states = states
        self.alphabet = alphabet
        self.transitions = transitions
        self.start_state = start_state
        self.accept_states = accept_states   
    
    def from_nfa(self, nfa): # move() function
        states = []
        accept_states = [] 
        alphabet = nfa.alphabet - {'eps'} #the same alphabet as with the nfa except the empty string
        start_state = []
        transitions = []
        newList = []
        nfa_dfa = [] #Tracks the nfa states that belong in the new dfa state
        
        state_counter = 0 # to keep track of states and to name the states as well
        in_accepting = False # if a state in nfa is accepting is encountered, then this is used

        #epsilon closure on start state, initializing/starting the dfa
        newList.append(nfa.states[0])
        newList, in_accepting = self.epsilonClosure(nfa, newList, in_accepting)
        to_insert = []
        to_insert.append(newList)
        to_insert.append('start')
        nfa_dfa.append(to_insert)
        
        #inserting this new state to relevant state trackers
        new_state = 's' + str(state_counter)  # Naming new state
        insert = []
        insert.append(newList)
        insert.append(new_state)
        states.append(insert)
        start_state.append(new_state)
        if in_accepting == True:
            accept_states.append(new_state)
        state_counter += 1

        for dfa_state in nfa_dfa:
            if dfa_state[0] != []:
                for symbol in alphabet:
                    newList = [] #reset for new symbol in alphabet
                    in_accepting = False #reset for new symbol
                    for transition in nfa.transitions:
                        # if the state going out from nfa with the current symbol, then the state it goes into should be added to the dfa states
                        if (transition[0] in dfa_state[0]) and transition[1] == symbol:
                            newList.append(transition[2])
                    newList, in_accepting = self.epsilonClosure(nfa, newList, in_accepting)
                    
                    if newList != []:
                        to_insert = []
                        to_insert.append(newList) # these are the states where the symbols and eps go to from the current state
                        to_insert.append(symbol) # The symbol in the alphabet
                        to_insert.append(dfa_state[0]) # This is the dfa_state that is checked so this is the from state
                        nfa_dfa.append(to_insert)

                        #making the transitions
                        transition_entry = []
                        from_state = ''
                        to_state = ''
                        for state in states:
                            if newList == state[0]: # if the to state already exists, only a new transition symbol should be added
                                transition_entry = []
                                to_state = state[1] # name of found to state
                                # not added to states, since it already exists:)
                                
                            if dfa_state[0] == state[0]: #save the from state
                                from_state = state[1]
                                
                        
                        if to_state == '': #if entry is empty, then no to state has found, and a new state should be made
                            #make a new state
                            new_state = 's' + str(state_counter)
                            state_counter += 1
                            to_state = new_state
                            
                            #add to states
                            insertion = [] #first added to own array to make an array of arrays, to group the states
                            insertion.append(newList) #the nfas that are in the new dfa state
                            insertion.append(new_state) #the name of the new dfa state
                            states.append(insertion)
                            
                            #check if dfa state should be accepting
                            if in_accepting == True:
                                accept_states.append(new_state)
 
                        transition_entry.append(from_state)
                        transition_entry.append(symbol)
                        transition_entry.append(to_state)
                        transitions.append(transition_entry)
                
        # print('nfa_dfa:', nfa_dfa)    
            
        return DFA(states, alphabet, transitions, start_state, accept_states)


    
    def epsilonClosure(self, nfa, newList, in_accepting):
        for state in newList:
            for transition in nfa.transitions:
                if transition[1] == 'eps' and transition[0] == state:
                    newList.append(transition[2])
        #if any state in nfa in this list is accepting then the dfa state should be accepting
        if any(state in nfa.accept_states for state in newList): #could be set up into the other method. 
            # print('in_accepting')
            # print(state)
            in_accepting = True
        
        return newList, in_accepting

print("------------------------")

#Basic one string
print("------------------------")
regex = "a"
nfa = NFA
nfa = nfa.NFA.from_regexp(regex)
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

#consecutive string
print("------------------------")
regex = "ab"
nfa = NFA
nfa = nfa.NFA.from_regexp(regex)
nfa.states = ['q0', 'q1', 'q2']
nfa.alphabet = {'a', 'b'}
nfa.transitions = [['q0', 'a', 'q1'], ['q1', 'b', 'q2']]
nfa.accept_states = ['q2']
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

#branching
print("------------------------")
# a self made nfa, that cannot be made with current nfa program
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
print("------------------------")

#branching and consecutive string
print("------------------------")
regex = "ab|b"
nfa.states = ['q0', 'q1', 'q3', 'q4', 'q5', 'q6']
nfa.alphabet = {'a', 'b', 'eps'}
nfa.transitions = [['q0', 'eps', 'q1'], ['q0', 'eps', 'q4'], ['q1', 'a', 'q2'], ['q2', 'b', 'q3'], ['q3', 'eps', 'q6'], ['q4', 'b', 'q5'],  ['q5', 'eps', 'q6']]
nfa.accept_states = ['q6']
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

#group
print("------------------------")
regex = "(ab)(b)"
nfa.states = ['q0', 'q1', 'q3', 'q4', 'q5', 'q6']
nfa.alphabet = {'a', 'b', 'eps'}
nfa.transitions = [['q0', 'eps', 'q1'], ['q0', 'eps', 'q4'], ['q1', 'a', 'q2'], ['q2', 'b', 'q3'], ['q3', 'eps', 'q6'], ['q4', 'b', 'q5'],  ['q5', 'eps', 'q6']]
nfa.accept_states = ['q6']
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

#branching and consecutive string
print("------------------------")
regex = "(ab)|(b)"
nfa.states = ['q0', 'q1', 'q3', 'q4', 'q5', 'q6']
nfa.alphabet = {'a', 'b', 'eps'}
nfa.transitions = [['q0', 'eps', 'q1'], ['q0', 'eps', 'q4'], ['q1', 'a', 'q2'], ['q2', 'b', 'q3'], ['q3', 'eps', 'q6'], ['q4', 'b', 'q5'],  ['q5', 'eps', 'q6']]
nfa.accept_states = ['q6']
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