using SME;

namespace sme_intro
{
    [InitializedBus]
    public interface Control : IBus
    {
        public bool Valid               { get; set; }
        public bool Reset               { get; set; }
        public byte Character           { get; set; }
    }

    [InitializedBus]
    public interface Buffer : IBus
    {
        //public List<byte>() Buffer;        //{ get; set; }
        //public Buffer<byte>();// Buffer;// = new List<byte>();

        //public byte[] Buff              { get; set; }
        //public byte<buffer> buffer      { get; set; };
        List<byte> Buff                 { get; set; }

    }
    public interface Count : IBus
    {
        public uint Count               { get; set; }
        public uint CompareCharacter    { get; set; }
    }
    public interface OrCounter : IBus
    {
        public uint Counter             { get; set; }
        public uint Comparison0         { get; set; }
        public uint Comparison1         { get; set; }
        public bool Status              { get; set; }
    }
}