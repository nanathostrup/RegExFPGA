using SME;

namespace sme_intro{

    // [ClockedProcess]
    public class DFA{ //: SimpleProcess
    // {
    //     [InputBus]
    //     public Control control;

    //     [OutputBus]
    //     public Count count = Scope.CreateBus<Count>();
        public List<string> states;
        // public List<string> alphabet;
        public HashSet<char> alphabet; //Maybe a list instead?
        public List<List<string>> transitions;
        // public List<string> start_state; //can be extended to have several, but i dont see the point? Is there ever more start states? There should only be one?
        public string start_state;
        public List<string> accept_states;




    }
}