import re

txt = "hello world"

#Search for a sequence that starts with "he", followed by 0 or 1  (any) character, and an "o":

x = re.findall("he?o", txt)

text = "abcaaaaa"

y = re.findall("a+", text)
print(x)
print(y)