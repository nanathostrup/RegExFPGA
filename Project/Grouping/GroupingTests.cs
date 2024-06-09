using SME;

namespace sme_intro{

    public class RegGroupingTest{
        public static void Test(){
            //BASICS
            string string0 = "ab"; // no group with ()
            List<List<char>> result0 = RegGrouping.grouping(string0);
            foreach (var group in result0)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();
        
            string string1 = "(ab)"; // One group
            List<List<char>> result1 = RegGrouping.grouping(string1);
            foreach (var group in result1)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();
        
        
            string string2 = "(ab)(cd)"; // Multiple groups
            List<List<char>> result2 = RegGrouping.grouping(string2);
            foreach (var group in result2)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            string string3 = "( a b ) (c d )"; // Space will not be added
            List<List<char>> result3 = RegGrouping.grouping(string3);
            foreach (var group in result3)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            //MIX OF WITH AND WITHOUT PARENTHESIS
            string string4 = "abc(a)(b)"; // Groups with and with out parenthesis
            List<List<char>> result4 = RegGrouping.grouping(string4);
            foreach (var group in result4)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            string string5 = "abc(a)d(b)"; // Mix between using parenthesis and not
            List<List<char>> result5 = RegGrouping.grouping(string5);
            foreach (var group in result5)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            //NESTED PARENTHESES
            string string6 = "(a(b))";
            List<List<char>> result6 = RegGrouping.grouping(string6);
            foreach (var group in result6)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            string string7 = "(a(a(a(a(a(a))))))";
            List<List<char>> result7 = RegGrouping.grouping(string7);
            foreach (var group in result7)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            string string8 = "(a(a(a(a(a(a()))))))"; //Removes the inner and redundant ()
            List<List<char>> result8 = RegGrouping.grouping(string8);
            foreach (var group in result8)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();
            
            string string9 = "(a((b)))"; //Removes redundant ()
            List<List<char>> result9 = RegGrouping.grouping(string9);
            foreach (var group in result9)
            {
                string groupString = string.Join("", group);
                Console.Write($"({groupString})");
            }
            Console.WriteLine();

            //ERRORS

            // string string10 = "(ab"; //Open end parenthesis
            // List<List<char>> result10 = RegGrouping.grouping(string10);
            // foreach (var group in result10)
            // {
            //     string groupString = string.Join("", group);
            //     Console.Write($"({groupString})");
            // }
            // Console.WriteLine();

            // string string11 = "ab)"; //Open first parenthesis
            // List<List<char>> result11 = RegGrouping.grouping(string11);
            // foreach (var group in result11)
            // {
            //     string groupString = string.Join("", group);
            //     Console.Write($"({groupString})");
            // }
            // Console.WriteLine();

            // string string12= "(a(ab)"; //nested and open end parenthesis
            // List<List<char>> result12 = RegGrouping.grouping(string12);
            // foreach (var group in result12)
            // {
            //     string groupString = string.Join("", group);
            //     Console.Write($"({groupString})");
            // }
            // Console.WriteLine();

            // string string13= "(((aaa"; //open nested and open end parenthesis
            // List<List<char>> result13 = RegGrouping.grouping(string13);
            // foreach (var group in result13)
            // {
            //     string groupString = string.Join("", group);
            //     Console.Write($"({groupString})");
            // }
            // Console.WriteLine();

        }
    }
}