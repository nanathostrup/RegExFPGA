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

            Console.WriteLine("------------------------");
            Console.WriteLine("NFA2");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp3 = "(a+b)(bc)";

            NFA nfa3 = new NFA();
            nfa3.FromRegExp(regexp3);

            Console.WriteLine("regexp: " + regexp3);

            //Test for states
            string states3 = "";
            foreach(string state in nfa3.states){
                states3 = states3 + state + " ";
            }
            Console.WriteLine("States: " + states3);

            //Test for alphabet
            string alphabet3 = "";
            foreach(string chr in nfa3.alphabet){
                string str = chr;
                alphabet3 = alphabet3 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet3);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa3.start_state);

            //Test for accepting states
            string accepting3 = "";
            foreach (string accept in nfa3.accept_states){
                accepting3 = accepting3 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting3);

            //Test for transitions
            string transition3 = "";
            string transitions3 = "";
            foreach(List<string> transition in nfa3.transitions ){
                transitions3 = transitions3 + "[";
                foreach(string str in transition){
                    transition3 = transition3 + str + " ";
                }
                transitions3 = transitions3 + " " + transition3 + "]";
                transition3 = "";
            }
            Console.WriteLine("Transitions:" + transitions3);


            Console.WriteLine("------------------------");
            Console.WriteLine("NFA3");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp4 = "((ab))+"; //((a+b)(cd))+ --- LAV DENNE

            NFA nfa4 = new NFA();
            nfa4.FromRegExp(regexp4);

            //Test for states
            string states4 = "";
            foreach(string state in nfa4.states){
                states4 = states4 + state + " ";
            }
            Console.WriteLine("States: " + states4);

            //Test for alphabet
            string alphabet4 = "";
            foreach(string chr in nfa4.alphabet){
                string str = chr;
                alphabet4 = alphabet4 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet4);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa4.start_state);

            //Test for accepting states
            string accepting4 = "";
            foreach (string accept in nfa4.accept_states){
                accepting4 = accepting4 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting4);

            //Test for transitions
            string transition4 = "";
            string transitions4 = "";
            foreach(List<string> transition in nfa4.transitions ){
                transitions4 = transitions4 + "[";
                foreach(string str in transition){
                    transition4 = transition4 + str + " ";
                }
                transitions4 = transitions4 + " " + transition4 + "]";
                transition4 = "";
            }
            Console.WriteLine("Transitions:" + transitions4);


            Console.WriteLine("------------------------");
            Console.WriteLine("NFA4");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp5 = "((a+b)(cd)+)"; //((a+b)(cd))+ --- LAV DENNE

            NFA nfa5 = new NFA();
            nfa5.FromRegExp(regexp5);

            //Test for states
            string states5 = "";
            foreach(string state in nfa5.states){
                states5 = states5 + state + " ";
            }
            Console.WriteLine("States: " + states5);

            //Test for alphabet
            string alphabet5 = "";
            foreach(string chr in nfa5.alphabet){
                string str = chr;
                alphabet5 = alphabet5 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet5);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa5.start_state);

            //Test for accepting states
            string accepting5 = "";
            foreach (string accept in nfa5.accept_states){
                accepting5 = accepting5 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting5);

            //Test for transitions
            string transition5 = "";
            string transitions5 = "";
            foreach(List<string> transition in nfa5.transitions ){
                transitions5 = transitions5 + "[";
                foreach(string str in transition){
                    transition5 = transition5 + str + " ";
                }
                transitions5 = transitions5 + " " + transition5 + "]";
                transition5 = "";
            }
            Console.WriteLine("Transitions:" + transitions5);
            

            Console.WriteLine("------------------------");
            Console.WriteLine("NFA5");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp6 = "((a+b)(cd))+"; //((a+b)(cd))+ --- LAV DENNE

            NFA nfa6 = new NFA();
            nfa6.FromRegExp(regexp6);

            //Test for states
            string states6 = "";
            foreach(string state in nfa6.states){
                states6 = states6 + state + " ";
            }
            Console.WriteLine("States: " + states6);

            //Test for alphabet
            string alphabet6 = "";
            foreach(string chr in nfa6.alphabet){
                string str = chr;
                alphabet6 = alphabet6 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet6);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa6.start_state);

            //Test for accepting states
            string accepting6 = "";
            foreach (string accept in nfa6.accept_states){
                accepting6 = accepting6 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting6);

            //Test for transitions
            string transition6 = "";
            string transitions6 = "";
            foreach(List<string> transition in nfa6.transitions ){
                transitions6 = transitions6 + "[";
                foreach(string str in transition){
                    transition6 = transition6 + str + " ";
                }
                transitions6 = transitions6 + " " + transition6 + "]";
                transition6 = "";
            }
            Console.WriteLine("Transitions:" + transitions6);
            
            Console.WriteLine("------------------------");
            Console.WriteLine("NFA6");
            //Lav en test med noget der ikke er i alphabet.
                //initialize en nfa, opdater nfa og lav igen. Dur nok egentlig ikke for bliver det initialiseret med from_regexp?
            
            string regexp7 = "((ab)(cd))"; //((a+b)(cd))+ --- LAV DENNE

            NFA nfa7 = new NFA();
            nfa7.FromRegExp(regexp7);

            //Test for states
            string states7 = "";
            foreach(string state in nfa7.states){
                states7 = states7 + state + " ";
            }
            Console.WriteLine("States: " + states7);

            //Test for alphabet
            string alphabet7 = "";
            foreach(string chr in nfa7.alphabet){
                string str = chr;
                alphabet7 = alphabet7 + str + " ";
            }
            Console.WriteLine("Alphabet: " + alphabet7);

            //Test for start state
            Console.WriteLine("Starting state: " + nfa7.start_state);

            //Test for accepting states
            string accepting7 = "";
            foreach (string accept in nfa7.accept_states){
                accepting7 = accepting7 + accept + " ";
            }
            Console.WriteLine("Accepting States: " + accepting7);

            //Test for transitions
            string transition7 = "";
            string transitions7 = "";
            foreach(List<string> transition in nfa7.transitions ){
                transitions7 = transitions7 + "[";
                foreach(string str in transition){
                    transition7 = transition7 + str + " ";
                }
                transitions7 = transitions7 + " " + transition7 + "]";
                transition7 = "";
            }
            Console.WriteLine("Transitions:" + transitions7);
            
        }
    }
}