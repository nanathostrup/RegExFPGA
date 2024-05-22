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

        // private uint internal_count = 0;
        public char[] input;
        public char[][] transitions;
        public char[] accept_states;
        public char[] start_state;
        public char[] states;

        protected override void OnTick()
        {
            // Console.WriteLine("traversal");
            if (control.Reset)
            {
                traversal.Valid = false;
                // internal_count = 0;
            }
            else if (control.Valid)//&& count.CompareCharacter == control.Character) //control.Char = the current char, count.Comp = the char to search for (initialized in tester)
            {
                if(TraverseDFA(input, transitions, accept_states, start_state, states)){
                    // Console.WriteLine("true");
                    traversal.Valid = true;
                    // internal_count ++;
                    // Console.WriteLine("traversal.Count:" + traversal.Count);
                }
                else{
                    // Console.WriteLine("false");
                    traversal.Valid = false;
                    // Console.WriteLine("traversal.Count:" + traversal.Count);
                }
            }
            // internal_count ++;
            // traversal.Count = internal_count;
            // Console.WriteLine("traversal.Count:" + traversal.Count);
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
                //We want to terminate as soon as we encounter an acepting state
                if (accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
                    return true;
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
                    i = i-counter; //start fra næste char i string
                    currentState = start_state[0];
                }
                // Console.WriteLine(i);
                if (symbolStr == input[input.Length-1]){ //we have reached the last char of the string and should exit
                    if (visited.Contains(currentState)){
                        return accept_states.Contains(currentState);
                    }
                }
            }
            return accept_states.Contains(currentState);
        }
    }
}
//restart window cmd shift p, reload window