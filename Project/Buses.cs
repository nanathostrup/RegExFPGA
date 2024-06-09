using SME;

namespace sme_intro
{
    public interface Control : IBus
    {
        [InitialValue(false)]
        public bool Valid               { get; set; } //good idea - for hardware stuff
        [InitialValue(false)]
        public bool Reset               { get; set; }
        [InitialValue(0)]
        public int Length               { get; set; }
       
        [FixedArrayLength(1000)] //[FixedArrayLength(COLOR_WIDTH)]
        IFixedArray<byte> Array         { get; set; }
    }
    [InitializedBus]
    public interface Traversal : IBus
    {
        public bool Valid               { get; set; }
    }
}