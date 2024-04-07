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
        alphabet = set(regexp) - {'(', ')', '|', '*', '+', '?'} # extend if more operators are used
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
            
            branch_states = []  # Store the states for each branch
            groupList = []
            noGroup = []
            dividedList = []
            
            for i, char in enumerate(regex):
                if (char == '('): #grouping
                    group = grouping(regex[i + 1:]) #pass on from ith index and the rest of the regex. Removing '(' with +1
                    for char1 in group:
                        print(f"the group: {char1}") #there are the correct things in the group:)
                        #do the logic here
                    #When grouping is done, remember to move the state counter, and stopklods (noget alla stopklods -= (len(grouping)))
                    groupList.append(group)
                    #Lav liste med lister - liste med grupper
                    dividedList.append(group)
                    i += len(group)
                else:
                    noGroup.append(char)
                    groupList.append(noGroup)
    
            #For løkke over liste med grupper
                        #For each group in list
            
            for group in groupList: 
                if (isoperator(char)):
                    print('operator', char)
                    #implement logic for each operator here
                    #start with |
                    if (char == '|' ):
                        print('OR:)')
                            #save Lside and Rside
                            #call recursively on each side but incorporate the logic.
                                # maybe

                if char in alphabet:
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
                
            # common_state = 'q' + str(state_counter)
            # state_counter += 1
    
        #recognises groupings
        def grouping(charList):  #itterate through all the chars until ')' and return this collection
            group = []
            for char in charList:
                if (char == ')'):
                    return group
                else:
                    group.append(char)
            raise SyntaxError('error, expected grouping to be closed, expected )')

        #recognises operators
        def isoperator(char): #should be moved to a helper class?
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
        
        #Does the logic and adds transitions for each operator
        def operatorOr(charList):
            pass
        def operatorStar(charList):
            pass   
        def operatorPlus(charList):
            pass
        def operatorQuestion(charList):
            pass   
        
        
        construct_nfa(regexp)
        
        return NFA(states, alphabet, transitions, start_state, accept_states)



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

print("------------------------")#Den her er forkert. Den vil kun give {'q0': {'a': {'q0'}}}, Mangler en q1.
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
regexp2 = "(ab)"
nfa2 = NFA.from_regexp(regexp2)
print("regexpr:", regexp2)
print("States:", nfa2.states)
print("Alphabet:", nfa2.alphabet)
print("Transitions:", nfa2.transitions)
print("Start State:", nfa2.start_state)
print("Accept States:", nfa2.accept_states)
print("------------------------")

print("------------------------")
regexp2 = "(ab)(cd)"
nfa2 = NFA.from_regexp(regexp2)
print("regexpr:", regexp2)
print("States:", nfa2.states)
print("Alphabet:", nfa2.alphabet)
print("Transitions:", nfa2.transitions)
print("Start State:", nfa2.start_state)
print("Accept States:", nfa2.accept_states)
print("------------------------")

#To check the error raising in grouping.
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

