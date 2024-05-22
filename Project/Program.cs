using SME;

namespace sme_intro
{

    class Program
    {
        static void Main(string[] args)
        {
            using (var sim = new Simulation())
            {
                // For testing the c# only
                // var nfaTest = new NFATest();
                // nfaTest.Test();
                
                // var dfaTest = new DFATest();
                // dfaTest.Test();

                //traversalClass som counter class

                //Tag den dfa der er lavet her og så send den til Tester?
                        //Så bliver den ikke lavet i hardware men uden for
                        
                // NFA nfa = new NFA();
                // DFA dfa = new DFA();

                // nfa.FromRegExp("ab");
                // (char[] start_state, char[] accept_states, char[] states, char[] alphabet, char[][] transitions) = dfa.FromNFA(nfa); //den her bliver passed til tester
 

                //IKKE SLET DETTE:  
                var tester = new Tester();
                var traversal = new Traverse();
                tester.traversal = traversal.traversal;
                traversal.control = tester.control;
                tester.traverseProcess = traversal;
                
                NFA nfa = new NFA();
                DFA dfa = new DFA();

                nfa.FromRegExp("ab");
                (char[] start_state1, char[] accept_states1, char[] states1, char[] alphabet1, char[][] transitions1) = dfa.FromNFA(nfa);
                accept_states1 = new char[]{'2', '3', '5', '6'};
                states1 = new char[] {'0', '1', '2', '3', '4', '5', '6'};
                start_state1 = new char[]{'0'};
                alphabet1 = new char[]{'a', 'b','c'};
                char[] transition0 = new char[]{'0', 'c', '3'};
                char[] transition1 = new char[]{'0', 'a', '1'};
                char[] transition2 = new char[]{'1', 'b', '2'};
                char[] transition3 = new char[]{'3', 'c', '6'};
                char[] transition4 = new char[]{'3', 'a', '4'};
                char[] transition5 = new char[]{'2', 'a', '4'};
                char[] transition6 = new char[]{'4', 'b', '5'};
                char[] transition7 = new char[]{'5', 'a', '4'};
                char[] transition8 = new char[]{'5', 'c', '6'};
                char[] transition9 = new char[]{'2', 'c', '6'};
                char[] transition10 = new char[]{'6', 'a', '4'};
                char[] transition11 = new char[]{'6', 'c', '6'};
                transitions1 = new char[][]{transition0, transition1, transition2, transition3, transition4, transition5, transition6, transition7, transition8, transition9, transition10, transition11};

                tester.load(start_state1, accept_states1, states1, alphabet1, transitions1, states1);

                sim
                    .AddTopLevelInputs(traversal.control) //travs input
                    .AddTopLevelOutputs(traversal.traversal)//traversal output
                    .BuildGraph(render_buses: false)
                    .BuildCSVFile()
                    // .BuildVHDL()
                    .Run();
            }
        }

    }

}