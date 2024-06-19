using SME;

namespace sme_intro{

    public class NFA
    {
        public List<string> states;
        public List<string> alphabet;
        public List<List<string>> transitions;
        public string start_state;
        public List<string> accept_states;
        public void init(){
            ;
        }
        public void FromRegExp(string regexp){
            this.states = new List<string>();
            this.transitions = new  List<List<string>>();
            this.accept_states = new List<string>();
            this.start_state = "q0"; 
            this.alphabet = new List<string>();
            this.states.Add(this.start_state);

            for (int i = 0; i < regexp.Length; i++){
                //extend if operators are added
                if ((regexp[i] != '(') && (regexp[i] != ')') && (regexp[i] != ' ') && (regexp[i] != '+')){ //no spaces or () in alphabet
                    if (!this.alphabet.Contains(regexp[i].ToString())){ //avoid adding the same characters twice
                        this.alphabet.Add(regexp[i].ToString());
                    }
                }
            }
            // int state_counter = 1;
            this.ConstructNFA(regexp);//, state_counter);
        }

        private void ConstructNFA(string regexp){//, int state_counter) { //string start_state, List<string> accept_states, List<string> states, HashSet<char> alphanet, List<List<string>> transitions){
            int state_counter = 1; //used to name the states 'qn', and a counter later on
            string current_state = this.start_state;
            List<List<string>> groups = Grouping(regexp); //divide into groups
            string new_state = "";

            for (int i = 0; i < groups.Count; i++)
            // foreach (List<string> group in groups) 
            {
                // for (int j = 0; j < groups[i].Count; j ++ ){
                //     Console.WriteLine("group[j]:" + groups[i][j]);
                // }
                // if (!(i == groups.Count)){
                //     Console.WriteLine("i:" + i);
                //     Console.WriteLine("groups.Count" + groups.Count);
                //     // Console.WriteLine("groups[i+1]" + groups[i]);
                //     Console.WriteLine("groups i,0 :" + (groups[i][0]));
                // }
                // if (i == groups.Count){
                //     Console.WriteLine(":)");
                // }
                    // if (IsOperator((char)groups[i+1][0])){
                    //     Console.WriteLine(".");
                    // }
                (new_state, state_counter) = ProcessGroup(groups[i], current_state, state_counter);
                current_state = new_state;
            }
            this.accept_states.Add(current_state);
        }

        private (string, int) ProcessGroup(List<string> group , string current_state, int state_counter){
            string new_state = current_state; // Initialize the new state with the current state
            // int length = group.Count;
            // for(int i = 0; i < group.Length; i++){
            Console.WriteLine("enter ProcessGroup");
            Console.WriteLine("group.Count: " + group.Count);
            foreach (string strr in group){
                //Groups er list list string. Should just be a list string instead to avoid this loop
                for (int i = 0; i < strr.Length; i++){
                    Console.WriteLine( "char: " + strr[i]);
                    Console.WriteLine("state_counter" + state_counter);
                    if (IsOperator(strr[i])){
                        Console.WriteLine("operator");
                        switch (strr[i]){
                            case '+':
                                Console.WriteLine("switch on +");
                                Console.WriteLine("STATE COUNTER: "+ state_counter);
                                (current_state, state_counter) = PlusOperatorLogic(group[i-1], current_state, state_counter); //SKAL VÆRE PREVIOUS CHAR
                                // pass along to operator method here
                                break;
                            default:
                                break;
                            }
                        //pass group to operator logic here
                    }
                // foreach (char chr in strr){
                //     Console.WriteLine( "char: " + chr);
                //     Console.WriteLine("state_counter" + state_counter);
                //     if (IsOperator(chr)){
                //         Console.WriteLine("operator");
                //         switch (chr){
                //             case '+':
                //                 Console.WriteLine("switch on +");
                //                 Console.WriteLine("STATE COUNTER: "+ state_counter);
                //                 (current_state, state_counter) = PlusOperatorLogic(chr, current_state, state_counter); //SKAL VÆRE PREVIOUS CHAR
                //                 // pass along to operator method here
                //                 break;
                //             default:
                //                 break;
                //             }
                //         //pass group to operator logic here
                //     }
                    else{
                        (current_state, state_counter) = NonOperatorLogic(strr[i], current_state, state_counter);
                        //pass group to non operator logic
                    }
                }
            }
            return (new_state, state_counter);  // State counter is also returned so it is not overwritten in construct_nfa
        }
        private (string, int) NonOperatorLogic(char chr, string current_state, int state_counter){
            string new_state = current_state;
            if (this.alphabet.Contains(chr.ToString())){ 
                new_state = "q" + state_counter;  // Naming new state
                string str = chr.ToString();
                List<string> to_insert = new List<string> { current_state, str, new_state };
                this.transitions.Add(to_insert);  // Add transition in list of list of strings
                this.states.Add(new_state);  // Add new state to states
                current_state = new_state;  // Update current state
                state_counter++;  // Increment state counter
            }
            return (current_state, state_counter);
        }
        private (string, int) PlusOperatorLogic(char chr, string current_state, int state_counter){
            Console.WriteLine("plus operator method");
            if (!this.alphabet.Contains("eps")){ //to avoid adding it several times
                this.alphabet.Add("eps");        //alphabet now contains epsilon
            }
            
            //"init" kinda
            string new_state = current_state;
            string plus_start_state = new_state; //For the last branching part
            string str = chr.ToString();

            //first epsilon transition
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert = new List<string> { current_state, "eps", new_state };
            this.transitions.Add(to_insert);  // Add transition in list of list of strings
            this.states.Add(new_state);  // Add new state to states
            current_state = new_state;  // Update current state
            state_counter++;
            
            //char transition
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert1 = new List<string> { current_state, str, new_state };
            this.transitions.Add(to_insert1);  // Add transition in list of list of strings
            this.states.Add(new_state);  // Add new state to states
            //There is a loop so the new_state and current_state are not updated here

            //second epsilon transition - making a loop
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert2 = new List<string> { new_state, "eps", current_state };
            this.transitions.Add(to_insert2);  // Add transition in list of list of strings
            this.states.Add(new_state);  // Add new state to states
            current_state = new_state;  // Update current state
            state_counter++;

            //third epsilon closure
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert3 = new List<string> { current_state, "eps", new_state };
            this.transitions.Add(to_insert3);  // Add transition in list of list of strings
            this.states.Add(new_state);  // Add new state to states
            current_state = new_state;  // Update current state
            //not updated state counter, since the branching should meet now

            //Final
            // new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert4 = new List<string> { plus_start_state, "eps", new_state };
            this.transitions.Add(to_insert4);  // Add transition in list of list of strings
            this.states.Add(new_state);  // Add new state to states
            state_counter++; //update counter

            

            return (new_state, state_counter);

        }


        public static List<List<string>> Grouping(string regexp){
            int depth = 0; // For nested parentheses, count how many groups need to be closed
            List<List<string>> grouping = new List<List<string>>();
            List<string> group = new List<string>();
            int stopklods = regexp.Length;  //Makes sure that the last group will be added

            foreach (char chr in regexp){
                if (chr == '(') {
                    depth ++;
                    if (group.Count != 0){ // for the group that is outside a () will be added before resetting
                        grouping.Add(group);
                    }
                    group = new List<string>(); // Reset so that it wont continue a finished group, may have been done in elif, but may also not
                }
                else if (chr == ')'){
                    depth --;
                    if (group.Count != 0){
                        grouping.Add(group); // slut på group, tilføj til grouping og nulstil
                    }
                    group = new List<string>(); // This group is done, so reset
                }
                else{
                    if (chr != ' '){ // makes sure space is ignored
                        group.Add(chr.ToString());
                    }
                }
                if (stopklods == 1){ // Makes sure that the last group will be added if no parenthesis are found
                    if (depth != 0){
                        throw new Exception($"mismatch in parentheses in the regular expression: {regexp}");
                    }
                    if (group.Count != 0){ //If there are no parentheses then this group is the last and only once stopklods = 1
                        grouping.Add(group);
                    }
                }
                stopklods --; 
             }
            return grouping;
        }

        private bool IsOperator(char chr){
            switch(chr) {
                // expand further when implementing more operators
                case '+':
                    return true;
                    // pass along to operator method here
                    break;
                default:
                    return false;
                    // the char is not an operator
                    break;
                }
        }
        private void OrOperator(List<char> charList){;}
        private void QuestionOperator(List<char> charList){;}
        private void DotOperator(List<char> charList){;}
    }
}