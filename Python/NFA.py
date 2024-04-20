# Notes:
# Remove outermost parentheses
# Split the expression

#operators to start with:
    # | : or
    # + : one or more
    # ? : zero or one
    # . : any character
        #this is a 'weird' behaviour, kinda wild card 
        #works in principle and can be expanded. This can be used to show ^

class NFA:
    def __init__(self, states, alphabet, transitions, start_state, accept_states): #is innit nessesary?
        self.states = states
        self.alphabet = alphabet
        self.transitions = transitions
        self.start_state = start_state
        self.accept_states = accept_states

    def from_regexp(regexp):
        start_state = 'q0'
        accept_states = []
        states = [start_state]
        alphabet = set(regexp) - {'(', ')', ' '} #, '|', '.', '+', '?'} # extend if more operators are used
        transitions = {}

        # building NFA from regexp, could be done recursively
        def construct_nfa(regex):
            current_state = start_state # initialises the start_state
            # stopklods = len(regex) # The total amount of chars to go throug, will be decreased as a counter
            state_counter = 1 #used to name the states 'qn', and a counter later on
            groups = grouping(regex) # Divide into groups. Skærer '(' og ')' og ' ' (mellemrum) fra :)
            
            for group in groups:
                new_state, state_counter = process_group(group, current_state, state_counter)
                current_state = new_state
            accept_states.append(new_state)
            return 
            
        def process_group(group, current_state, state_counter):
            new_state = current_state  # Initialize the new state with the current state
            for char in group:
                #operator logic here
                if char in alphabet:
                    new_state = 'q' + str(state_counter)  # Naming new state
                    transitions.setdefault(current_state, {}).setdefault(char, set()).add(new_state)  # Add transition
                    states.append(new_state)  # Add new state to states
                    current_state = new_state  # Update current state
                    state_counter += 1  # Increment state counter

            return new_state, state_counter #State counter is also returned so it is not overwritten in construct_nfa
                      
        #divides into groups
        def grouping(regexp):
            # inGroup = False # For another idea - gemt i Onenote "Design -> NFA grouping anden ide"
            depth = 0 # For nested parentheses, counts how many parentheses need to be closed
            grouping = []
            group = []
            stopklods = len(regexp) #Makes sure that the last group will be added
            
            for char in regexp:
                if char == '(':
                    depth += 1
                    if group != []: # for the group that is outside a () will be added before resetting
                        grouping.append(group)
                    group = [] # Reset so that it wont continue a finished group, may have been done in elif, but may also not
                elif char == ')':
                    depth -= 1
                    if group != []:
                        grouping.append(group) # slut på group, tilføj til grouping og nulstil
                    group = [] # This group is done, so reset
                else:
                    if char != ' ': # makes sure space is ignored
                        group.append(char)
                if stopklods == 1: # Makes sure that the last group will be added if no parenthesis are found
                    if depth != 0:
                        raise SyntaxError(f"mismatch in parentheses in the regular expression: {regexp}")
                    if group != []: #If there are no parentheses then this group is the last and only once stopklods = 1
                        grouping.append(group)
                stopklods -= 1
            return grouping
            
        #recognises operators
        #make this function pass on to the sepperate methods
        def is_operator(char):
            if (char == '.') : #make to switch cases
                return True
                #Pass to operatorDot()
            elif (char == '+'):
                return True
            elif (char == '|'):
                return True
            elif (char == '?'):
                return True
            else: 
                return False
        
        #Does the logic and adds transitions for each operator
        def operator_or(charList):
            pass #Should maybe pass to sepperate functions too to avoid a very large function
        def operator_dot(charList):
            pass   
        def operator_plus(charList):
            pass
        def operator_question(charList):
            pass   
        
        
        construct_nfa(regexp)
        
        return NFA(states, alphabet, transitions, start_state, accept_states)



# Testing
# tests for the 'grouping' method in sepperate file

#Completely basic
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

#Den her er forkert. Den vil kun give {'q0': {'a': {'q0'}}}, Mangler en q1.
print("------------------------")
regexp1 = "a"
nfa1 = NFA.from_regexp(regexp1)
print("regexpr:", regexp1)
print("States:", nfa1.states)
print("Alphabet:", nfa1.alphabet)
print("Transitions:", nfa1.transitions)
print("Start State:", nfa1.start_state)
print("Accept States:", nfa1.accept_states)
print("------------------------")

#can dicide into groupings
print("------------------------")
regexp3 = "(ab)"
nfa3 = NFA.from_regexp(regexp3)
print("regexpr:", regexp3)
print("States:", nfa3.states)
print("Alphabet:", nfa3.alphabet)
print("Transitions:", nfa3.transitions)
print("Start State:", nfa3.start_state)
print("Accept States:", nfa3.accept_states)
print("------------------------")

# Multiple groups
print("------------------------")
regexp4 = "(ab)(cd)"
nfa4 = NFA.from_regexp(regexp4)
print("regexpr:", regexp4)
print("States:", nfa4.states)
print("Alphabet:", nfa4.alphabet)
print("Transitions:", nfa4.transitions)
print("Start State:", nfa4.start_state)
print("Accept States:", nfa4.accept_states)
print("------------------------")

#can do groups in both () and without
print("------------------------")
regexp4 = "abc (a)(b)"
nfa4 = NFA.from_regexp(regexp4)
print("regexpr:", regexp4)
print("States:", nfa4.states)
print("Alphabet:", nfa4.alphabet)
print("Transitions:", nfa4.transitions)
print("Start State:", nfa4.start_state)
print("Accept States:", nfa4.accept_states)
print("------------------------")

#Spaces
print("------------------------")
regexp4 = "ab c (a) d ( b )"
nfa4 = NFA.from_regexp(regexp4)
print("regexpr:", regexp4)
print("States:", nfa4.states)
print("Alphabet:", nfa4.alphabet)
print("Transitions:", nfa4.transitions)
print("Start State:", nfa4.start_state)
print("Accept States:", nfa4.accept_states)
print("------------------------")

#can recognise operators and litterals
#Make this after operators are done
# print("------------------------")
# regexp2 = "a|b"
# nfa2 = NFA.from_regexp(regexp2)
# print("regexpr:", regexp2)
# print("States:", nfa2.states)
# print("Alphabet:", nfa2.alphabet)
# print("Transitions:", nfa2.transitions)
# print("Start State:", nfa2.start_state)
# print("Accept States:", nfa2.accept_states)
# print("------------------------")

# To check the error raising in grouping. Should raise an error.
# print("------------------------")
# regexp2 = "(ab)(cd"
# nfa2 = NFA.from_regexp(regexp2)
# print("regexpr:", regexp2)
# print("States:", nfa2.states)
# print("Alphabet:", nfa2.alphabet)
# print("Transitions:", nfa2.transitions)
# print("Start State:", nfa2.start_state)
# print("Accept States:", nfa2.accept_states)
# print("------------------------")

#Needed:
#To check groupings AND operators:
#regex6 = "(a|b)|a"