
import unittest
import re 

if __name__ == '__main__':
    # txt = "The rain in Spain"
    # x = re.search("^The.*Spain$", txt)
    # print(x)
    txt = "The rain in Spain"
    x = re.findall("Portugal", txt)
    print(x)

    stringtest3 = "bca"
    regexp1 = "b"
    x = re.findall(regexp1, stringtest3)

    txt = "The rain in Spain"
    x = re.match(r"Portugal", txt)
    print(x)
    
    x1 = re.match(r"Spain", txt)
    print(x1)

