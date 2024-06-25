
namespace nfa_dfa{
public class DFA {
    public (byte, byte[], byte[], byte[], byte[]) FromNFA(NFA nfa) {
        List<List<string>> states = new List<List<string>>();
        List<string> alphabet = new List<string>();
        List<List<string>> transitions = new List<List<string>>();
        List<string> start_state = new List<string>();
        List<string> accept_states = new List<string>();

        int state_counter = 0;
        bool in_accepting = false;
        List<string> newList = new List<string>();

        // Making the alphabet
        foreach (var symbol in nfa.alphabet) {
            if (symbol != "eps") {
                alphabet.Add(symbol);
            }
        }

        // Epsilon closure for the startstate of nfa, initializing/starting the dfa
        newList.Add(nfa.states[0]);
        (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);

        // New state, transition, and accepting added to dfa
        string new_state = "s" + state_counter++;
        List<string> insert = new List<string> { string.Join(",", newList), new_state };
        states.Add(insert);
        start_state.Add(new_state);

        if (in_accepting) {
            accept_states.Add(new_state);
        }

        // Making a stack with the states to go through
        Stack<List<string>> stack = new Stack<List<string>>();
        stack.Push(insert);

        while (stack.Count > 0) {
            var dfa_state = stack.Pop();
            foreach (var symbol in alphabet) {
                newList = new List<string>();
                in_accepting = false;

                // Move function
                foreach (var transition in nfa.transitions) {
                    if (dfa_state[0].Split(',').Contains(transition[0]) && transition[1] == symbol) {
                        if (!newList.Contains(transition[2])) {
                            newList.Add(transition[2]);
                        }
                    }
                }

                (newList, in_accepting) = EpsilonClosure(nfa, newList, in_accepting);
                
                foreach (var state in newList){
                    if (nfa.accept_states.Contains(state)){
                        in_accepting = true;
                    }
                } 


                if (newList.Any()) {
                    string from_state = dfa_state[1];
                    string to_state = "";
                    string stringList = string.Join(",", newList);

                    var existingState = states.FirstOrDefault(s => s[0] == stringList);
                    if (existingState != null) {
                        to_state = existingState[1];
                    } else {
                        new_state = "s" + state_counter++;
                        to_state = new_state;
                        List<string> newDFAState = new List<string> { stringList, new_state };
                        states.Add(newDFAState);
                        stack.Push(newDFAState);

                        if (in_accepting) {
                            accept_states.Add(new_state);
                        }
                    }

                    transitions.Add(new List<string> { from_state, symbol, to_state });
                }
            }
        }

    // transform the elements to char and then bytes before returning
        char[] transformedStart = transformStartState(start_state);
        byte byteStart = byteTransformStartState(transformedStart);
    
        char[] transformedAccept = transformAcceptStates(accept_states);
        byte[] byteAccept = byteTransformAccepStates(transformedAccept);
    
        char[] transformedStates = transformStates(states);
        byte[] byteStates = byteTransformStates(transformedStates);

        char[] transformedAlphabet = transformAlphabet(alphabet);
        byte[] byteAlphabet = byteTransformAlphabet(transformedAlphabet);

        char[][] transformedTrans = transformTransitions(transitions);
        byte[][] byteTransitions = byteTransformTransitions(transformedTrans);
        byte[] flat = flatten(byteTransitions);
        
        return (byteStart, byteAccept, byteStates, byteAlphabet, flat);
    }    

    // private (List<string>, bool) EpsilonClosure(NFA nfa, List<string> newList, bool in_accepting){
    //     foreach (var state in newList){
    //         foreach (var transition in nfa.transitions){
    //             if (transition[1] == "eps" && transition[0] == state && !newList.Contains(transition[2])){
    //                 newList.Add(transition[2]);
    //             }
    //         }
    //         //if any state in nfa in this list is accepting then the dfa state should be accepting
    //         if (newList.Any(states => nfa.accept_states.Contains(state))){ //could be moved to another method
    //             in_accepting = true;
    //         }
    //     }
    //     return (newList, in_accepting);
    // }
    
    private (List<string>, bool) EpsilonClosure(NFA nfa, List<string> newList, bool in_accepting) {
        Queue<string> queue = new Queue<string>(newList);
        HashSet<string> visited = new HashSet<string>(newList);

        while (queue.Count > 0) {
            var state = queue.Dequeue();
            foreach (var transition in nfa.transitions) {
                if (transition[1] == "eps" && transition[0] == state && !visited.Contains(transition[2])) {
                    newList.Add(transition[2]);
                    queue.Enqueue(transition[2]);
                    visited.Add(transition[2]);
                }
            }

            if (nfa.accept_states.Contains(state)) {
                in_accepting = true;
            }
        }

        return (newList, in_accepting);
    }
    static char[] transformAlphabet(List<string> alphabet){
        char[] array = new char[alphabet.Count];
        for (int i = 0; i < alphabet.Count; i++){
            foreach (char chr in alphabet[i]){
                array[i] = chr;
            }
        }
        return array;
    }
    static byte[] byteTransformAlphabet(char[] alphabet){
        byte[] array = new byte[alphabet.Length];
        for (int i = 0; i < alphabet.Length; i++){
            array[i] = (byte)alphabet[i];
        }
        return array; 
    }

    static char[] transformStartState(List<string> start_state){
        char[] array = new char[1];
        char save = 's';
        for (int i = 0; i < start_state.Count; i++){
            foreach (char chr in start_state[i]){
                save = chr; //exclude 's' in 's0'
            }
        } 
        array[0] = save;
        return array;
    }
    static byte byteTransformStartState(char[] start_state){
        byte[] array = new byte[1];
        char save = 's';
        for (int i = 0; i < start_state.Length; i++){
            save = start_state[i];
        } 
        return (byte)save;
        // array[0] = (byte)save;
        // return array;
    }

    static char[] transformAcceptStates(List<string> accept_states){
        char[] array = new char[accept_states.Count];
        char save = ' ';
        for (int i = 0; i < accept_states.Count; i++){
            foreach (char chr in accept_states[i]){
                save = chr; //exclude 's' in 's0'
            }
            array[i] = save;
        }
        return array;
    }
    static byte[] byteTransformAccepStates(char[] accept_states){
        byte[] array = new byte[accept_states.Length];
        for (int i = 0; i < accept_states.Length; i++){
            array[i] = (byte)accept_states[i];
        }
        return array;
    }

    static char[] transformStates(List<List<string>> states){
        char[] array = new char[states.Count];
        for (int i = 0; i < states.Count; i++){
            string dfa = states[i][1];
            array[i] = dfa[dfa.Length - 1];
        }
        return array;
    }
    static byte[] byteTransformStates(char[] charArray){
        byte[] byteArray = new byte[charArray.Length];
        for (int i = 0; i < charArray.Length; i++){
            byteArray[i] = (byte)charArray[i]; // Convert each char to byte
        }
        return byteArray;
    }

    static char[][] transformTransitions(List<List<string>> transitions){
        char[][] transformedTransitions = new char[transitions.Count][];
        for (int i = 0; i < transitions.Count; i++){
            string to = transitions[i][0];
            char symbol = transitions[i][1][0];
            string from = transitions[i][2];

            // Remove 's' from 'to' and 'from'
            char toChar = to[to.Length - 1];
            char fromChar = from[from.Length - 1];

            transformedTransitions[i] = new char[] { toChar, symbol, fromChar };
        }
        return transformedTransitions;
    }
    static byte[][] byteTransformTransitions(char[][] charArray) {
        byte[][] byteArray = new byte[charArray.Length][];
        for (int i = 0; i < charArray.Length; i++) {
            byteArray[i] = new byte[charArray[i].Length];
            for (int j = 0; j < charArray[i].Length; j++) {
                byteArray[i][j] = (byte)charArray[i][j]; // Convert each char to byte
            }
        }
        return byteArray;
    }

    static byte[] flatten(byte[][] array){
        int totalLength = 0;
        foreach (var subArray in array){
            totalLength += subArray.Length;
        }

        byte[] flattenedArray = new byte[totalLength];
        int currentIndex = 0;

        foreach (var subArray in array){
            Array.Copy(subArray, 0, flattenedArray, currentIndex, subArray.Length);
            currentIndex += subArray.Length;
        }
        return flattenedArray;
        }
    }
}
