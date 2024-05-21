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
                var nfaTest = new NFATest();
                nfaTest.Test();
                
                var dfaTest = new DFATest();
                dfaTest.Test();

                //traversalClass som counter class

                //Tag den dfa der er lavet her og så send den til Tester?
                        //Så bliver den ikke lavet i hardware men uden for
                        
                NFA nfa = new NFA();
                DFA dfa = new DFA();

                nfa.FromRegExp("ab");
                (char[] start_state, char[] accept_states, char[] states, char[] alphabet, char[][] transitions) = dfa.FromNFA(nfa); //den her bliver passed til tester
 

                //IKKE SLET DETTE:  
                var tester = new Tester();
                var traversal = new Traverse();
                tester.traversal = traversal.traversal;
                traversal.control = tester.control;

                sim
                    .AddTopLevelInputs(traversal.control) //travsinput
                    .AddTopLevelOutputs(traversal.traversal)//traversal output
                    .BuildGraph(render_buses: false)
                    .BuildCSVFile()
                    .BuildVHDL()
                    .Run(); 
            }
        }

    }

}