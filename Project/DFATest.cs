using SME;

namespace sme_intro{

    public class DFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            Console.WriteLine("DFA");
            
            //(start_state, accept_states, states, alphabet, transitions)

            NFA nfa = new NFA();
            DFA dfa = new DFA();
            string regExp = "(ab)";
            // nfa.FromRegExp("(ab)(cd)");
            nfa.FromRegExp(regExp);

            nfa.states = new List<string> { "q0", "q1", "q2" };
            nfa.alphabet = new List<string> { "a", "b" };
            nfa.transitions = new List<List<string>>
            {
                new List<string> { "q0", "a", "q1" },
                new List<string> { "q1", "b", "q2" }
            };
            nfa.start_state =  "q0";
            nfa.accept_states = new List<string> { "q2" };
            
            // char[] start_state = new char[];
            // List<string> accept_states = new List<string>();
            // List<List<string>> states = new List<List<string>>();
            // List<string> alphabet = new List<string>();
            // List<List<string>> transitions = new List<List<string>>(); 

            (char[] start_state, char[] accept_states, char[] states, char[] alphabet, char[][] transitions)= dfa.FromNFA(nfa);

            //The regular expression:
            Console.WriteLine("RegExp:" + regExp);

            //DFA States
            Console.Write("DFA States: ");
            foreach (char state in states)
            {
                Console.Write(state + " ");
            }
            Console.Write("\n");

            //DFA Alphabet
            Console.Write("DFA alphabet: ");
            foreach(char chr in alphabet){
                Console.Write(chr + " ");
            }
            Console.Write("\n");

            //DFA start state
            Console.Write("DFA start state: ");
            foreach (char state in start_state){
                Console.Write(state);
            }
            Console.Write("\n");

            //DFA accepting states:
            Console.Write("DFA accepting states: ");
            foreach (char accept in accept_states){
               Console.Write(accept + " ");
            }
            Console.Write("\n");

            //DFA transitions:
            string transition2 = "";
            string transitions2 = "";
            foreach(var trans in transitions ){
                transitions2 = transitions2 + "[";
                foreach(var str in trans){
                    transition2 = transition2 + str + " ";
                }
                transitions2 = transitions2 + " " + transition2 + "]";
                transition2 = "";
            }
            Console.WriteLine("DFA transitions:" + transitions2);

            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            Console.WriteLine("regExp: " + regExp);
            char[] input0 = new char[] {'a'}; //single char fra regex dur ikke
            Console.WriteLine("Traversal for 'a': " + TraverseDFA(input0, transitions, accept_states, start_state, states));
            char[] input1 = new char[] {'b'}; //single char fra regex dur ikke
            Console.WriteLine("Traversal for 'b': " + TraverseDFA(input1, transitions, accept_states, start_state, states));
            char[] input2 = new char[] {'a' , 'a'}; //nej
            Console.WriteLine("Traversal for 'aa': " + TraverseDFA(input2, transitions, accept_states, start_state, states));
            char[] input3 = new char[] {'a' , 'a', 'b'};//starter først efter en char
            Console.WriteLine("Traversal for 'aab': " + TraverseDFA(input3, transitions, accept_states, start_state, states));
            char[] input4 = new char[] {'a' , 'b' , 'a'}; //starter først og så ekstra char efter
            Console.WriteLine("Traversal for 'aba': " + TraverseDFA(input4, transitions, accept_states, start_state, states));
            char[] input5 = new char[] {'b' , 'a' , 'a'}; //same characters men ikke rækkefølge
            Console.WriteLine("Traversal for 'baa': " + TraverseDFA(input5, transitions, accept_states, start_state, states));
            char[] input6 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a'}; //mange ting efter en accept
            Console.WriteLine("Traversal for 'abaccaa': " + TraverseDFA(input6, transitions, accept_states, start_state, states));
            char[] input7 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'abaccaad': " +  TraverseDFA(input7, transitions, accept_states, start_state, states));
            char[] input8 = new char[] {'d' , 'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // starter med noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'dabaccaad': " + TraverseDFA(input8, transitions, accept_states, start_state, states));
 
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            string regexp1 = "((ab)|(a))?";
            nfa.FromRegExp(regexp1);
            (char[] start_state1, char[] accept_states1, char[] states1, char[] alphabet1, char[][] transitions1) = dfa.FromNFA(nfa);
            accept_states1 = new char[]{'3', '0', '2'};
            states1 = new char[] {'0', '1', '2', '3'};
            start_state1 = new char[]{'0'};
            alphabet1 = new char[]{'a', 'b','c'};
            char[] insert2 = new char[]{'0', 'a', '1'};
            char[] insert0 = new char[]{'0', 'a', '3'};
            char[] insert1 = new char[]{'1', 'b', '2'};
            
            transitions1 = new char[][]{insert0, insert1, insert2};
            Console.WriteLine("regExp: " + regexp1);
            char[] input00 = new char[] {'a'};
            // Console.WriteLine(Traverse(input00, alphabet1, start_state1, states1, transitions1, accept_states1));
            Console.WriteLine("Traversal for 'a': " + TraverseDFA(input00, transitions1, accept_states1, start_state1, states1));
            char[] input11 = new char[] {'b'}; //single char fra regex dur ikke
            Console.WriteLine("Traversal for 'b': " + TraverseDFA(input11, transitions1, accept_states1, start_state1, states1));
            char[] input22 = new char[] {'a' , 'a'}; //nej
            Console.WriteLine("Traversal for 'aa': " + TraverseDFA(input22, transitions1, accept_states1, start_state1, states1));
            char[] input33 = new char[] {'a' , 'a', 'b'};//starter først efter en char
            Console.WriteLine("Traversal for 'aab': " + TraverseDFA(input33, transitions1, accept_states1, start_state1, states1));
            char[] input44 = new char[] {'a' , 'b' , 'a'}; //starter først og så ekstra char efter
            Console.WriteLine("Traversal for 'aba': " + TraverseDFA(input44, transitions1, accept_states1, start_state1, states1));
            char[] input55 = new char[] {'b' , 'a' , 'a'}; //same characters men ikke rækkefølge
            Console.WriteLine("Traversal for 'baa': " + TraverseDFA(input55, transitions1, accept_states1, start_state1, states1));
            char[] input66 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a'}; //mange ting efter en accept
            Console.WriteLine("Traversal for 'abaccaa': " + TraverseDFA(input66, transitions1, accept_states1, start_state1, states1));
            char[] input77 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'abaccaad': " +  TraverseDFA(input77, transitions1, accept_states1, start_state1, states1));
            char[] input88 = new char[] {'d' , 'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // starter med noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'dabaccaad': " + TraverseDFA(input88, transitions1, accept_states1, start_state1, states1));
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            
            nfa.FromRegExp("((ab)|(c))");
            (char[] start_statex, char[] accept_statesx, char[] statesx, char[] alphabetx, char[][] transitionsx) = dfa.FromNFA(nfa);
            accept_statesx = new char[]{'3', '2'};
            statesx = new char[] {'0', '1', '2', '3'};
            start_statex = new char[]{'0'};
            alphabetx = new char[]{'a', 'b', 'c'};
            char[] insert0x = new char[]{'0', 'a', '1'};
            char[] insert2x = new char[]{'1', 'b', '2'};
            char[] insert1x = new char[]{'0', 'c', '3'};
            transitionsx = new char[][]{insert0x, insert1x, insert2x};

            Console.WriteLine("((ab)|(c))");
            char[] Input0 = new char[] {'a'};
            Console.WriteLine("Traversal for 'a': " + TraverseDFA(Input0, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input1 = new char[] {'b'};
            Console.WriteLine("Traversal for 'b': " + TraverseDFA(Input1, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input11 = new char[] {'c'};
            Console.WriteLine("Traversal for 'c': " + TraverseDFA(Input11, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input2 = new char[] {'a', 'b'};
            Console.WriteLine("Traversal for 'ab': " + TraverseDFA(Input2, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input3 = new char[] {'a', 'c'};
            Console.WriteLine("Traversal for 'ac': " + TraverseDFA(Input3, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input4 = new char[] {'a', 'c', 'a', 'b'};
            Console.WriteLine("Traversal for 'acab': " + TraverseDFA(Input4, transitionsx, accept_statesx, start_statex, statesx));
            char[] Input5 = new char[] {'a', 'c', 'a'};
            Console.WriteLine("Traversal for 'aca': " + TraverseDFA(Input5, transitionsx, accept_statesx, start_statex, statesx));
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");

            nfa.FromRegExp("ab");
            (char[] start_statey, char[] accept_statesy, char[] statesy, char[] alphabety, char[][] transitionsy) = dfa.FromNFA(nfa);
            accept_statesy = new char[]{'2', '3', '5', '6'};
            statesy = new char[] {'0', '1', '2', '3', '4', '5', '6'};
            start_statey = new char[]{'0'};
            alphabety = new char[]{'a', 'b','c'};
            char[] transition0y = new char[]{'0', 'c', '3'};
            char[] transition1y = new char[]{'0', 'a', '1'};
            char[] transition2y = new char[]{'1', 'b', '2'};
            char[] transition3y = new char[]{'3', 'c', '6'};
            char[] transition4y = new char[]{'3', 'a', '4'};
            char[] transition5y = new char[]{'2', 'a', '4'};
            char[] transition6y = new char[]{'4', 'b', '5'};
            char[] transition7y = new char[]{'5', 'a', '4'};
            char[] transition8y = new char[]{'5', 'c', '6'};
            char[] transition9y = new char[]{'2', 'c', '6'};
            char[] transition10y = new char[]{'6', 'a', '4'};
            char[] transition11y = new char[]{'6', 'c', '6'};
            transitions1 = new char[][]{transition0y, transition1y, transition2y, transition3y, transition4y, transition5y, transition6y, transition7y, transition8y, transition9y, transition10y, transition11y};

            Console.WriteLine("((ab)|(c))+");
            char[] Input00 = new char[] {'a'};
            Console.WriteLine("Traversal for 'a': " + TraverseDFA(Input00, transitionsy, accept_statesy, start_statey, statesy));
            char[] Input111 = new char[] {'d','f', 'a', 'g'};
            Console.WriteLine("Traversal for 'dfag': " + TraverseDFA(Input111, transitionsy, accept_statesy, start_statey, statesy));
            char[] Input222 = new char[] {'d','a', 'f', 'b'};
            Console.WriteLine("Traversal for 'dafb': " + TraverseDFA(Input222, transitionsy, accept_statesy, start_statey, statesy));

        }
    
        public bool TraverseDFA(char[] input, char[][] transitions, char[]accept_states, char[] start_state, char[] states){ //(ta input som en dfa består af)
            char currentState = start_state[0];
            bool transitionFound = false;
            char[] visited = new char[input.Length];
            int counter = 0; 
            int stopklods = input.Length; //makes sure that the function terminates
            for (int i = 0; i < input.Length; i++)
            {
                transitionFound = false;
                char symbolStr = input[i];
                for (int j = 0; j < transitions.Length; j ++)
                {
                    // Console.WriteLine(symbolStr);
                    transitionFound = false;
                    if (transitions[j][0] == currentState && transitions[j][1] == symbolStr && !visited.Contains(transitions[j][2]))
                    {
                        transitionFound = true;
                        currentState = transitions[j][2];
                        counter ++;
                        break;
                    }
                }
                // Console.WriteLine(symbolStr);
                // Console.WriteLine(currentState);
                // Console.WriteLine(transitionFound);
                //We want to terminate as soon as we encounter an acepting state
                if (accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
                    return true;
                }

                if (symbolStr == input[input.Length-1]){ //we have reached the last char of the string and should exit
                    Console.WriteLine(":)");
                    if (visited.Contains(currentState)){
                        Console.WriteLine(":(())");
                        return accept_states.Contains(currentState);
                    }
                }
                //not in accepting, so no check needed here
                if (transitionFound == true && input.Length == 1){ 
                    visited[i] = currentState;
                    i = 0;
                    counter = 0; //counter er lige meget her
                    currentState = start_state[0];
                }
                if (transitionFound == false){ //&& stopklods != counter) {//if the string does not follow the order of the dfa, we start over, to check the rest of the string
                    visited[i] = currentState;
                    // i --;
                    i = i-counter; //start fra næste char i string
                    currentState = start_state[0];
                }
                // Console.WriteLine(i);
            }
            return accept_states.Contains(currentState);
        }
    
    }
}