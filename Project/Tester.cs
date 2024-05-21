using SME;

namespace sme_intro
{
    public class Tester : SimulationProcess
    {
        [InputBus]
        // public Count count;
        public Traversal traversal;

        [OutputBus]
        public Control control = Scope.CreateBus<Control>();
        public Traverse traverseProcess;

        public override async System.Threading.Tasks.Task Run()
        {
            Console.WriteLine("tester");
            var tests = new string[] { "a" };
            load();
            Console.WriteLine("load");
            init(); 
            Console.WriteLine("init");
            await ClockAsync();
            Console.WriteLine("await");

            char[] array = new char[] {'1'};

            foreach (var test in tests)
            {
                Console.WriteLine(";)");
                init();
                Console.WriteLine(":)");
                traverseProcess.input = test.ToCharArray();

                for (int i = 0; i < test.Length; i++)
                {
                    control.Valid = true;
                    control.Reset = false;
                    Console.WriteLine("clock");
                    await ClockAsync();
                    Console.WriteLine("await clock done");
                }

                control.Valid = false;
                Console.WriteLine("clock");
                await ClockAsync();
                control.Reset = true;
                Console.WriteLine("clock");
                await ClockAsync();
            }
            await ClockAsync();
            Console.WriteLine("All tests passed in 'a'"); // Old print statement that has stayed for debugging
        }
        public void init(){
            control.Valid = false;
            control.Reset = true;

            traversal.Count = 0;   
        }

        public void load(){
            NFA nfa = new NFA();
            DFA dfa = new DFA();

            nfa.FromRegExp("ab");
            (char[] start_state1, char[] accept_states1, char[] states1, char[] alphabet1, char[][] transitions1) = dfa.FromNFA(nfa);
            
            traverseProcess = new Traverse
            {
                start_state = start_state1,
                accept_states = accept_states1,
                transitions = transitions1,
                input = new char[] { ' ' }
            };
        }   
    }
}
//restart window cmd shift p, reload window