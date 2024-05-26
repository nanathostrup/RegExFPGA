using SME;

namespace sme_intro
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

        protected override void OnTick()
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

        public bool TraverseDFA()//(char[] input, char[][] transitions, char[] accept_states, char[] start_state, char[] states)
        {
            int inputLength = control.Length; //input.Length; //int control.int
            byte currentState = this.startState;
            int counter = 0;
            int transLength = transitions.Length/3;

            for (int start = 0; start < inputLength; start++)
            {
                currentState = this.startState;
                bool isAccepted = false;

                for (int i = start; i < inputLength; i++)
                {
                    bool transitionFound = false;
                    byte symbolStr = control.Array[i];
                    counter = 0;

                    for (int j = 0; j < transLength; j++)
                    {
                        if (this.transitions[(3 * j) + 0] == currentState && this.transitions[(3 * j ) + 1] == symbolStr)
                        {
                        // flattened array for transitions
                        // if (this.transitions[j][0] == currentState && this.transitions[j][1] == symbolStr)
                            transitionFound = true;
                            // currentState = this.transitions[j][2];
                            currentState = this.transitions[(3 * j) + 2];
                            //Ryk ud
                            //this.accept_states.Contains(currentState)
                            for (int h = 0; h < this.acceptStates.Length ; h++){ //return asap if found
                                if (currentState == this.acceptStates[h]){
                                    return true;
                                }
                            }
                            break;
                        }
                    }
                    counter ++;

                    for (int h = 0; h < this.acceptStates.Length; h++){ //return asap if found
                        if (currentState == this.acceptStates[h]){
                            return true;
                        }
                    }
                    if (!transitionFound)
                    {
                        i = i-counter;
                        break; // No valid transition, break out and try from the next start position
                    }
                }
            }
            for (int h = 0; h < this.acceptStates.Length; h++){ //return asap if found
                if (currentState == this.acceptStates[h]){
                    return true;
                }
            }
            return false; // If no path is accepted, return false
        }

        public void load(byte startState1, byte[] acceptStates1, byte[] states1, byte[] alphabet1, byte[] transitions1, byte[] states){
            this.startState = startState1;
            this.acceptStates = acceptStates1;
            this.transitions = transitions1;
            this.states = states1;
        }
    }
}