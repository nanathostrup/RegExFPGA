using SME;

namespace nfa_dfa
{
    public class Tester : SimulationProcess
    {
        [InputBus]
        public Traversal traversal;
        public Traverse traverseProcess;

        [OutputBus]
        public Control control = Scope.CreateBus<Control>();

        public override async System.Threading.Tasks.Task Run()
        {
            var tests = new string[]{"a", "b", "ab", "c", "ac", "bb", "aa", "kh", "f", "cccccbab", "khab", "abkh", "khabdf", "dfag", "dfbg", "dafb" , "dafbgc", "dafbdab"};
            // load(); //moved to Program.cs to avoid setting up the system when simulating in Run()
            init(); 
            await ClockAsync();
            int Counter = 0;
            int expected = 8;

            foreach (var test in tests)
            {
                init();
                char[] array = test.ToCharArray(); //going onto bus
                //for loop that loads the tests into. contro.array as bytes
                for (int j = 0; j < test.Length; j++){
                    control.Array[j] = (byte)array[j];
                }

                control.Length = test.Length;
                control.Valid = true;
                control.Reset = false;
                await ClockAsync();

                if (traversal.Valid == true){
                    Counter++;
                }
                // Console.WriteLine("traversal.Valid: " + traversal.Valid + " for test: " + test); //manual test
            }
            await ClockAsync();

            System.Diagnostics.Debug.Assert(Counter == expected,
                    $"Count of matched strings is {Counter}, but expected {expected}");
            Console.WriteLine("All tests passed"); //otherwise exception thrown
        }
        public void init(){
            control.Valid = false;
            control.Reset = true;
            // control.Array = Scope.CreateArray<char>(1000); // Initialize the fixed array with the correct length in Bus.cs
        }
    }
}
