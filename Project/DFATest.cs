using SME;

namespace nfa_dfa{

    public class DFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            Console.WriteLine("Test for DFAs");
            
            NFA nfa = new NFA();
            DFA dfa = new DFA();
            // string regexp = "a";
            // string regexp = "abc";
            // string regexp = "an example string";
            // string regexp = "(ab)";
            // string regexp = "(ab)(cd)";
            // string regexp = "((ab)(cd))";
            // string regexp = "abc (a)(b)";
            // string regexp = "ab c (a) d ( b )";
            // string regexp = "(a(b))";
            // string regexp ="(a(a(a(a(a(a))))))";
            // string regexp = "(ab)(cd"; //Error
            // string regexp = "(ab"; //Error 
            // string regexp = "ab)"; //Error
            // string regexp = "(a(ab)"; //Error
            // string regexp = "(((aaa"; //Error
            // string regexp = "a+";
            // string regexp = "(a+b)(bc)";
            // string regexp = "((ab))+";
            // string regexp = "((a+b)(cd)+)";
            string regexp = "((a+b)(cd))+";



            nfa.FromRegExp(regexp);
            (byte start_state, byte[] accept_states, byte[] states, byte[] alphabet, byte[] transitions)= dfa.FromNFA(nfa);

            //The regular expression:
            Console.WriteLine("RegExp:" + regexp);

            //DFA States
            Console.Write("DFA States: ");
            foreach (char state in states)
            {
                Console.Write(state + " ");
            }
            Console.Write("\n");

            //DFA Alphabet
            Console.Write("DFA alphabet: ");
            foreach(byte chr in alphabet){
                Console.Write((char) chr + " ");
            }
            Console.Write("\n");

            //DFA start state
            Console.WriteLine("DFA start state: " + (char)start_state);

            //DFA accepting states
            Console.Write("DFA accepting states: ");
            foreach (byte accept in accept_states){
               Console.Write((char)accept + " ");
            }
            Console.Write("\n");

            //DFA transition states
            string str = "[";
            for (int i = 0; i < transitions.Length; i++){
                str = str + (char)transitions[i] + " ";
            }
            str = str + "]";
            Console.WriteLine(str);
          
            // Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            // Console.WriteLine("regExp: " + regExp);
            // byte[] input0 = new byte[] {(byte)'a'}; //single char fra regex dur ikke
            // Console.WriteLine("Traversal for 'a': " + TraverseDFA(input0, transitions, accept_states, start_state, states));
            // byte[] input1 = new byte[] {(byte)'b'}; //single char fra regex dur ikke
            // Console.WriteLine("Traversal for 'b': " + TraverseDFA(input1, transitions, accept_states, start_state, states));
            // byte[] input2 = new byte[] {(byte)'a' , (byte)'a'}; //nej
            // Console.WriteLine("Traversal for 'aa': " + TraverseDFA(input2, transitions, accept_states, start_state, states));
            //  byte[] input34 = new byte[] {(byte)'a' , (byte)'b'};//starter først efter en char
            // Console.WriteLine("Traversal for 'ab': " + TraverseDFA(input34, transitions, accept_states, start_state, states));
            // byte[] input3 = new byte[] {(byte)'a' , (byte)'a', (byte)'b'};//starter først efter en char
            // Console.WriteLine("Traversal for 'aab': " + TraverseDFA(input3, transitions, accept_states, start_state, states));
            // byte[] input4 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a'}; //starter først og så ekstra char efter
            // Console.WriteLine("Traversal for 'aba': " + TraverseDFA(input4, transitions, accept_states, start_state, states));
            // byte[] input5 = new byte[] {(byte)'b' , (byte)'a' , (byte)'a'}; //same characters men ikke rækkefølge
            // Console.WriteLine("Traversal for 'baa': " + TraverseDFA(input5, transitions, accept_states, start_state, states));
            // byte[] input6 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a'}; //mange ting efter en accept
            // Console.WriteLine("Traversal for 'abaccaa': " + TraverseDFA(input6, transitions, accept_states, start_state, states));
            // byte[] input7 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a', (byte)'d'}; // noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            // Console.WriteLine("Traversal for 'abaccaad': " +  TraverseDFA(input7, transitions, accept_states, start_state, states));
            // byte[] input8 = new byte[] {(byte)'d' , (byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a', (byte)'d'}; // starter med noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            // Console.WriteLine("Traversal for 'dabaccaad': " + TraverseDFA(input8, transitions, accept_states, start_state, states));
 
            // Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            // string regexp1 = "((ab)|(a))?";
            // nfa.FromRegExp(regexp1);
            // (byte start_state1, byte[] accept_states1, byte[] states1, byte[] alphabet1, byte[] transitions1) = dfa.FromNFA(nfa);
            // accept_states1 = new byte[]{(byte)'3', (byte)'0', (byte)'2'};
            // states1 = new byte[] {(byte)'0', (byte)'1', (byte)'2', (byte)'3'};
            // start_state1 = (byte)'0';
            // alphabet1 = new byte[]{(byte)'a', (byte)'b', (byte)'c'};
            // transitions1 = new byte[]{(byte)'0', (byte)'a', (byte)'1', (byte)'0', (byte)'a', (byte)'3', (byte)'1', (byte)'b', (byte)'2'};
            // // byte[] insert0 = new byte[]{(byte)'0', (byte)'a', (byte)'3'};
            // // byte[] insert1 = new byte[]{(byte)'1', (byte)'b', (byte)'2'};
            // // transitions1 = new byte[]{insert2};

            // Console.WriteLine("regExp: " + regexp1);
            // byte[] input00 = new byte[] {(byte)'a'};
            // Console.WriteLine("Traversal for 'a': " + TraverseDFA(input00, transitions1, accept_states1, start_state1, states1));
            // byte[] input11 = new byte[] {(byte)'b'}; //single char fra regex dur ikke
            // Console.WriteLine("Traversal for 'b': " + TraverseDFA(input11, transitions1, accept_states1, start_state1, states1));
            // byte[] input22 = new byte[] {(byte)'a' , (byte)'a'}; //nej
            // Console.WriteLine("Traversal for 'aa': " + TraverseDFA(input22, transitions1, accept_states1, start_state1, states1));
            // byte[] input33 = new byte[] {(byte)'a' , (byte)'a', (byte)'b'};//starter først efter en char
            // Console.WriteLine("Traversal for 'aab': " + TraverseDFA(input33, transitions1, accept_states1, start_state1, states1));
            // byte[] input44 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a'}; //starter først og så ekstra char efter
            // Console.WriteLine("Traversal for 'aba': " + TraverseDFA(input44, transitions1, accept_states1, start_state1, states1));
            // byte[] input55 = new byte[] {(byte)'b' , (byte)'a' , (byte)'a'}; //same characters men ikke rækkefølge
            // Console.WriteLine("Traversal for 'baa': " + TraverseDFA(input55, transitions1, accept_states1, start_state1, states1));
            // byte[] input66 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a'}; //mange ting efter en accept
            // Console.WriteLine("Traversal for 'abaccaa': " + TraverseDFA(input66, transitions1, accept_states1, start_state1, states1));
            // byte[] input77 = new byte[] {(byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a', (byte)'d'}; // noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            // Console.WriteLine("Traversal for 'abaccaad': " +  TraverseDFA(input77, transitions1, accept_states1, start_state1, states1));
            // byte[] input88 = new byte[] {(byte)'d' , (byte)'a' , (byte)'b' , (byte)'a' , (byte)'c', (byte)'c', (byte)'a', (byte)'a', (byte)'d'}; // starter med noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            // Console.WriteLine("Traversal for 'dabaccaad': " + TraverseDFA(input88, transitions1, accept_states1, start_state1, states1));
            // Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            
            // nfa.FromRegExp("((ab)|(c))");
            // (byte start_statex, byte[] accept_statesx, byte[] statesx, byte[] alphabetx, byte[] transitionsx) = dfa.FromNFA(nfa);
            // accept_statesx = new byte[]{(byte)'3', (byte)'2'};
            // statesx = new byte[] {(byte)'0', (byte)'1', (byte)'2', (byte)'3'};
            // start_statex = (byte)'0';
            // alphabetx = new byte[]{(byte)'a', (byte)'b', (byte)'c'};
            // // byte[] insert0x = new byte[]{(byte)'0', (byte)'a', (byte)'1'};
            // // byte[] insert2x = new byte[]{(byte)'1', (byte)'b', (byte)'2'};
            // // byte[] insert1x = new byte[]{(byte)'0', (byte)'c', (byte)'3'};
            // // // transitionsx = new byte[][]{insert0x, insert1x, insert2x};
            // transitionsx = new byte[]{(byte)'0', (byte)'a', (byte)'1', (byte)'1', (byte)'b', (byte)'2', (byte)'0', (byte)'c', (byte)'3'};

            // Console.WriteLine("((ab)|(c))");
            // byte[] Input0 = new byte[] {(byte)'a'};
            // Console.WriteLine("Traversal for 'a': " + TraverseDFA(Input0, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input1 = new byte[] {(byte)'b'};
            // Console.WriteLine("Traversal for 'b': " + TraverseDFA(Input1, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input11 = new byte[] {(byte)'c'};
            // Console.WriteLine("Traversal for 'c': " + TraverseDFA(Input11, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input2 = new byte[] {(byte)'a', (byte)'b'};
            // Console.WriteLine("Traversal for 'ab': " + TraverseDFA(Input2, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input3 = new byte[] {(byte)'a', (byte)'c'};
            // Console.WriteLine("Traversal for 'ac': " + TraverseDFA(Input3, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input4 = new byte[] {(byte)'a', (byte)'c', (byte)'a', (byte)'b'};
            // Console.WriteLine("Traversal for 'acab': " + TraverseDFA(Input4, transitionsx, accept_statesx, start_statex, statesx));
            // byte[] Input5 = new byte[] {(byte)'a', (byte)'c', (byte)'a'};
            // Console.WriteLine("Traversal for 'aca': " + TraverseDFA(Input5, transitionsx, accept_statesx, start_statex, statesx));
            // Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");

            // nfa.FromRegExp("ab");
            // (byte start_statey, byte[] accept_statesy, byte[] statesy, byte[] alphabety, byte[] transitionsy) = dfa.FromNFA(nfa);
            // accept_statesy = new byte[]{(byte)'2', (byte)'3', (byte)'5', (byte)'6'};
            // statesy = new byte[] {(byte)'0', (byte)'1', (byte)'2', (byte)'3', (byte)'4', (byte)'5', (byte)'6'};
            // start_statey = (byte)'0';
            // alphabety = new byte[]{(byte)'a', (byte)'b', (byte)'c'};
            // byte[] transition0y = new byte[]{(byte)'0', (byte)'c', (byte)'3'};
            // byte[] transition1y = new byte[]{(byte)'0', (byte)'a',  (byte)'1'};
            // byte[] transition2y = new byte[]{(byte)'1', (byte)'b',  (byte)'2'};
            // byte[] transition3y = new byte[]{(byte)'3', (byte)'c',  (byte)'6'};
            // byte[] transition4y = new byte[]{(byte)'3', (byte)'a',  (byte)'4'};
            // byte[] transition5y = new byte[]{(byte)'2', (byte)'a',  (byte)'4'};
            // byte[] transition6y = new byte[]{(byte)'4', (byte)'b',  (byte)'5'};
            // byte[] transition7y = new byte[]{(byte)'5', (byte)'a',  (byte)'4'};
            // byte[] transition8y = new byte[]{(byte)'5', (byte)'c',  (byte)'6'};
            // byte[] transition9y = new byte[]{(byte)'2', (byte)'c',  (byte)'6'};
            // byte[] transition10y = new byte[]{(byte)'6', (byte)'a', (byte)'4'};
            // byte[] transition11y = new byte[]{(byte)'6', (byte)'c', (byte)'6'};
            // // transitionsy = new byte[][]{transition0y, transition1y, transition2y, transition3y, transition4y, transition5y, transition6y, transition7y, transition8y, transition9y, transition10y, transition11y};
            // transitionsy = new byte[]{(byte)'0', (byte)'c', (byte)'3', (byte)'0', (byte)'a',  (byte)'1', (byte)'1', (byte)'b',  (byte)'2',(byte)'3', (byte)'c',  (byte)'6', (byte)'3', (byte)'a',  (byte)'4', (byte)'2', (byte)'a',  (byte)'4', (byte)'4', (byte)'b',  (byte)'5', (byte)'5', (byte)'a',  (byte)'4', (byte)'5', (byte)'c',  (byte)'6', (byte)'2', (byte)'c',  (byte)'6', (byte)'6', (byte)'a', (byte)'4', (byte)'6', (byte)'c', (byte)'6'};
            // Console.WriteLine("((ab)|(c))+");
            // byte[] Input00 = new byte[] {(byte)'a'};
            // Console.WriteLine("Traversal for 'a': " + TraverseDFA(Input00, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input001 = new byte[] {(byte)'c'};
            // Console.WriteLine("Traversal for 'c': " + TraverseDFA(Input001, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input002 = new byte[] {(byte)'a', (byte)'b'};
            // Console.WriteLine("Traversal for 'ab': " + TraverseDFA(Input002, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input111 = new byte[] {(byte)'d',(byte)'f', (byte)'a', (byte)'g'};
            // Console.WriteLine("Traversal for 'dfag': " + TraverseDFA(Input111, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input222 = new byte[] {(byte)'d', (byte)'a', (byte)'f', (byte)'b'};
            // Console.WriteLine("Traversal for 'dafb': " + TraverseDFA(Input222, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input333 = new byte[] {(byte)'d', (byte)'a', (byte)'f', (byte)'b', (byte)'g', (byte)'c'};
            // Console.WriteLine("Traversal for 'dafbgc': " + TraverseDFA(Input333, transitionsy, accept_statesy, start_statey, statesy));
            // byte[] Input004 = new byte[] {(byte)'d', (byte)'a', (byte)'f', (byte)'b', (byte)'g', (byte)'a', (byte)'b'};
            // Console.WriteLine("Traversal for 'dafbgab': " + TraverseDFA(Input004, transitionsy, accept_statesy, start_statey, statesy));


            //TIMING TEST --- RYK DEN
            // var watch = new System.Diagnostics.Stopwatch();
            // watch.Start();
            
            // var tests = new string[]{"a", "b", "ab", "c", "ac", "bb", "aa", "kh", "f", "cccccbab", "khab", "abkh", "khabdf", "dfag", "dfbg", "dafb" , "dafbgc", "dafbdab"};
            // foreach (var test in tests)
            // {
            //     char[] array = test.ToCharArray(); //skal på bus
            //     //for løkker der loader test ind i control.array som bytes
            //     byte[] Array = new byte[test.Length];
            //     for (int j = 0; j < test.Length; j++){
            //         Array[j] = (byte)array[j];
            //     }
            //     TraverseDFA(Array, transitions1, accept_states1, start_state1, states1);
            // }

            // watch.Stop();
            // Console.WriteLine($"Execution Time: {watch.ElapsedMilliseconds} ms");


        }
         public bool TraverseDFA(byte[] input, byte[] transitions, byte[] accept_states, byte start_state, byte[] states)
        {
            int inputLength = input.Length;
            byte currentState = start_state;
            int counter = 0;
            int transLength = transitions.Length/3;

            for (int start = 0; start <= inputLength; start++)
            {
                currentState = start_state;
                bool isAccepted = false;

                for (int i = start; i < inputLength; i++)
                {
                    bool transitionFound = false;
                    byte symbolStr = input[i];
                    counter = 0;

                    for (int j = 0; j < transLength; j++)
                    {
                        if (transitions[(3 * j) + 0] == currentState && transitions[(3 * j ) + 1] == symbolStr)
                        {
                            transitionFound = true;
                            currentState = transitions[(3 * j) + 2];
                            if (accept_states.Contains(currentState)){
                                return true;
                            }
                            break;
                        }
                    }
                    counter ++;

                    if (accept_states.Contains(currentState))
                    {
                        return true;
                        // isAccepted = true; // Mark as accepted if an accepting state is reached
                    }
                    if (!transitionFound)
                    {
                        i = i-counter;
                        break; // No valid transition, break out and try from the next start position
                    }
                }

            }
            return accept_states.Contains(currentState); // If no path is accepted, return false
        }
    }
}