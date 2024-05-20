using SME;

namespace sme_intro
{
    [InitializedBus]
    public interface Control : IBus
    {
        public bool Valid               { get; set; } //good idea - for hardware stuff
        public bool Reset               { get; set; }
        // public byte Character           { get; set; }
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
        public uint Count               { get; set; }
        public char[] start_state       { get; set; }
    }
}