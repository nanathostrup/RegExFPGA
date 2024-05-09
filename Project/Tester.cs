using SME;

namespace sme_intro
{
    public class Tester : SimulationProcess
    {
        [InputBus]
        public Count count;
        public OrCounter orcounter;
        public Buffer buffer;

        [OutputBus]
        public Control control = Scope.CreateBus<Control>();

        public override async System.Threading.Tasks.Task Run()
        {
            Console.WriteLine("tester");
            var tests = new string[] { "a", "b", "ab", "ba", "aaa", "bbb", "abc", "cba", "abacaba", "En meget tilfaeldig streng"};

            init(); // alle busses fields skal instantieres ellers smider den fejl når man sætter det senre. Men man kan godt opdatere den senere.

            //testing count of a's in a string 
                    //Prøvet at rykke ud men await SKAL bruges i denne funtion så skal være en lang funtion. Evt spørg Carl om muligheder for at rykke det ud. 
                    //Bør rykkes ud til forskellige klasser pr. tests.
            await ClockAsync();
            count.CompareCharacter = 97; // 97 is ASCI 'a', and will be what will be searched for

            foreach (var test in tests)
            {
                for (int i = 0; i < test.Length; i++)
                {
                    control.Character = (byte)test[i];
                    Console.WriteLine("Here");
                    Console.WriteLine(buffer.Buff); //This aint working*upside down smiley9g*
                    buffer.Buff.Add((byte)test[i]);
                    Console.WriteLine("Here1");

                    control.Valid = true;
                    control.Reset = false;
                    await ClockAsync();
                }
                control.Valid = false;
                await ClockAsync();
                System.Diagnostics.Debug.Assert(count.Count == test.Count(c => c == 'a'),
                   $"Count of 'a' in '{test}' is {count.Count}, expected {test.Count(c => c == 'a')}");
                                                                                                            
                control.Reset = true;
                await ClockAsync();

            }
            Console.WriteLine("All tests passed in 'a'"); // Otherwise, they would have hit the assert.

            //testing count of a||b in a string
            await ClockAsync();
            orcounter.Comparison0 = 98;
            orcounter.Comparison1 = 97;

            foreach (var test in tests)
            {
                for (int i = 0; i < test.Length; i++)
                {
                    control.Character = (byte)test[i];
                    control.Valid = true;
                    control.Reset = false;
                    await ClockAsync();
                }
                control.Valid = false;
                await ClockAsync();
                int AorB = (test.Count(c => c == 'a') + (test.Count(c => c == 'b'))); // sum of a's and b's in the test string
                System.Diagnostics.Debug.Assert(orcounter.Counter == (AorB),
                   $"Count of 'a or b' in '{test}' is {orcounter.Counter}, expected {AorB}");
                control.Reset = true;
                await ClockAsync();
            }
            Console.WriteLine("All tests passed in 'or'");
        }

        public void init(){
            //Buffer initialiseres
            // buffer.Buff = new byte[3]{ (byte)1, (byte)1, (byte)1 };
            // for (int i = 0; i < Buff.Length; i++){
            //     Console.WriteLine(i);
            // }
            //buffer.Buffer.Add((byte)20);
            //Or initialiseres
            orcounter.Counter = 0;
            orcounter.Comparison0 = 0;
            orcounter.Comparison1 = 0;
            orcounter.Status = false;

            //Counter initialiseres
            count.Count = 0;
            count.CompareCharacter = 0;
        }
    }
}
//restart window cmd shift p, reload window