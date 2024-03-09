# Notes:
# Remove outermost parentheses
# Split the expression

#operators to start with:
    # | : or
    # + : one or more
    # * : zero or more
    # ? : zero or one

class NFA:
    def __init__(self, states, alphabet, transitions, start_state, accept_states):
        self.states = states
        self.alphabet = alphabet
        self.transitions = transitions
        self.start_state = start_state
        self.accept_states = accept_states

    def from_regexp(regexp):
        start_state = 'q0'
        accept_states = []
        states = [start_state]
        alphabet = set(regexp) # - {'(', ')', '|', '*', '+'} to be expanded upon
        transitions = {}

        # building NFA from regexp, could be done recursively
        def construct_nfa(regex):
            current_state = start_state # initialises the start_state
            stopklods = len(regex) # The total amount of chars to go throug, will be decreased as a counter
            state_counter = 1 #used to name the states 'qn', and a counter later on
            
            # start to divide into functions that recognise litterals and operators
            # "switch case" on operators that sends on
            # if operator() then 
                #returns true or false: operator() | * = true | + = true...
            
            for char in regex:
                if (isoperator(char)):
                    print('operator', char)
                    #implement logic for each operator here
                    #start with |
                else:
                    print('litteral:', char)
                if stopklods == 1: # Single character, last char in regexp
                    transitions.setdefault(current_state, {}).setdefault(char, set()).add(current_state) #add the current state to states with "connnections"
                    accept_states.append(current_state) #If the last then this is the end and so accepting
                    return
                             
                new_state = 'q' + str(state_counter) #naming new state
                transitions.setdefault(current_state, {}).setdefault(char, set()).add(new_state) # from current state to new state into transitions
                states.append(new_state) #add new state to states
                current_state = new_state
                stopklods -= 1
                state_counter += 1


        construct_nfa(regexp)
        
        return NFA(states, alphabet, transitions, start_state, accept_states)


def isoperator(char): #should be moved to a helper class
    if (char == '*') : #make to switch cases
        return True
    elif (char == '+'):
        return True
    elif (char == '|'):
        return True
    elif (char == '?'):
        return True
    else: 
        return False



# Testing
print("------------------------")
regexp = "abc"
nfa = NFA.from_regexp(regexp)
print("regexpr:", regexp)
print("States:", nfa.states)
print("Alphabet:", nfa.alphabet)
print("Transitions:", nfa.transitions)
print("Start State:", nfa.start_state)
print("Accept States:", nfa.accept_states)
print("------------------------")

print("")

print("------------------------")
regexp1 = "a"
nfa1 = NFA.from_regexp(regexp1)
print("regexpr:", regexp1)
print("States:", nfa1.states)
print("Alphabet:", nfa1.alphabet)
print("Transitions:", nfa1.transitions)
print("Start State:", nfa1.start_state)
#print("Accept States:", nfa1.accept_states)
print("------------------------")


print("------------------------")
regexp2 = "a|b"
nfa2 = NFA.from_regexp(regexp2)
print("regexpr:", regexp2)
print("States:", nfa2.states)
print("Alphabet:", nfa2.alphabet)
print("Transitions:", nfa2.transitions)
print("Start State:", nfa2.start_state)
print("Accept States:", nfa2.accept_states)
print("------------------------")

