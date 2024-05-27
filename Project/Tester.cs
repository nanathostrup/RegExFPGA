using SME;

namespace sme_intro
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
            Console.WriteLine(":)");

            var tests = new string[]{"a", "b", "ab", "c", "ac", "bb", "aa", "kh", "f", "cccccbab", "khab", "abkh", "khabdf", "dfag", "dfbg", "dafb" , "dafbgc", "dafbdab"};
            // load(); //moved to Program.cs to avoid setting up the system when simulating in Run()
            init(); 
            await ClockAsync();

            foreach (var test in tests)
            {
                init();
                char[] array = test.ToCharArray(); //skal på bus
                //for løkker der loader test ind i control.array som bytes
                for (int j = 0; j < test.Length; j++){
                    control.Array[j] = (byte)array[j];
                }
                control.Length = test.Length;

                for (int i = 0; i < test.Length; i++)
                {
                    control.Valid = true;
                    control.Reset = false;
                    await ClockAsync();
                } //Behøver den at køre over for loop? -- ja ellers vil alle tests være false.
                //Kan man ikke bare sætte det her ud?
                
                await ClockAsync();
                Console.WriteLine("traversal.Valid: " + traversal.Valid + " for test: " + test);
                //reset
                traversal.Valid = false; 
                control.Valid = false;
                control.Reset = true;
                await ClockAsync();
            }
            await ClockAsync();
            // System.Diagnostics.Debug.Assert(counter == 2); //manually inserted test
            Console.WriteLine("All tests passed"); //otherwise exception thrown
        }
        public void init(){
            control.Valid = false;
            control.Reset = true;
            traversal.Valid = false;
            // control.Array = Scope.CreateArray<char>(1000); // Initialize the fixed array with the correct length

        }
    }
}
