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
        accept_states = [] #This doesn't work yet
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
            
            #Make groupes - ()
            i = 0
            while (i < len(regex)):
                char = regex[i]
                if char == '(': #Make a list of chars, the list of groups
                    group = grouping(regex[i + 1:])  # pass on from ith index and the rest of the regex. Removing '(' with +1
                    groupList.append(group)
                    i += len(group) + 2  # move i past the group and the closing ')'
                else:
                    groupList.append(char)
                    i += 1
            print('groupList:', groupList)
           
            #Itterate over list of groups
            for i, group in enumerate(groupList): #maybe better with while - more control over i(make it j to avoid confusion)
                print(f"group {i}: {group}")
                
                #operator logic
                if (isoperator(char)):
                    #implement logic for each operator here
                    if (char == '|' ):
                        pass
                        #group[i-1] og group[i+1] er her 'a' og 'b' i 'a|b', da i er '|' : måske vigtigt?
                                                # og så '(ab)' og '(cd)' i '(ab)|(cd)'
                        #save Lside and Rside
                        #call recursively on each side but incorporate the logic.
                            # maybe

                #litteral logic
                if char in alphabet:
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
                    print('end')
                    return group
                else:
                    group.append(char)
                print(group)
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
regexp2 = "a|b"
nfa2 = NFA.from_regexp(regexp2)
print("regexpr:", regexp2)
print("States:", nfa2.states)
print("Alphabet:", nfa2.alphabet)
print("Transitions:", nfa2.transitions)
print("Start State:", nfa2.start_state)
print("Accept States:", nfa2.accept_states)
print("------------------------")

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
