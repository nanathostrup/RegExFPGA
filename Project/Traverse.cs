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

        public char[][] transitions;
        public char[] acceptStates;
        public char[] startState;
        public char[] states;

        public Traverse(){
            //Giving the arrays a fixed size
            this.transitions = new char[1000][]; 
            this.acceptStates = new char[1000]; 
            this.startState = new char[1000];
            this.states = new char[1000]; 
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
            int inputLength = control.Length;//input.Length; //int control.int
            char currentState = this.startState[0];
            int counter = 0;
            for (int start = 0; start <= inputLength; start++)
            {
                currentState = this.startState[0];
                bool isAccepted = false;

                for (int i = start; i < inputLength; i++)
                {
                    bool transitionFound = false;
                    char symbolStr = control.Array[i];
                    counter = 0;

                    for (int j = 0; j < this.transitions.Length; j++)
                    {
                        if (this.transitions[j][0] == currentState && this.transitions[j][1] == symbolStr)
                        {
                            transitionFound = true;
                            currentState = this.transitions[j][2];
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
            // return accept_states.Contains(currentState); //RYK CONTAINS UD
        }

        public void load(char[] startState1, char[] acceptStates1, char[] states1, char[] alphabet1, char[][] transitions1, char[] states){
            this.startState = startState1;
            this.acceptStates = acceptStates1;
            this.transitions = transitions1;
            this.states = states1;
        }

    //   public bool TraverseDFA(char[] input, char[][] transitions, char[]accept_states, char[] start_state, char[] states){ //(ta input som en dfa består af)
    //         char currentState = start_state[0];
    //         bool transitionFound = false;
    //         char[] visited = new char[input.Length];
    //         int counter = 0; 
    //         int stopklods = input.Length; //makes sure that the function terminates
    //         for (int i = 0; i < input.Length; i++)
    //         {
    //             transitionFound = false;
    //             char symbolStr = input[i];
    //             for (int j = 0; j < transitions.Length; j ++)
    //             {
    //                 // Console.WriteLine(symbolStr);
    //                 transitionFound = false;
    //                 if (transitions[j][0] == currentState && transitions[j][1] == symbolStr && !visited.Contains(transitions[j][2]))
    //                 {
    //                     transitionFound = true;
    //                     currentState = transitions[j][2];
    //                     counter ++;
    //                     break;
    //                 }
    //             }
    //             //We want to terminate as soon as we encounter an acepting state
    //             if (accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
    //                 return true;
    //             }
    //             //not in accepting, so no check needed here
    //             if (transitionFound == true && input.Length == 1){ 
    //                 visited[i] = currentState;
    //                 i = 0;
    //                 counter = 0; //counter er lige meget her
    //                 currentState = start_state[0];
    //             }
    //             if (transitionFound == false){ //&& stopklods != counter) {//if the string does not follow the order of the dfa, we start over, to check the rest of the string
    //                 visited[i] = currentState;
    //                 i = i-counter; //start fra næste char i string
    //                 currentState = start_state[0];
    //             }
    //             // Console.WriteLine(i);
    //             if (symbolStr == input[input.Length-1]){ //we have reached the last char of the string and should exit
    //                 if (visited.Contains(currentState)){
    //                     return accept_states.Contains(currentState);
    //                 }
    //             }
    //         }
    //         return accept_states.Contains(currentState);
        // }
    }
}

//restart window cmd shift p, reload window