using SME;

namespace sme_intro{

    // [ClockedProcess]
    public class DFA{ //: SimpleProcess
    // {
    //     [InputBus]
    //     public Control control;

    //     [OutputBus]
    //     public Count count = Scope.CreateBus<Count>();
        public List<List<string>> states {get; set;}
        // public List<string> alphabet;
        public HashSet<char> alphabet {get; set;} //Maybe a list instead?
        public List<List<string>> transitions;
        public List<string> start_state;
        public List<string> accept_states;

        public void FromNFA(NFA nfa){
            this.states = new List<List<string>>(); //Start state not added yet
            this.accept_states = new List<string>();
            this.alphabet = nfa.alphabet; // Initialize the alphabet
            // HashSet<char> alphabet = new HashSet<char>(nfa.alphabet.Where(c => c != 'eps'));
            // var alphabet = nfa.Alphabet.Except(new HashSet<char> { 'eps' }).ToHashSet();
            // nfa.alphabet.ExceptWith(new HashSet<char> { 'eps' });
            // this.alphabet = new HashSet<char>(nfa.alphabet.Replace("eps", "")); //the same but no eps
            this.transitions = new List<List<string>>();
            this.start_state = new List<string>();

            int state_counter = 0;
            bool in_accepting = false;
            List<string> newList = new List<string>();

            // foreach (char symbol in nfa.Alphabet)
            //     {
            //         if (symbol != 'eps') // Exclude "eps"
            //         {
            //             alphabet.Add(symbol);
            //         }
            //     }

            newList.Add(nfa.states[0]);
            //call epsilonclosure for newlist her
            (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);

            string new_state = "s" + state_counter;
            state_counter++;
            List<string> insert = new List<string>();
            insert.Add(string.Join(",", newList));
            insert.Add(new_state);
            this.states.Add(insert);
            this.start_state.Add(new_state);
            
            if (in_accepting){
                accept_states.Add(new_state);
            }

            // Making a stack with the states
            Stack<List<string>> stack = new Stack<List<string>>();
            foreach (var state in this.states){
                stack.Push(state);
            }
            
            while(stack.Count != 0){
            // foreach(var dfa_state in this.states){ //laver rav i den, stack der kan tages fra er meget bedre
                var dfa_state = stack.Pop();
                if (dfa_state[0] != ""){
                    foreach(var symbol in this.alphabet){
                        newList = new List<string>();
                        in_accepting = false;
                        foreach (var transition in nfa.transitions){
                            if (transition[0] == dfa_state[0] && transition[1] == symbol.ToString()){
                                newList.Add(transition[2]);
                            }
                        }
                        (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);

                        //Making a stack to loop over
                        Stack<List<string>> stackInLoop = new Stack<List<string>>();
                        foreach (List<string> state in this.states){
                            foreach (List<string> stateForStack in this.states){
                                stackInLoop.Push(stateForStack);
                            }
                        }

                        if (newList.Any()){
                            List<string> transition_entry = new List<string>();
                            string from_state = "";
                            string to_state = "";

                            while (stackInLoop.Count != 0){
                                var state = stackInLoop.Pop();
                                string stringList = string.Join(",", newList);
                                if(stringList == state[0]){
                                    transition_entry = new List<string>();
                                    to_state = state[1];
                                }
                                if(dfa_state[0] == state[0]){
                                    from_state = state[1];
                                }
                                if (to_state == ""){
                                    new_state = "s" + state_counter;
                                    state_counter++;
                                    to_state = new_state;
                                    List<string> insertion = new List<string>();
                                    insertion.Add(string.Join(",", newList));
                                    insertion.Add(new_state);
                                    this.states.Add(insertion);
                                    stack.Push(insertion); //update the stack with the new state so the outer loop can function properly
                                    if (in_accepting){
                                        accept_states.Add(new_state);
                                    } 
                                    
                                }
                            }
                            transition_entry.Add(from_state);
                            transition_entry.Add(symbol.ToString());
                            transition_entry.Add(to_state);
                            this.transitions.Add(transition_entry);
                        }
                    }
                }
            }
        }

        private (List<string>, bool) EpsilonClosure(NFA nfa, List<string> newList, bool in_accepting){
            foreach (var state in newList){
                foreach (var transition in nfa.transitions){
                    if (transition[1] == "eps" && transition[0] == state && !newList.Contains(transition[2])){
                        newList.Add(transition[2]);
                    }
                }
                if (newList.Any(states => nfa.accept_states.Contains(state))){
                    in_accepting = true;
                }
            }
            return (newList, in_accepting);
        }

    }
}