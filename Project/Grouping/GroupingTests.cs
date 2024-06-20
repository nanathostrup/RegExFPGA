using SME;

namespace sme_intro{

        public class RegGroupingTest{
        public static void Test(){
            RegGrouping regGrouping = new RegGrouping();

            //BASICS
            string string0 = "ab"; // no group with ()
            List<string> result0 = regGrouping.Grouping(string0);

            foreach (var group in result0)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();
        
        
            string string1 = "(ab)"; // One group
            List<string> result1 = regGrouping.Grouping(string1);
            foreach (var group in result1)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();
        
        
            string string2 = "(ab)(cd)"; // Multiple groups
            List<string> result2 = regGrouping.Grouping(string2);
            foreach (var group in result2)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            string string3 = "( a b ) (c d )"; // Space will not be added
            List<string> result3 = regGrouping.Grouping(string3);
            foreach (var group in result3)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            //MIX OF WITH AND WITHOUT PARENTHESIS
            string string4 = "abc(a)(b)"; // Groups with and with out parenthesis
            List<string> result4 = regGrouping.Grouping(string4);
            foreach (var group in result4)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            string string5 = "abc(a)d(b)"; // Mix between using parenthesis and not
            List<string> result5 = regGrouping.Grouping(string5);
            foreach (var group in result5)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            //NESTED PARENTHESES
            string string6 = "(a(b))";
            List<string> result6 = regGrouping.Grouping(string6);
            foreach (var group in result6)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            string string7 = "(a(a(a(a(a(a))))))";
            List<string> result7 = regGrouping.Grouping(string7);
            foreach (var group in result7)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            string string8 = "(a(a(a(a(a(a()))))))"; //Removes the inner and redundant ()
            List<string> result8 = regGrouping.Grouping(string8);
            foreach (var group in result8)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();
            
            string string9 = "(a((b)))"; //Removes redundant ()
            List<string> result9 = regGrouping.Grouping(string9);
            foreach (var group in result9)
            {
                Console.Write($"({group})");
            }
            Console.WriteLine();

            //ERRORS

            // string string10 = "(ab"; //Open end parenthesis
            // List<string> result10 = regGrouping.Grouping(string10);
            // foreach (var group in result10)
            // {
            //     Console.Write($"({group})");
            // }
            // Console.WriteLine();

            // string string11 = "ab)"; //Open first parenthesis
            // List<string> result11 = regGrouping.Grouping(string11);
            // foreach (var group in result11)
            // {
            //     Console.Write($"({group})");
            // }
            // Console.WriteLine();

            // string string12= "(a(ab)"; //nested and open end parenthesis
            // List<string> result12 = regGrouping.Grouping(string12);
            // foreach (var group in result12)
            // {
            //     Console.Write($"({group})");
            // }
            // Console.WriteLine();

            // string string13= "(((aaa"; //open nested and open end parenthesis
            // List<string> result13 = regGrouping.Grouping(string13);
            // foreach (var group in result13)
            // {
            //     Console.Write($"({group})");
            // }
            // Console.WriteLine();

        }
    }
}