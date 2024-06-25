using SME;

namespace nfa_dfa
{
    [ClockedProcess]
    public class Traverse : SimpleProcess
    {
        [InputBus]
        public Control control;

        [OutputBus]
        public Traversal traversal = Scope.CreateBus<Traversal>();

        public byte[] transitions;
        public byte[] acceptStates;
        public byte startState;
        public byte[] states;

        public Traverse(){
            //Giving the arrays a fixed size
            this.transitions = new byte[1000]; 
            this.acceptStates = new byte[1000]; 
            this.startState = 0;
            this.states = new byte[1000]; 
        }

        protected override async void OnTick()
        {
            if (control.Reset)
            {
                traversal.Valid = false;
            }
            else if (control.Valid)
            {
                if(TraverseDFA()){
                    traversal.Valid = true;
                }
                else{
                    traversal.Valid = false;
                }
            }
        }

        public bool TraverseDFA()//(char[] input, char[][] transitions, char[] accept_states, char[] start_state, char[] states) //should not share resources
        {
            int inputLength = control.Length; //input.Length; 
            byte currentState = this.startState;
            int counter = 0;
            int transLength = transitions.Length/3;
            bool running_j = true;
            bool running_i = true;
            bool transitionFound = false;
            int i_offset = 0;

            for (int start = 0; start < control.Array.Length; start++){
                currentState = this.startState;

                //in place of break
                running_i = true;
                i_offset = 0;
                for (int i = 0; i < control.Array.Length; i++){
                    // if(running_i){
                        int this_i = i + i_offset;

                        if (running_i && this_i >= start && this_i < inputLength){
                            transitionFound = false;
                            byte symbolStr = control.Array[this_i];
                            counter = 0;
                            running_j = true;

                            for (int j = 0; j < control.Array.Length; j++){
                                
                                    //in place of break
                                    if(running_j && j < transLength){
                                        if (this.transitions[(3 * j) + 0] == currentState && this.transitions[(3 * j ) + 1] == symbolStr){
                                        //flattened array
                                        // if (this.transitions[j][0] == currentState && this.transitions[j][1] == symbolStr)
                                        // {
                                            transitionFound = true;
                                            // currentState = this.transitions[j][2];
                                            currentState = this.transitions[(3 * j) + 2];
                                            //this.accept_states.Contains(currentState)
                                            for (int h = 0; h < this.acceptStates.Length ; h++){ //return asap if found
                                                if (currentState == this.acceptStates[h]){
                                                    return true;
                                                }
                                            }
                                            running_j = false;
                                            // break;
                                    }
                                }
                            }
                        counter ++;

                        for (int h = 0; h < this.acceptStates.Length; h++){ //return asap if found
                            if (currentState == this.acceptStates[h]){
                                return true;
                            }
                        }
                        if (!transitionFound){
                            // i = i-counter;
                            running_i = false;
                            i_offset = i_offset - counter;
                            // break; // No valid transition, break out and try from the next start position
                        }
                    }
                }
            }
            for (int h = 0; h < this.acceptStates.Length; h++){ //return asap if found
                if (currentState == this.acceptStates[h]){
                    return true;
                }
            }
            return false; // If no path is accepted, return false
            // return accept_states.Contains(currentState); //RYK CONTAINS() UD
        }

        public void load(byte startState1, byte[] acceptStates1, byte[] states1, byte[] alphabet1, byte[] transitions1, byte[] states){
            this.startState = startState1;
            this.acceptStates = acceptStates1;
            this.transitions = transitions1;
            this.states = states1;
        }
    }
}
