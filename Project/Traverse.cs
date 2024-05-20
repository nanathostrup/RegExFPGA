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

        private uint internal_count = 0;

        protected override void OnTick()
        {
            TraverseDFA();
            traversal.Count = 0;
            Console.WriteLine("traversal");
            // Traverse(dfa);
            //check om dfa er færdig? 
            //Check om bits er valid
            if (control.Reset)
            {
                internal_count = 0;
            }
            else if (control.Valid)//&& count.CompareCharacter == control.Character) //control.Char = the current char, count.Comp = the char to search for (initialized in tester)
            {
                TraverseDFA();
            }
            traversal.Count = internal_count;            
        }

        public bool TraverseDFA(){ //må gerne tage inputs - som Counter()
            Console.WriteLine("traverseDFA");
            return true;
        }
    //    public bool TraverseDFA(char[] input, char[][] transitions, char[]accept_states, char[] start_state){ //(ta input som en dfa består af)
    //         char currentState = start_state[0];
    //         bool transitionFound = false;
    //         // int stopklods = input.Length; //skal sættes ud
    //         int counter = 0; 
    //         for (int i = 0; i < input.Length; i++)
    //         // foreach (char symbol in input)
    //         {
    //             // Console.WriteLine("symbol: " + input[i]);
    //             transitionFound = false;
    //             char symbolStr = input[i];
    //             foreach (char[] transition in transitions)
    //             {
    //                 transitionFound = false;
    //                 if (transition[0] == currentState && transition[1] == symbolStr)
    //                 {
    //                     transitionFound = true;
    //                     currentState = transition[2];
    //                     counter ++;
    //                     break;
    //                 }
    //             }
    //             // Console.WriteLine("transitionFound: " + transitionFound);
    //             if (accept_states.Contains(currentState)){ //prevents the reset that comes later if we already have an accepting state. Test eg.'abaccaad' would not be accepted otherwise
    //                 return true;
    //             }
    //             if (transitionFound == false && currentState != start_state[0]){ //if the string does not follow the order of the dfa, we start over, to check the rest of the string
    //                 currentState = start_state[0];
    //                 i = i - counter; //look at the beginning minus one again
                    //traversal.Reset = true
    //             }
    //         }
    //         return accept_states.Contains(currentState);
    //     }
    }
}
//restart window cmd shift p, reload window