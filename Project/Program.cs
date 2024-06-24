using SME;

namespace nfa_dfa
{

    class Program
    {
        static void Main(string[] args)
        {
            // using (var sim = new Simulation())
            // {
                // For testing the c# only
                var nfaTest = new NFATest();
                nfaTest.Test();
                
                var dfaTest = new DFATest();
                dfaTest.Test();

                // //SME simulation
                // var tester = new Tester();
                // var traversal = new Traverse();
                // tester.traversal = traversal.traversal; //connect processes
                // traversal.control = tester.control;
                // tester.traverseProcess = traversal;

                // var watch = new System.Diagnostics.Stopwatch(); //Used for timing the construction of nfa to dfa
                // watch.Start();
            //     NFA nfa = new NFA();
            //     DFA dfa = new DFA();
                
            //     nfa.FromRegExp("an example string");
            //     (byte start_state1, byte[] accept_states1, byte[] states1, byte[] alphabet1, byte[] transitions1) = dfa.FromNFA(nfa);
            //     // watch.Stop(); 
            //     // Console.WriteLine($"Execution Time: {watch.ElapsedMilliseconds} ms");

            //     //Overwrite
            //     accept_states1 = new byte[]{(byte)'2', (byte)'3', (byte)'5', (byte)'6'};
            //     states1 = new byte[] {(byte)'0', (byte)'1', (byte)'2', (byte)'3', (byte)'4', (byte)'5', (byte)'6'};
            //     start_state1 = (byte)'0';
            //     alphabet1 = new byte[]{(byte)'a', (byte)'b',(byte)'c'};
            //     transitions1 = new byte[]{(byte)'0', (byte)'c', (byte)'3', (byte)'0', (byte)'a', (byte)'1', (byte)'1', (byte)'b', (byte)'2', (byte)'3', (byte)'c', (byte)'6', (byte)'3', (byte)'a', (byte)'4', (byte)'2', (byte)'a', (byte)'4', (byte)'4', (byte)'b', (byte)'5', (byte)'5', (byte)'a', (byte)'4', (byte)'5', (byte)'c', (byte)'6', (byte)'2', (byte)'c', (byte)'6', (byte)'6', (byte)'a', (byte)'4', (byte)'6', (byte)'c', (byte)'6'};
                
            //     traversal.load(start_state1, accept_states1, states1, alphabet1, transitions1, states1);
 
            //     sim
            //         .AddTopLevelInputs(tester.traversal) //travs input
            //         .AddTopLevelOutputs(tester.control) //traversal output
            //         .BuildGraph(render_buses: false)
            //         .AddTicker(s => Console.WriteLine("Ticked {0}", Scope.Current.Clock.Ticks))
            //         .BuildCSVFile()
            //         .BuildVHDL()
            //         .Run();
            // }
        }

    }

}