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

#Make tests som Carl snakker om
    # more convinsing
    # traverse
    # Talk about unit testing - about 1/2 page
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
        # transitions = {}
        transitions = []

        # building NFA from regexp, could be done recursively
        def construct_nfa(regex):
            current_state = start_state # initialises the start_state
            state_counter = 1 #used to name the states 'qn', and a counter later on
            # stopklods = len(regex) # The total amount of chars to go throug, will be decreased as a counter
            
            groups = grouping(regex) # Divide into groups. Skærer '(' og ')' og ' ' (mellemrum) fra :)
            
            for group in groups:
                new_state, state_counter, char = process_group(group, current_state, state_counter)
                current_state = new_state
            
            # to_add = []
            # to_add.append(new_state)
            # to_add.append(char)
            # accept_states.append(to_add)
            accept_states.append(new_state)
            return 
            
        def process_group(group, current_state, state_counter):
            new_state = current_state  # Initialize the new state with the current state
            saved_char = ''
            for char in group:
                #operator logic here - also before. Should make clean slate when 
                is_operator(char)
                if char in alphabet:
                    new_state = 'q' + str(state_counter)  # Naming new state
                    to_insert = []
                    to_insert.append(current_state)
                    to_insert.append(char)
                    to_insert.append(new_state)
                    transitions.append(to_insert)
                    # transitions.setdefault(current_state, {}).setdefault(char, set()).add(new_state)  # Add transition
                    states.append(new_state)  # Add new state to states
                    current_state = new_state  # Update current state
                    state_counter += 1  # Increment state counter
                saved_char = char
            return new_state, state_counter, saved_char #State counter is also returned so it is not overwritten in construct_nfa
                      
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
            pass
        def operator_dot(charList):
            pass   
        def operator_plus(charList):
            pass
        def operator_question(charList):
            pass   
    
        construct_nfa(regexp)
        
        return NFA(states, alphabet, transitions, start_state, accept_states)


    def matches(self, input_string):
        # print(input_string)
        in_state = self.start_state
        # print('len:', len(input_string))
    #This may have to be put some place else...
        for i in range(len(input_string)):
                # print('input_string[i]:', input_string[i])
                # print('i:', i)
            # for state in self.states: 
                for transition in self.transitions:
                    # If the from state in transition and the current character in the input string is the transition arrow
                    if transition[0] == in_state and input_string[i] == transition[1]:
                        #Then the next transition can be traveled to
                        in_state = transition[2]
                        # print('in_state:', in_state)
                        if in_state in self.accept_states: #in nfa it is true that if at any point an accepting state is reached, then it matches and funciton terminates
                            return True
                i += 1
        return False #if in_state not in self.accept_states, then it does not match

    # Stuff from online example


# # Testing
# # Tests for the 'grouping' method in sepperate file

# # Completely basic: Single character
# print("------------------------")
# regexp = "a"
# nfa = NFA.from_regexp(regexp)
# print("regexpr:", regexp)
# print("States:", nfa.states)
# print("Alphabet:", nfa.alphabet)
# print("Transitions:", nfa.transitions)
# print("Start State:", nfa.start_state)
# print("Accept States:", nfa.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# stringtest0 = "a" #exact match 
# stringtest1 = "abc" #start of string
# stringtest2 = "bb" #no match at all
# stringtest3 = "bca" #end of string
# stringtest4 = "bac" #middle of string
# print(f"the string '{stringtest0}' should be True and is: {nfa.matches(stringtest0)}")
# print(f"the string '{stringtest1}' should be True and is: {nfa.matches(stringtest1)}")
# print(f"the string '{stringtest2}' should be False and is: {nfa.matches(stringtest2)}")
# print(f"the string '{stringtest3}' should be True and is: {nfa.matches(stringtest3)}")
# print(f"the string '{stringtest4}' should be True and is: {nfa.matches(stringtest4)}")
# print("------------------------")

# #Completely basic: longer string
# print("------------------------")
# regexp1 = "abc"
# nfa1 = NFA.from_regexp(regexp1)
# print("regexpr:", regexp1)
# print("States:", nfa1.states)
# print("Alphabet:", nfa1.alphabet)
# print("Transitions:", nfa1.transitions)
# print("Start State:", nfa1.start_state)
# print("Accept States:", nfa1.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# stringtest00 = "a" #start match only, not rest (no end in accepting state) 
# stringtest11 = "abc" #exact string
# stringtest22 = "aaabc" #last bit of string match
# stringtest33 = "abcccc" #start bit of string match
# stringtest44 = "sjsjabckddk" #middle of string match
# print(f"the string '{stringtest00}' should be False and is: {nfa1.matches(stringtest00)}")
# print(f"the string '{stringtest11}' should be True and is: {nfa1.matches(stringtest11)}")
# print(f"the string '{stringtest22}' should be True and is: {nfa1.matches(stringtest22)}")
# print(f"the string '{stringtest33}' should be True and is: {nfa1.matches(stringtest33)}")
# print(f"the string '{stringtest44}' should be True and is: {nfa1.matches(stringtest44)}")

# print("------------------------")

# # Can divide into groupings
# print("------------------------")
# regexp2 = "(ab)"
# nfa2 = NFA.from_regexp(regexp2)
# print("regexpr:", regexp2)
# print("States:", nfa2.states)
# print("Alphabet:", nfa2.alphabet)
# print("Transitions:", nfa2.transitions)
# print("Start State:", nfa2.start_state)
# print("Accept States:", nfa2.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# stringtest000 = "a" #start match only, not rest (no end in accepting state) 
# stringtest111 = "ab" #exact string
# stringtest222 = "b" #last bit
# stringtest333 = "bc" #last bit and extra
# stringtest444 = "(abdbdablæsd)" #random with 2x ab in string
# print(f"the string '{stringtest000}' should be False and is: {nfa2.matches(stringtest000)}")
# print(f"the string '{stringtest111}' should be True and is: {nfa2.matches(stringtest111)}")
# print(f"the string '{stringtest222}' should be True and is: {nfa2.matches(stringtest222)}")
# print(f"the string '{stringtest333}' should be True and is: {nfa2.matches(stringtest333)}")
# print(f"the string '{stringtest444}' should be True and is: {nfa2.matches(stringtest444)}")
# print("------------------------")

# # Multiple groups
# print("------------------------")
# regexp3 = "(ab)(cd)"
# nfa3 = NFA.from_regexp(regexp3)
# print("regexpr:", regexp3)
# print("States:", nfa3.states)
# print("Alphabet:", nfa3.alphabet)
# print("Transitions:", nfa3.transitions)
# print("Start State:", nfa3.start_state)
# print("Accept States:", nfa3.accept_states)
# print("~~~~~~~~~~~~~~~~~~~~~~~~")
# stringtest0000 = "abcd" #exact
# stringtest1111 = "ab" #only part of regex, not ending
# stringtest2222 = "bbbbabcdkkkk" #sandwitched
# print(f"the string '{stringtest0000}' should be True and is: {nfa3.matches(stringtest0000)}")
# print(f"the string '{stringtest1111}' should be False and is: {nfa3.matches(stringtest1111)}")
# print(f"the string '{stringtest2222}' should be True and is: {nfa3.matches(stringtest2222)}")
# print("------------------------")

# # Can do groups in both () and without
# print("------------------------")
# regexp4 = "abc (a)(b)"
# nfa4 = NFA.from_regexp(regexp4)
# print("regexpr:", regexp4)
# print("States:", nfa4.states)
# print("Alphabet:", nfa4.alphabet)
# print("Transitions:", nfa4.transitions)
# print("Start State:", nfa4.start_state)
# print("Accept States:", nfa4.accept_states)
# print("------------------------")

# # Spaces
# print("------------------------")
# regexp5 = "ab c (a) d ( b )"
# nfa5 = NFA.from_regexp(regexp5)
# print("regexpr:", regexp5)
# print("States:", nfa5.states)
# print("Alphabet:", nfa5.alphabet)
# print("Transitions:", nfa5.transitions)
# print("Start State:", nfa5.start_state)
# print("Accept States:", nfa5.accept_states)
# print("------------------------")

# # To check the error raising in grouping. Should raise an error.
# # print("------------------------")
# # regexp2 = "(ab)(cd"
# # nfa2 = NFA.from_regexp(regexp2)
# # print("regexpr:", regexp2)
# # print("States:", nfa2.states)
# # print("Alphabet:", nfa2.alphabet)
# # print("Transitions:", nfa2.transitions)
# # print("Start State:", nfa2.start_state)
# # print("Accept States:", nfa2.accept_states)
# # print("------------------------")

# #################################################################################

# #can recognise operators and litterals
# #Make this after operators are done
# # print("------------------------")
# # regexp2 = "a|b"
# # nfa2 = NFA.from_regexp(regexp2)
# # print("regexpr:", regexp2)
# # print("States:", nfa2.states)
# # print("Alphabet:", nfa2.alphabet)
# # print("Transitions:", nfa2.transitions)
# # print("Start State:", nfa2.start_state)
# # print("Accept States:", nfa2.accept_states)
# # print("------------------------")

# #Searching through nfa with a string
# # print("------------------------")
# # regexstr = "a"
# # nfastr = NFA.from_regexp(regexstr)
# # teststr = "ab"
# # # nfastr.assertTrue(nfa.accept_states!=[])

# # import unittest
# # class TestNFA(unittest.TestCase):
# #     def test_single_character(self):
# #         nfa = NFA.from_regexp("a")
# #         self.assertTrue(nfa.accept_states != [])
# #         self.assertTrue('q1' in nfa.accept_states)
# #         self.assertTrue('a' in nfa.accept_states)
# #         self.assertFalse('b' in nfa.accept_states)
# #         self.assertFalse('a' in nfa.transitions)
# #         self.assertFalse('b' in nfa.transitions)
# #         teststring = "abc"
# #         wrongstring = "q"
        
# #         any_char_in_accept_states = any(char in nfa.accept_states for char in teststring)
# #         self.assertTrue(any_char_in_accept_states)
        
        
# #         any_char_in_accept_states_wrong = any(char in nfa.accept_states for char in wrongstring)
# #         self.assertFalse(any_char_in_accept_states_wrong)
# #         # for char in teststring:
# #         #     self.assertTrue(char in nfa.accept_states)

# #         for char in wrongstring:
# #             self.assertFalse(char in nfa.accept_states)

# #     def test_simple_concatenation(self):
# #         nfa1 = NFA.from_regexp("ab")
# #         self.assertTrue('q2' in nfa1.accept_states)
# #         # self.assertFalse(nfa.accepts("a"))
# #         # self.assertFalse(nfa.accepts("b"))
# #         # self.assertFalse(nfa.accepts("ba"))

# #     # Add more test methods for other cases...

# # if __name__ == '__main__':
# #     unittest.main()

# # Example usage: