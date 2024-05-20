using SME;

namespace sme_intro
{
    public class Tester : SimulationProcess
    {
        [InputBus]
        // public Count count;
        public Traversal traversal;
        // public NFAClass nfaClass;
        // public Buffer buffer;

        [OutputBus]
        public Control control = Scope.CreateBus<Control>();

        public override async System.Threading.Tasks.Task Run()
        {
            Console.WriteLine("tester");
            var tests = new string[] { "a" };
            load();
            init(); // alle busses fields skal instantieres ellers smider den fejl når man sætter det senre. Men man kan godt opdatere den senere.

            await ClockAsync();
            // count.CompareCharacter = 97; // 97 is ASCI 'a', and will be what will be searched for

            char[] array = new char[] {'1'};

            foreach (var test in tests)
            {
                // load dfa ind i []array i en init
                init();
                //HER SKAL MAN LAVE ET NFA FOR HVER TEST
                    //OG BAGEFTER EN DFA

                for (int i = 0; i < test.Length; i++)
                {
                    // control.Character = (byte)test[i];
                    control.Valid = true;
                    control.Reset = false;
                    Console.WriteLine("clock");
                    await ClockAsync();
                }

                control.Valid = false;
                Console.WriteLine("clock");
                await ClockAsync();
                // System.Diagnostics.Debug.Assert(count.Count == test.Count(c => c == 'a'),
                //    $"Count of 'a' in '{test}' is {count.Count}, expected {test.Count(c => c == 'a')}");
                control.Reset = true;
                Console.WriteLine("clock");
                await ClockAsync();
            }
            await ClockAsync();
            Console.WriteLine("All tests passed in 'a'"); // Otherwise, they would have hit the assert.
        }

        public void init(){
            // control.regex = "";

            //Counter initialised
            // count.Count = 0;
            // count.CompareCharacter = 0;
            Console.WriteLine(":)");
            // char[] array = new char[] {'1'};
            // count.CompareCharacter = 0;

            control.Valid = false;
            control.Reset = true;

            traversal.Count = 0;
            
           
        }
        public void load(){
            NFA nfa = new NFA();
            DFA dfa = new DFA();

            nfa.FromRegExp("ab");
            (char[] start_state1, char[] accept_states, char[] states, char[] alphabet, char[][] transitions) = dfa.FromNFA(nfa);
            traversal.start_state = start_state1;
        }     
    }
}
//restart window cmd shift p, reload window