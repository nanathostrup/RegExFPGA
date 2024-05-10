using SME;

namespace sme_intro{

    public class DFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            // string regexp = "abc (a)(b)";
            string regexp = "accccc";

            NFA nfa = new NFA();
            nfa.FromRegExp(regexp);
            
            DFA dfa = new DFA();
            dfa.FromNFA(nfa);
            
            //regex: "ab"
            // nfa.states = new List<string>();
            // nfa.states.Add("q0");
            // nfa.states.Add("q1");
            // nfa.states.Add("q2");
            // nfa.states.AddRange(new string[] { "q0", "q1", "q2" });
            // nfa.alphabet = new HashSet<char>(new char[] { 'a', 'b' });
            // nfa.transitions = new List<List<string>>();
            //MANGLER TRANSITIONS OG ACCEPTING. 
            

            Console.WriteLine("\nRegex: " + regexp + "\n");

            //NFA States
            string nfastates = "";
            foreach(string state in nfa.states){
                nfastates = nfastates + state + " ";
            }
            Console.WriteLine("NFA States: " + nfastates);

            //DFA States
            string stateStr = "";
            Console.Write("DFA States: ");
            foreach (var state in dfa.states)
            {
                stateStr = "[" + "[" + string.Join(", ", state[0]) + "] " + state[1] + "]"; // Format the state
                Console.Write(stateStr);
            }
            Console.Write("\n");

            //NFA alphabet
            string alphabet = "";
            foreach(char chr in nfa.alphabet){
                string str = chr.ToString();
                alphabet = alphabet + str + " ";
            }
            Console.WriteLine("NFA alphabet: " + alphabet);

            string alphabet1 = "";
            foreach(char chr in dfa.alphabet){
                string str = chr.ToString();
                alphabet1 = alphabet1 + str + " ";
            }
            Console.WriteLine("NFA alphabet: " + alphabet1);



            //NFA start state
            Console.WriteLine("NFA starting state: " + nfa.start_state);

            //DFA start state
            string startState = "";
            foreach (var state in dfa.start_state){
                startState = startState + state;
            }
            Console.WriteLine("DFA start state: " + startState + "\n");

            
            //NFA accepting states
            string acceptingn = "";
            foreach (string accept in nfa.accept_states){
                acceptingn = acceptingn + accept + " ";
            }
            Console.WriteLine("NFA accepting states: " + acceptingn);

            //DFA accepting states:
            string acceptingd = "";
            foreach (string accept in dfa.accept_states){
                acceptingd = acceptingd + accept + " ";
            }
            Console.WriteLine("DFA accepting states: " + acceptingd + "\n");

            //NFA transitions:
            string transition1 = "";
            string transitions1 = "";
            foreach(List<string> transition in nfa.transitions ){
                transitions1 = transitions1 + "[";
                foreach(string str in transition){
                    transition1 = transition1 + str + " ";
                }
                transitions1 = transitions1 + " " + transition1 + "]";
                transition1 = "";
            }
            Console.WriteLine("NFA transitions:" + transitions1);

            //DFA transitions:
            string transition2 = "";
            string transitions2 = "";
            foreach(List<string> trans in dfa.transitions ){
                transitions2 = transitions2 + "[";
                foreach(string str in trans){
                    transition2 = transition2 + str + " ";
                }
                transitions2 = transitions2 + " " + transition2 + "]";
                transition2 = "";
            }
            Console.WriteLine("DFA transitions:" + transitions2);


            // nfa.alphabet = {'a', 'b'}
            // nfa.transitions = [['q0', 'a', 'q1'], ['q1', 'b', 'q2']]
            // nfa.accept_states = ['q2']

            // print("------------------------")
            // DFA dfa = new DFA()
            // dfa.from_nfa(nfa)
            // print("Alphabet:", dfa.alphabet)
            // print("States:", dfa.states)
            // print("Transitions:", dfa.transitions)
            // print("Start State:", dfa.start_state)
            // print("Accept States:", dfa.accept_states)
            // print("------------------------")
        }
    }
}