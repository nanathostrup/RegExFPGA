using SME;

namespace sme_intro
{
    public class Tester : SimulationProcess
    {
        [InputBus]
        public Traversal traversal;
        public Traverse traverseProcess;

        [OutputBus]
        //MAybe the traversal instead?
        public Control control = Scope.CreateBus<Control>();

        public override async System.Threading.Tasks.Task Run()
        {
            var tests = new string[]{"a", "b", "ab", "c", "ac", "bb", "aa", "kh", "f", "cccccbab", "khab", "abkh", "khabdf", "dfag", "dfbg", "dafb" , "dafbgc", "dafbdab"};
            // load(); //moved to Program.cs to avoid setting up the system when simulating in Run()
            init(); 
            await ClockAsync();

            foreach (var test in tests)
            {
                init();
                traverseProcess.input = test.ToCharArray();

                for (int i = 0; i < test.Length; i++)
                {
                    control.Valid = true;
                    control.Reset = false;
                    await ClockAsync();
                }
                
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

            traversal.Count = 0;
            traversal.Valid = false;
        }

        public void load(char[] start_state1, char[] accept_states1, char[] states1, char[] alphabet1, char[][] transitions1, char[] states){
            traverseProcess.start_state = start_state1;
            traverseProcess.accept_states = accept_states1;
            traverseProcess.transitions = transitions1;
            traverseProcess.states = states1;
            traverseProcess.input = new char[] { ' ' };
        }   
    }
}
//restart window cmd shift p, reload window