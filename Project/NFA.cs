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
                if ((regexp[i] != '(') && (regexp[i] != ')') && (regexp[i] != ' ') && (!IsOperator(regexp[i]))){ //no spaces or () or operator in alphabet
                    if (!this.alphabet.Contains(regexp[i].ToString())){ //avoid adding the same characters twice
                        this.alphabet.Add(regexp[i].ToString());
                    }
                }
            }
            
            this.ConstructNFA(regexp);
        }

        private void ConstructNFA(string regexp){//, int state_counter) { //string start_state, List<string> accept_states, List<string> states, HashSet<char> alphanet, List<List<string>> transitions){
            int state_counter = 1; //used to name the states 'qn', and a counter later on
            string current_state = this.start_state;
            List<string> groups = Grouping(regexp); //divide into groups
            string new_state = "";

            Console.WriteLine(regexp);

            for (int i = 0; i < groups.Count; i++)
            {
                //if the operator lies exactly at the start of the next group, then the opperator should be applied to the current group
                if (((i + 1) < groups.Count) && (IsOperator(groups[i+1][0]))){
                    (new_state, state_counter) = ProcessGroup(groups[i], current_state, state_counter);
                    current_state = new_state;
                    switch(groups[i+1][0]){
                        case '+':
                            (new_state, state_counter) = PlusOperatorLogic(groups[i], current_state, state_counter);
                            break;
                        default:
                            break;
                    }
                    current_state = new_state;

                    //can become relevant later
                    // if (!(groups[i+1].Length > 1)) {;
                    //    remove the first char in the group;
                    // }
                }
                else{
                    (new_state, state_counter) = ProcessGroup(groups[i], current_state, state_counter);
                    current_state = new_state;
                }
            }
            this.accept_states.Add(current_state);
        }

        private (string, int) ProcessGroup(string group , string current_state, int state_counter){
            string new_state = current_state; // Initialize the new state with the current state
            
            //if groups are nested
            if (group.Contains('(')){
                List<string> subGroups = Grouping(group);
            
                for (int i = 0; i < subGroups.Count; i++){
                    if (((i + 1) < subGroups.Count) && (IsOperator(subGroups[i+1][0]))){
                        (new_state, state_counter) = ProcessGroup(subGroups[i], current_state, state_counter);
                        current_state = new_state;
                        switch(subGroups[i+1][0]){
                            case '+':
                                (new_state, state_counter) = PlusOperatorLogic(subGroups[i], current_state, state_counter);
                                break;
                            default:
                                break;
                        }
                        current_state = new_state;

                    }
                    else{
                        (new_state, state_counter) = ProcessGroup(subGroups[i], current_state, state_counter);
                        current_state = new_state;
                    }            
                }
                return (current_state, state_counter);
            }

            //non nested groups
            for (int i = 0; i < group.Length; i++){
                if (IsOperator(group[i]) && group.Length != 1){
                    switch (group[i]){
                        case '+':
                            string str = "";
                            str += group[i-1];
                            (current_state, state_counter) = PlusOperatorLogic(str, current_state, state_counter); //pass on group[i-1] since group[i] is the operator and the method should be applied with the previous char
                            break;
                        default:
                            break;
                        }
                }
                else{
                    (current_state, state_counter) = NonOperatorLogic(group[i], current_state, state_counter);
                    new_state = current_state;
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
                
                if(!states.Contains(new_state)){
                    this.states.Add(new_state);  // Add new state to states
                }
                current_state = new_state;  // Update current state
                state_counter++;  // Increment state counter
            }
            return (current_state, state_counter);
        }
        private (string, int) PlusOperatorLogic(string group, string current_state, int state_counter){
            string new_state = current_state;
            if (!this.alphabet.Contains("eps")){ //to avoid adding it several times
                this.alphabet.Add("eps");        //alphabet now contains epsilon
            }
                
            //"init" kinda
            string plus_start_state = new_state; //For the last branching part

            //first epsilon transition
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert = new List<string> { current_state, "eps", new_state };
            this.transitions.Add(to_insert);  // Add transition in list of list of strings
            if(!states.Contains(new_state)){
                this.states.Add(new_state);  // Add new state to states
            }
            current_state = new_state;  // Update current state
            state_counter++;
            
            //char transition
            string plus_loop_state = current_state;
            for (int i = 0; i < group.Length; i++){
                if (IsOperator(group[i])){
                    switch (group[i]){
                        case '+':
                            string str = "";
                            str += group[i-1];
                            //pass on group[i-1] since group[i] is the operator and the method should be applied with the previous char
                            (current_state, state_counter) = PlusOperatorLogic(str, current_state, state_counter);
                            break;
                        default:
                            break;
                    }
                }
                else if(this.alphabet.Contains(group[i].ToString())){
                // Console.WriteLine("chr in foreach: " + chr);
                    new_state = "q" + state_counter;  // Naming new state
                    List<string> to_insert1 = new List<string> { current_state, group[i].ToString(), new_state };
                    this.transitions.Add(to_insert1);  // Add transition in list of list of strings
                    if(!states.Contains(new_state)){
                        this.states.Add(new_state);  // Add new state to states
                    }
                    current_state = new_state;  // Update current state
                    state_counter++;
                }
            }

            //second epsilon transition - making a loop
            //This is a loop so the new_state and current_state are not updated here
            List<string> to_insert2 = new List<string> { current_state, "eps", plus_loop_state };
            this.transitions.Add(to_insert2);  // Add transition in list of list of strings
            if(!states.Contains(new_state)){
                    this.states.Add(new_state);  // Add new state to states
            }
            //third epsilon closure
            new_state = "q" + state_counter;  // Naming new state
            List<string> to_insert3 = new List<string> { current_state, "eps", new_state };
            this.transitions.Add(to_insert3);  // Add transition in list of list of strings
            if(!states.Contains(new_state)){
                this.states.Add(new_state);  // Add new state to states
            }                
            current_state = new_state;  // Update current state
            //not updated state counter, since the branching should meet now

            //Final transition
            List<string> to_insert4 = new List<string> { plus_start_state, "eps", new_state };
            this.transitions.Add(to_insert4);  // Add transition in list of list of strings
            if(!states.Contains(new_state)){
                    this.states.Add(new_state);  // Add new state to states
            }
            state_counter++; //update counter
            return (new_state, state_counter);
        }

        public List<string> Grouping(string regexp){
            int depth = 0; // For nested parentheses, count how many groups need to be closed
            List<string> grouping = new List<string>();
            string group = "";
            int stopklods = regexp.Length;  //Makes sure that the last group will be added

            foreach (char chr in regexp){
                if (chr == '(') {
                    depth ++;
                    if (depth == 1){ //if this is the first char in the group, then we want to exclude '('
                        if (group != ""){ // for the group that is outside a () will be added before resetting
                            grouping.Add(group);
                            group = "";
                        }
                    }
                    else{
                        group += chr;
                    }
                }
                else if (chr == ')'){
                    depth --;
                    if (depth != 0){
                        if (group != ""){
                            group += chr;
                        }
                    }
                    else{
                        grouping.Add(group); // end of group, add to grouping and reset
                        group = ""; // This group is done, so reset
                    }
                }
                else{
                    if (chr != ' '){ // makes sure space is ignored
                        group += chr;
                    }
                }
                if (stopklods == 1){ // Makes sure that the last group will be added if no parenthesis are found
                    if (depth != 0){
                        throw new Exception($"mismatch in parentheses in the regular expression: {regexp}");
                    }
                    if (group != ""){ //If there are no parentheses then this group is the last and only once stopklods = 1
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
                    break;
                default:
                    return false;
                    break;
                }
        }
    }
}