// Med den her kan man også bruge group[i] som er godt til når man konverterer til C#/SME
using SME;

namespace sme_intro{
    public class RegGrouping{
        public List<string> Grouping(string regexp){
            int depth = 0; // For nested parentheses, count how many groups need to be closed
            List<string> grouping = new List<string>();
            string group = "";
            int stopklods = regexp.Length;  //Makes sure that the last group will be added

            foreach (char chr in regexp){
                if (chr == '(') {
                    depth ++;
                    if (group != ""){ // for the group that is outside a () will be added before resetting
                        grouping.Add(group);
                    }
                    group = ""; // Reset so that it wont continue a finished group, may have been done in elif, but may also not
                }
                else if (chr == ')'){
                    depth --;
                    if (group != ""){
                        grouping.Add(group); // slut på group, tilføj til grouping og nulstil
                    }
                    group = ""; // This group is done, so reset
                }
                else{
                    if (chr != ' '){ // makes sure space is ignored
                        group += chr;
                    }
                }
                if (stopklods == 1){ // Makes sure that the last group will be added if no parenthesis are found
                    if (depth != 0){
                        throw new Exception($"mismatch in parentheses in the regular expression: {regexp}");
                    }
                    if (group != ""){ //If there are no parentheses then this group is the last and only once stopklods = 1
                        grouping.Add(group);
                    }
                }
                stopklods --; 
             }
            return grouping;
        }
    }
}