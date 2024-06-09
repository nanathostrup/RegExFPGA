using SME;

namespace sme_intro{

    public class NFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            Console.WriteLine("NFA0");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            // string regexp = "a";
            // string regexp = "abc";
            // string regecp = "an example string";
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


            Console.WriteLine("------------------------");
            Console.WriteLine("NFA1");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp2 = "a|b";

            NFA nfa2 = new NFA();
            nfa2.FromRegExp(regexp2);

            //Test for states
            string states2 = "";
            foreach(string state in nfa2.states){
                states2 = states2 + state + " ";
            }
            Console.WriteLine("States: " + states2);

            //Test for alphabet
            string alphabet2 = "";
            foreach(string chr in nfa2.alphabet){
                string str = chr;
                alphabet2 = alphabet2 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet2);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa2.start_state);

            //Test for accepting states
            string accepting2 = "";
            foreach (string accept in nfa2.accept_states){
                accepting2 = accepting2 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting2);

            //Test for transitions
            string transition2 = "";
            string transitions2 = "";
            foreach(List<string> transition in nfa2.transitions ){
                transitions2 = transitions2 + "[";
                foreach(string str in transition){
                    transition2 = transition2 + str + " ";
                }
                transitions2 = transitions2 + " " + transition2 + "]";
                transition2 = "";
            }
            Console.WriteLine("Transitions:" + transitions2);
        }
    }
}