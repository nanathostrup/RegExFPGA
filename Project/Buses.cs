using SME;

namespace nfa_dfa
{
    public interface Control : IBus
    {
        [InitialValue(false)]
        public bool Valid               { get; set; } //good idea - for hardware to know this signal is valid
        [InitialValue(false)]
        public bool Reset               { get; set; }
        [InitialValue(0)]
        public int Length               { get; set; }
       
        [FixedArrayLength(1000)]
        IFixedArray<byte> Array         { get; set; }
    }
    [InitializedBus]
    public interface Traversal : IBus
    {
        public bool Valid               { get; set; }
    }
}