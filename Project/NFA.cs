using SME;

namespace sme_intro{

    // [ClockedProcess]
    public class NFA{ //: SimpleProcess
    // {
    //     [InputBus]
    //     public Control control;

    //     [OutputBus]
    //     public Count count = Scope.CreateBus<Count>();

        //From book, NFA consists of the five:
        public List<string> states;
        // public List<string> alphabet;
        public HashSet<char> alphabet; //Maybe a list instead?
        public List<List<string>> transitions;
        // public List<string> start_state; //can be extended to have several, but i dont see the point? Is there ever more start states? There should only be one?
        public string start_state;
        public List<string> accept_states;

        public void FromRegExp(string regexp){ //Should return an NFA
            this.start_state = "q0";
            this.accept_states = new List<string>();
            this.states = new List<string> { this.start_state };
            //Maybe with a list instead?
            // this.alphabet = new List<string>();
            this.alphabet = new HashSet<char>(regexp.Replace("(", "").Replace(")", "").Replace(" ", ""));
            this.transitions = new List<List<string>>();
            
            // Initialize the alphabet
            // this.alphabet = new List<string>();
            // // Iterate over each character in the input regexp
            // foreach (char chr in regexp)
            // {
            //     // Convert the char to a string
            //     string chrString = chr.ToString();

            //     // Check if the character is not one of the excluded characters
            //     if (chr != ' ' && chr != '(' && chr != ')' && !this.alphabet.Contains(chrString))
            //     {
            //         // Add the character to the alphabet if it's not already present
            //         this.alphabet.Add(chrString);
            //     }
            // }


            int state_counter = 1;
            
            this.ConstructNFA(regexp, state_counter);// start_state, accept_states, states, alphabet, transitions);
            
            // return NFA(this.states, this.alphabet, this.transitions, this.start_state,this.accept_states);
            // this.accept_states.append(current_state);
        }

        private void ConstructNFA(string regexp, int state_counter) { //string start_state, List<string> accept_states, List<string> states, HashSet<char> alphanet, List<List<string>> transitions){
            string current_state = this.start_state;
            List<List<char>> groups = Grouping(regexp);
            string new_state = "";

            foreach (List<char> group in groups)
            {
                // new (string, int) = (new_state, state_counter);
                (new_state, state_counter) = this.ProcessGroup(group, current_state, state_counter);
                current_state = new_state;
            }

            this.accept_states.Add(current_state);
        }

        private (string, int) ProcessGroup(List<char> group , string current_state, int state_counter){
            string new_state = current_state; // Initialize the new state with the current state
            // char saved_char = "";
            int length = group.Count;

            // for (int i = 0; i >= length ; i ++){
            foreach (char chr in group){
                // Operator logic here - also before. Should make a clean slate when 
                if (alphabet.Contains(chr)){ 
                    new_state = "q" + state_counter;  // Naming new state
                    string str = chr.ToString();
                    List<string> to_insert = new List<string> { current_state, str, new_state };
                    transitions.Add(to_insert);  // Add transition in list of list of strings
                    states.Add(new_state);  // Add new state to states
                    current_state = new_state;  // Update current state
                    state_counter++;  // Increment state counter
                }
            }

            return (new_state, state_counter);  // State counter is also returned so it is not overwritten in construct_nfa
        }


        public static List<List<char>> Grouping(string regexp){
            // inGroup = False // For another idea - gemt i Onenote "Design -> NFA grouping anden ide"
            int depth = 0; // For nested parentheses, count how many groups need to be closed
            List<List<char>> grouping = new List<List<char>>();
            List<char> group = new List<char>();
            int stopklods = regexp.Length;  //Makes sure that the last group will be added

            foreach (char chr in regexp){
                if (chr == '(') {
                    depth ++;
                    if (group.Count != 0){ // for the group that is outside a () will be added before resetting
                        grouping.Add(group);
                    }
                    group = new List<char>(); // Reset so that it wont continue a finished group, may have been done in elif, but may also not
                }
                else if (chr == ')'){
                    depth --;
                    if (group.Count != 0){
                        grouping.Add(group); // slut på group, tilføj til grouping og nulstil
                    }
                    group = new List<char>(); // This group is done, so reset
                }
                else{
                    if (chr != ' '){ // makes sure space is ignored
                        group.Add(chr);
                    }
                }
                if (stopklods == 1){ // Makes sure that the last group will be added if no parenthesis are found
                    if (depth != 0){
                        throw new Exception($"mismatch in parentheses in the regular expression: {regexp}");
                        // raise SyntaxError(f"mismatch in parentheses in the regular expression: {regexp}")
                    }
                    if (group.Count != 0){ //If there are no parentheses then this group is the last and only once stopklods = 1
                        grouping.Add(group);
                    }
                }
                stopklods --; 
             }
            return grouping;
        }

        private void IsOperator(char chr){
            switch(chr) {
                case '|' :
                    // pass along to operator method here
                    break;
                case '+':
                    // pass along to operator method here
                    break;
                case '*':
                    // pass along to operator method here
                    break;
                case '.':
                    // pass along to operator method here
                    break;
                default:
                    // the char is not an operator
                    break;
                }
        }
        private void OrOperator(List<char> charList){
            ;
        }
         private void PlusOperator(List<char> charList){
            ;
        }
         private void QuestionOperator(List<char> charList){
            ;
        }
         private void DotOperator(List<char> charList){
            ;
        }
    }
}
