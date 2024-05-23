using SME;

namespace sme_intro{
    public class DFA {
        // public List<List<string>> states;
        // public List<string> alphabet;
        // public List<List<string>> transitions;
        // public List<string> start_state;
        // public List<string> accept_states;

        public (byte,  byte[], byte[], byte[],  byte[][]) FromNFA(NFA nfa){
            // this.states = new List<List<string>>(); //Start state not added yet
            // this.accept_states = new List<string>();
            // this.alphabet = new List<string>();
            // this.transitions = new List<List<string>>();
            // this.start_state = new List<string>();
        
            List<List<string>> states = new List<List<string>>();
            List<string> alphabet = new List<string>();
            List<List<string>> transitions = new List<List<string>>();
            List<string> start_state = new List<string>();
            List<string> accept_states = new List<string>();

            int state_counter = 0; // to keep track of states and to name the states as well
            bool in_accepting = false; //if a state in nfa is accepting is encountered, then this is used
            List<string> newList = new List<string>();

            //Making the alphabet
            int i = 0;
            while(i < nfa.alphabet.Count) {
                if(nfa.alphabet[i] != "eps"){ // the same alphabet, but excluding 
                    alphabet.Add(nfa.alphabet[i]);
                }
                i ++;
            }
            
            //Epsilon closure for the startstate of nfa, initializing/starting the dfa
            newList.Add(nfa.states[0]);
            (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);

            //New state, transition, and accepting added to dfa
            string new_state = "s" + state_counter; //Naming the new state
            state_counter++;
            List<string> insert = new List<string>();
            insert.Add(string.Join(",", newList));
            insert.Add(new_state);
            states.Add(insert); //Adding both nfa states and the dfa state
            start_state.Add(new_state); //start state added
            //checking if there are any accepting nfa states
            if (in_accepting){
                accept_states.Add(new_state);
            }

            // Making a stack with the states to go through
            Stack<List<string>> stack = new Stack<List<string>>();
            foreach (var state in states){
                stack.Push(state);
            }
            
            while(stack.Count != 0){
            // foreach(var dfa_state in this.states){ //This will cast an exception since dfa.states is edited through out the loop. Stack instead
                var dfa_state = stack.Pop();
                if (dfa_state[0] != ""){
                    foreach(var symbol in alphabet){
                        newList = new List<string>(); // reset for new symbol
                        in_accepting = false; //reset for new symbol
                        // the move() function
                        foreach (var transition in nfa.transitions){
                            if (transition[0] == dfa_state[0] && transition[1] == symbol.ToString()){
                                newList.Add(transition[2]);
                            }
                        }
                        (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);
 

                        //Making a stack to loop over so the states and for loop combination is avoided
                        Stack<List<string>> stackInLoop = new Stack<List<string>>(); //since other states could be added later, this is done with every symbol
                        foreach (List<string> state in states){
                            foreach (List<string> stateForStack in states){
                                stackInLoop.Push(stateForStack);
                            }
                        }

                        if (newList.Any()){
                            string from_state = dfa_state[1];
                            string to_state = "";
                            string stringList = string.Join(",", newList);
                            var existingState = states.FirstOrDefault(s => s[0] == stringList);
                            if (existingState != null){
                                to_state = existingState[1];
                            } else {
                                new_state = "s" + state_counter;
                                state_counter++;
                                to_state = new_state;
                                List<string> newDFAState = new List<string> { stringList, new_state };
                                states.Add(newDFAState);
                                stack.Push(newDFAState);
                                if (in_accepting){
                                    accept_states.Add(new_state);
                                }
                            }
                            List<string> transition_entry = new List<string> { from_state, symbol, to_state };
                            transitions.Add(transition_entry);
                        }
                    }
                }
            }
            
            char[] transformedStart = transformStartState(start_state);
            byte byteStart = byteTransformStartState(transformedStart);
       
            char[] transformedAccept = transformAcceptStates(accept_states);
            byte[] byteAccept = byteTransformAccepStates(transformedAccept);
       
            char[] transformedStates = transformStates(states);
            byte[] byteStates = byteTransformStates(transformedStates);

            char[] transformedAlphabet = transformAlphabet(alphabet);
            byte[] byteAlphabet = byteTransformAlphabet(transformedAlphabet);

            char[][] transformedTrans = transformTransitions(transitions);
            byte[][] byteTransitions = byteTransformTransitions(transformedTrans);
            return (byteStart, byteAccept, byteStates, byteAlphabet, byteTransitions);
        }    

        private (List<string>, bool) EpsilonClosure(NFA nfa, List<string> newList, bool in_accepting){
            foreach (var state in newList){
                foreach (var transition in nfa.transitions){
                    if (transition[1] == "eps" && transition[0] == state && !newList.Contains(transition[2])){
                        newList.Add(transition[2]);
                    }
                }
                //if any state in nfa in this list is accepting then the dfa state should be accepting
                if (newList.Any(states => nfa.accept_states.Contains(state))){ //could be moved to another method
                    in_accepting = true;
                }
            }
            return (newList, in_accepting);
        }
        static char[] transformAlphabet(List<string> alphabet){
            char[] array = new char[alphabet.Count];
            for (int i = 0; i < alphabet.Count; i++){
                foreach (char chr in alphabet[i]){
                    array[i] = chr;
                }
            }
            return array;
        }
        static byte[] byteTransformAlphabet(char[] alphabet){
            byte[] array = new byte[alphabet.Length];
            for (int i = 0; i < alphabet.Length; i++){
                array[i] = (byte)alphabet[i];
            }
            return array; 
        }

        static char[] transformStartState(List<string> start_state){
            char[] array = new char[1];
            char save = 's';
            for (int i = 0; i < start_state.Count; i++){
                foreach (char chr in start_state[i]){
                    save = chr; //skal egentlig bare ha den sidste. vil ik ha 's' med i 's0'
                }
            } 
            array[0] = save;
            return array;
        }
        static byte byteTransformStartState(char[] start_state){
            byte[] array = new byte[1];
            char save = 's';
            for (int i = 0; i < start_state.Length; i++){
                save = start_state[i]; //skal egentlig bare ha den sidste. vil ik ha 's' med i 's0'
            } 
            return (byte)save;
            // array[0] = (byte)save;
            // return array;
        }

        static char[] transformAcceptStates(List<string> accept_states){
            char[] array = new char[accept_states.Count];
            char save = ' ';
            for (int i = 0; i < accept_states.Count; i++){
                foreach (char chr in accept_states[i]){
                    save = chr; //skal egentlig bare ha den sidste. vil ik ha 's' med i 's0'
                }
                array[i] = save;
            }
            return array;
        }
        static byte[] byteTransformAccepStates(char[] accept_states){
            byte[] array = new byte[accept_states.Length];
            char save = ' ';
            for (int i = 0; i < accept_states.Length; i++){
                array[i] = (byte)accept_states[i];
            }
            return array;
        }

        static char[] transformStates(List<List<string>> states){
            char[] array = new char[states.Count];
            for (int i = 0; i < states.Count; i++){
                string dfa = states[i][1];
                array[i] = dfa[dfa.Length - 1];
            }
            return array;
        }
        static byte[] byteTransformStates(char[] charArray){
            byte[] byteArray = new byte[charArray.Length];
            for (int i = 0; i < charArray.Length; i++){
                byteArray[i] = (byte)charArray[i]; // Convert each char to byte
            }
            return byteArray;
        }

        static char[][] transformTransitions(List<List<string>> transitions){
            char[][] transformedTransitions = new char[transitions.Count][];
            for (int i = 0; i < transitions.Count; i++){
                string to = transitions[i][0];
                char symbol = transitions[i][1][0];
                string from = transitions[i][2];

                // Remove 's' from 'to' and 'from'
                char toChar = to[to.Length - 1];
                char fromChar = from[from.Length - 1];

                transformedTransitions[i] = new char[] { toChar, symbol, fromChar };
            }
            return transformedTransitions;
        }
        static byte[][] byteTransformTransitions(char[][] charArray) {
            byte[][] byteArray = new byte[charArray.Length][];
            for (int i = 0; i < charArray.Length; i++) {
                byteArray[i] = new byte[charArray[i].Length];
                for (int j = 0; j < charArray[i].Length; j++) {
                    byteArray[i][j] = (byte)charArray[i][j]; // Convert each char to byte
                }
            }
            return byteArray;
        }
    }
}