using SME;

namespace sme_intro
{
    public class RegHandler : SimulationProcess
    {
        [InputBus]
        public Count count;
        public OrCounter orcounter;

        [OutputBus]
        public Control control = Scope.CreateBus<Control>();

        public override async System.Threading.Tasks.Task Run()
        {
            Console.WriteLine("reghandler");
            // await ClockAsync();
            // for (int i = 0; i < test.Length; i++)
            //     {
            //         control.Character = (byte)test[i];
            //         control.Valid = true;
            //         control.Reset = false;
            //         await ClockAsync();
            //     }

            // switch(expression)
            // {
            //     case (|) :
            //         // sæt bit til at være valid,
            //         break;
            //     case :
            //         // code block
            //         break;
            //     default:
            //         // code block
            //         break;
            //     }
        }
    }
}