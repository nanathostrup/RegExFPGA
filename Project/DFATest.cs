using SME;

namespace sme_intro{

    public class DFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            Console.WriteLine("DFA");
            
            //(start_state, accept_states, states, alphabet, transitions)

            NFA nfa = new NFA();
            DFA dfa = new DFA();
            string regExp = "(ab)";
            // nfa.FromRegExp("(ab)(cd)");
            nfa.FromRegExp(regExp);

            // nfa.states = new List<string> { "q0", "q1", "q2" };
            // nfa.alphabet = new List<string> { "a", "b" };
            // nfa.transitions = new List<List<string>>
            // {
            //     new List<string> { "q0", "a", "q1" },
            //     new List<string> { "q1", "b", "q2" }
            // };
            // nfa.start_state =  "q0";
            // nfa.accept_states = new List<string> { "q2" };
            
            // char[] start_state = new char[];
            // List<string> accept_states = new List<string>();
            // List<List<string>> states = new List<List<string>>();
            // List<string> alphabet = new List<string>();
            // List<List<string>> transitions = new List<List<string>>(); 

            (char[] start_state, char[] accept_states, char[] states, char[] alphabet, char[][] transitions)= dfa.FromNFA(nfa);

            //The regular expression:
            Console.WriteLine("RegExp:" + regExp);

            // //DFA States
            // string stateStr = "";
            // Console.Write("DFA States: ");
            // foreach (var state in states)
            // {
            //     stateStr = "[" + "[" + string.Join(", ", state[0]) + "] " + state[1] + "]"; // Format the state
            //     Console.Write(stateStr);
            // }
            // Console.Write("\n");

            // string alphabet1 = "";
            // foreach(string chr in alphabet){
            //     string str = chr.ToString();
            //     alphabet1 = alphabet1 + str + " ";
            // }
            // Console.WriteLine("DFA alphabet: " + alphabet1);

            // //DFA start state
            // string startState = "";
            // foreach (var state in start_state){
            //     startState = startState + state;
            // }
            // Console.WriteLine("DFA start state: " + startState);

            // //DFA accepting states:
            // string acceptingd = "";
            // foreach (string accept in accept_states){
            //     acceptingd = acceptingd + accept + " ";
            // }
            // Console.WriteLine("DFA accepting states: " + acceptingd);

            // //DFA transitions:
            // string transition2 = "";
            // string transitions2 = "";
            // foreach(List<string> trans in transitions ){
            //     transitions2 = transitions2 + "[";
            //     foreach(string str in trans){
            //         transition2 = transition2 + str + " ";
            //     }
            //     transitions2 = transitions2 + " " + transition2 + "]";
            //     transition2 = "";
            // }
            // Console.WriteLine("DFA transitions:" + transitions2);

//EFTER "TRANSFORMATION"
                //Ryk til DFA
                //lav det til noget der kan læses i hardware her
                // char[] dfaAlphabet = transformAlphabet(dfa.alphabet);
                // for (int i = 0; i < dfaAlphabet.Length; i++){
                //     Console.WriteLine(dfaAlphabet[i]);
                // }
                // char[] dfaStartState = transformStartState(dfa.start_state);
                // for (int i = 0; i < dfaStartState.Length; i++){
                //     Console.WriteLine(dfaStartState[i]);
                // }
                // char[] dfaAcceptStates = transformAcceptStates(dfa.accept_states);
                // for (int i = 0; i < dfaAcceptStates.Length; i++){
                //     Console.WriteLine(dfaAcceptStates[i]);
                // }
                // char[] dfaStates = transformStates(dfa.states);
                // for (int i = 0; i < dfaStates.Length; i++){
                //     Console.WriteLine(dfaStates[i]);
                // }
                // char[][] dfaTransitions = transformTransitions(dfa.transitions);
                // foreach (char[] transition in dfaTransitions){
                //     Console.Write("[");
                //     for (int i = 0; i < transition.Length; i++)
                //     {
                //         Console.Write(transition[i]);
                //         if (i < transition.Length - 1)
                //         {
                //             Console.Write(", ");
                //         }
                //     }
                //     Console.WriteLine("]");
                // }

            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~");
            char[] input0 = new char[] {'a'}; //single char fra regex dur ikke
            Console.WriteLine("Traversal for 'a': " + TraverseDFA(input0, transitions, accept_states, start_state));
            char[] input1 = new char[] {'b'}; //single char fra regex dur ikke
            Console.WriteLine("Traversal for 'b': " + TraverseDFA(input1, transitions, accept_states, start_state));
            char[] input2 = new char[] {'a' , 'a'}; //nej
            Console.WriteLine("Traversal for 'aa': " + TraverseDFA(input2, transitions, accept_states, start_state));
            char[] input3 = new char[] {'a' , 'a', 'b'};//starter først efter en char
            Console.WriteLine("Traversal for 'aab': " + TraverseDFA(input3, transitions, accept_states, start_state));
            char[] input4 = new char[] {'a' , 'b' , 'a'}; //starter først og så ekstra char efter
            Console.WriteLine("Traversal for 'aba': " + TraverseDFA(input4, transitions, accept_states, start_state));
            char[] input5 = new char[] {'b' , 'a' , 'a'}; //same characters men ikke rækkefølge
            Console.WriteLine("Traversal for 'baa': " + TraverseDFA(input5, transitions, accept_states, start_state));
            char[] input6 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a'}; //mange ting efter en accept
            Console.WriteLine("Traversal for 'abaccaa': " + TraverseDFA(input6, transitions, accept_states, start_state));
            char[] input7 = new char[] {'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'abaccaad': " +  TraverseDFA(input7, transitions, accept_states, start_state));
            char[] input8 = new char[] {'d' , 'a' , 'b' , 'a' , 'c', 'c', 'a', 'a', 'd'}; // starter med noget uden for alphabet. Burde ikke ha indflydelse overhoved men ah well
            Console.WriteLine("Traversal for 'dabaccaad': " + TraverseDFA(input8, transitions, accept_states, start_state));
            
        // }
        // public bool TraverseDFA(string input, DFA dfa){ (ta input som en dfa består af)
        //     string currentState = dfa.start_state[0];
        //     bool transitionFound = false;
        //     // int stopklods = input.Length;
        //     int counter = 0; 
        //     for (int i = 0; i < input.Length; i++)
        //     // foreach (char symbol in input)
        //     {
        //         // Console.WriteLine("symbol: " + input[i]);
        //         transitionFound = false;
        //         string symbolStr = input[i].ToString();
        //         foreach (var transition in dfa.transitions)
        //         {
        //             transitionFound = false;
        //             if (transition[0] == currentState && transition[1] == symbolStr)
        //             {
        //                 transitionFound = true;
        //                 currentState = transition[2];
        //                 counter ++;
        //                 break;
        //             }
        //         }
        //         // Console.WriteLine("transitionFound: " + transitionFound);
        //         if (dfa.accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
        //             return true;
        //         }
        //         if (transitionFound == false && currentState != dfa.start_state[0]){ //if the string does not follow the order of the dfa, we start over, to check the rest of the string
        //             currentState = dfa.start_state[0];
        //             i = i - counter; //look at the beginning minus one again
        //         }
        //     }
        //     return dfa.accept_states.Contains(currentState);        
        }
    
        public bool TraverseDFA(char[] input, char[][] transitions, char[]accept_states, char[] start_state){ //(ta input som en dfa består af)
            char currentState = start_state[0];
            bool transitionFound = false;
            // int stopklods = input.Length;
            int counter = 0; 
            for (int i = 0; i < input.Length; i++)
            // foreach (char symbol in input)
            {
                // Console.WriteLine("symbol: " + input[i]);
                transitionFound = false;
                char symbolStr = input[i];
                foreach (char[] transition in transitions)
                {
                    transitionFound = false;
                    if (transition[0] == currentState && transition[1] == symbolStr)
                    {
                        transitionFound = true;
                        currentState = transition[2];
                        counter ++;
                        break;
                    }
                }
                // Console.WriteLine("transitionFound: " + transitionFound);
                if (accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
                    return true;
                }
                if (transitionFound == false && currentState != start_state[0]){ //if the string does not follow the order of the dfa, we start over, to check the rest of the string
                    currentState = start_state[0];
                    i = i - counter; //look at the beginning minus one again
                }
            }
            return accept_states.Contains(currentState);
        }
        
    
    }
}