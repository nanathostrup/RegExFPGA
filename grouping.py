#Med den her kan man også bruge group[i] som er godt til når man konverterer til C#/SME
def grouping(regexp):
    # inGroup = False # For another idea - gemt i Onenote "Design -> NFA grouping anden ide"
    depth = 0 # For nested parentheses, count how many groups need to be closed
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

#Basics 
string0 = "ab" # No groups
string1 = "(ab)" # One group
string2 = "(ab)(cd)" # Multiple groups
string3 = "( a b ) (c d )" # Space will not be added
print('string0:', grouping(string0)) 
print('string1:', grouping(string1)) 
print('string2:', grouping(string2)) 
print('string3:', grouping(string3)) 

stringn = "abc(a)(b)" # Groups with and with out parenthesis
stringnn = "abc(a)d(b)" # Mix between using parenthesis and not
print('string0:', grouping(stringn))  # Output: ['abc', 'a', 'b']
print('string0:', grouping(stringnn))  # Output: ['abcd', 'a', 'b']

#Nested parentheses
stringnest0 = "(a(b))"
stringnest1 = "(a(a(a(a(a(a))))))"
print('stringnest0:', grouping(stringnest0))
print('stringnest1:', grouping(stringnest1))

#Error message testing:
stringerror0 = "(ab"
stringerror1 = "ab)"
stringerror2 = "(a(ab)"
stringerror3 = "(((aaa"
# print('stringerror0:', grouping(stringerror0)) #Works as intended - raises error 
# print('stringerror1:', grouping(stringerror1)) #Works as intended - raises error 
# print('stringerror2:', grouping(stringerror2)) #Works as intended - raises error
# print('stringerror3:', grouping(stringerror3)) #Works as intended - raises error
