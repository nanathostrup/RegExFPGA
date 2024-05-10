using SME;

namespace sme_intro
{

    class Program
    {
        static void Main(string[] args)
        {
            using (var sim = new Simulation())
            {
                Console.WriteLine(":)");

                var groupTest = new RegGroupingTest();
                RegGroupingTest.Test();

                var nfaTest = new NFATest();
                nfaTest.Test();
                
                var dfaTest = new DFATest();
                dfaTest.Test();

                // //IKKE SLET DETTE:  
                // var tester = new Tester();
                // var counter = new Counter();
                // var orr = new OrClass();
                
                // // // Connect processes
                // tester.count = counter.count;
                // tester.orcounter = orr.orcounter;

                // counter.control = tester.control;
                // orr.control = tester.control;

                // // orr.gettingPassedAlong(a, b); -- Hardware doesn't behave like this

                // sim
                //     .AddTopLevelInputs(counter.control)
                //     .AddTopLevelOutputs(counter.count)
                //     .BuildGraph(render_buses: false)
                //     .BuildCSVFile()
                //     .BuildVHDL()
                //     .Run(); 
            
            }
        }
    }

}