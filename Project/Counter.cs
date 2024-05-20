// using SME;

// namespace sme_intro
// {
//     [ClockedProcess]
//     public class Counter : SimpleProcess
//     {
//         [InputBus]
//         public Control control;

//         [OutputBus]
//         public Count count = Scope.CreateBus<Count>();
//         private uint internal_count = 0;

//         protected override void OnTick()
//         {
//             Console.WriteLine("counter");
//             //Count();
//             //call function here
//             count.CompareCharacter = 97;
//             if (control.Reset)
//             {
//                 internal_count = 0;
//             }
//             else if (control.Valid && count.CompareCharacter == control.Character) //control.Char = the current char, count.Comp = the char to search for (initialized in tester)
//             {
//                 internal_count++;
//             }
//             count.Count = internal_count;
            
//             Console.WriteLine(":)");
//         }
//         // public int Count(int character){
//         //     if (control.Reset)
//         //     {
//         //         internal_count = 0;
//         //     }
//         //     else if (control.Valid && count.CompareCharacter == character) //control.Char = the current char, count.Comp = the char to search for (initialized in tester)
//         //     {
//         //         internal_count++;
//         //     }
//         //     return internal_count;
//         // }

//     }
// }