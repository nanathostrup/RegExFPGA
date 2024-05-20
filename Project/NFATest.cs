using SME;

namespace sme_intro{

    public class NFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            Console.WriteLine("NFA");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            // string regexp = "a";
            // string regexp = "abc";
            // string regexp = "(ab)";
            string regexp = "(ab)(cd)";
            // string regexp = "abc (a)(b)";
            // string regexp = "ab c (a) d ( b )";
            // string regexp = "(ab)(cd";

            NFA nfa1 = new NFA();
            nfa1.FromRegExp(regexp);

            //Test for states
            string states = "";
            foreach(string state in nfa1.states){
                states = states + state + " ";
            }
            Console.WriteLine("States: " + states);

            //Test for alphabet
            string alphabet = "";
            foreach(string chr in nfa1.alphabet){
                string str = chr;
                alphabet = alphabet + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa1.start_state);

            //Test for accepting states
            string accepting = "";
            foreach (string accept in nfa1.accept_states){
                accepting = accepting + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting);

            //Test for transitions
            string transition1 = "";
            string transitions1 = "";
            foreach(List<string> transition in nfa1.transitions ){
                transitions1 = transitions1 + "[";
                foreach(string str in transition){
                    transition1 = transition1 + str + " ";
                }
                transitions1 = transitions1 + " " + transition1 + "]";
                transition1 = "";
            }
            Console.WriteLine("Transitions:" + transitions1);
        }
    }
}