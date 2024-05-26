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

                //SME delen 
                var tester = new Tester();
                var traversal = new Traverse();
                tester.traversal = traversal.traversal;
                traversal.control = tester.control;
                tester.traverseProcess = traversal;
                
                NFA nfa = new NFA();
                DFA dfa = new DFA();

                nfa.FromRegExp("ab");
                (byte start_state1, byte[] accept_states1, byte[] states1, byte[] alphabet1, byte[] transitions1) = dfa.FromNFA(nfa);
                accept_states1 = new byte[]{(byte)'2', (byte)'3', (byte)'5', (byte)'6'};
                states1 = new byte[] {(byte)'0', (byte)'1', (byte)'2', (byte)'3', (byte)'4', (byte)'5', (byte)'6'};
                start_state1 = (byte)'0';
                alphabet1 = new byte[]{(byte)'a', (byte)'b',(byte)'c'};
                byte[] transition0 = new byte[]{(byte)'0', (byte)'c', (byte)'3'};
                byte[] transition1 = new byte[]{(byte)'0', (byte)'a', (byte)'1'};
                byte[] transition2 = new byte[]{(byte)'1', (byte)'b', (byte)'2'};
                byte[] transition3 = new byte[]{(byte)'3', (byte)'c', (byte)'6'};
                byte[] transition4 = new byte[]{(byte)'3', (byte)'a', (byte)'4'};
                byte[] transition5 = new byte[]{(byte)'2', (byte)'a', (byte)'4'};
                byte[] transition6 = new byte[]{(byte)'4', (byte)'b', (byte)'5'};
                byte[] transition7 = new byte[]{(byte)'5', (byte)'a', (byte)'4'};
                byte[] transition8 = new byte[]{(byte)'5', (byte)'c', (byte)'6'};
                byte[] transition9 = new byte[]{(byte)'2', (byte)'c', (byte)'6'};
                byte[] transition10 = new byte[]{(byte)'6', (byte)'a', (byte)'4'};
                byte[] transition11 = new byte[]{(byte)'6', (byte)'c', (byte)'6'};
                transitions1 = new byte[]{(byte)'0', (byte)'c', (byte)'3', (byte)'0', (byte)'a', (byte)'1', (byte)'1', (byte)'b', (byte)'2', (byte)'3', (byte)'c', (byte)'6', (byte)'3', (byte)'a', (byte)'4', (byte)'2', (byte)'a', (byte)'4', (byte)'4', (byte)'b', (byte)'5', (byte)'5', (byte)'a', (byte)'4', (byte)'5', (byte)'c', (byte)'6', (byte)'2', (byte)'c', (byte)'6', (byte)'6', (byte)'a', (byte)'4', (byte)'6', (byte)'c', (byte)'6'};
                // transitions1 = new byte[][]{transition0, transition1, transition2, transition3, transition4, transition5, transition6, transition7, transition8, transition9, transition10, transition11};

                traversal.load(start_state1, accept_states1, states1, alphabet1, transitions1, states1);
                tester.load();

                sim
                    .AddTopLevelInputs(traversal.control) //travs input
                    .AddTopLevelOutputs(traversal.traversal)//traversal output
                    .BuildGraph(render_buses: false)
                    .BuildCSVFile()
                    .BuildVHDL()
                    .Run();
            }
        }

    }

}