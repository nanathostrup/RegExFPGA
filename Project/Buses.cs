using SME;

namespace sme_intro
{
    [InitializedBus]
    public interface Control : IBus
    {
        public bool Valid               { get; set; } //good idea - for hardware stuff
        public bool Reset               { get; set; }
        public int Length               { get; set; }
       
        [FixedArrayLength(1000)] //[FixedArrayLength(COLOR_WIDTH)]
        IFixedArray<char> Array         { get; set; }
    }

    [InitializedBus]
    public interface Count : IBus
    {
        public uint Count               { get; set; }
        public uint CompareCharacter    { get; set; }
    }
    [InitializedBus]
    public interface Traversal : IBus
    {
        public bool Valid               { get; set; }
    }
}