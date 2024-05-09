using SME;

namespace sme_intro
{
    [ClockedProcess]
    public class OrClass : SimpleProcess //Rename!
    {
        [InputBus]
        public Control control;

        [OutputBus]
        public OrCounter orcounter = Scope.CreateBus<OrCounter>();

        private uint internal_count = 0;
        private bool status = false;
        protected override void OnTick()
        {
            status = false;
            if (control.Reset)
            {
                internal_count = 0;
            }
            // else if (control.Valid && (control.Character == orcounter.Comparison1)){
            //     Console.WriteLine(":))))");
            // }
            // else if (control.Valid){
            //     Console.WriteLine(":)");
            //     internal_count++;
            // }
            else if ((control.Valid) && (control.Character == orcounter.Comparison0 || control.Character == orcounter.Comparison1 )){
                    internal_count++;
                    status = true;
            }
            //del ud i flere processer - er en ide - kan kigges på senere.
            Console.WriteLine(":)");
            
            // else if (control.Valid && (control.Character == 97 ) || (control.Character == 98)) // Comparison1 and Comparison2 should be determined in the main program/tester
            // {
            //     internal_count++;
            // }
            orcounter.Counter = internal_count;
            orcounter.Status = status;
            //Console.WriteLine($"status: {status} vs. orcounter.Status: {orcounter.Status}");
            }
            // Or(){}

        }
    }
