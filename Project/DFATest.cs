using SME;

namespace sme_intro{

    public class DFATest{
        public void Test(){
            Console.WriteLine("------------------------");
            string regexp = "abc (a)(b)";

            NFA nfa = new NFA();
            nfa.FromRegExp(regexp);

            //regex: "ab"
            nfa.states = new List<string>();
            nfa.states.Add("q0");
            // nfa.states = ['q0', 'q1', 'q2']

            string states = "";
            foreach(string state in nfa.states){
                states = states + state + " ";
            }
            Console.WriteLine("States: " + states);

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