using System.Buffers;
using System.Runtime.InteropServices;

namespace HelloSharp
{
  public static class Hello
  {
    public static string HelloWorld()
    {
      var bufferSize = 200u;
      var buffer = ArrayPool<byte>.Shared.Rent((int)bufferSize);
      try
      {
        HelloWorld(buffer, bufferSize);
        return BufferToString(buffer);
      }
      finally
      {
        ArrayPool<byte>.Shared.Return(buffer, true);
      }
    }

    [DefaultDllImportSearchPaths(DllImportSearchPath.SafeDirectories)]
    [DllImport("libhello", CharSet = CharSet.Ansi, BestFitMapping = false, ThrowOnUnmappableChar = true)]
    internal static extern void HelloWorld(byte[] buffer, uint bufferSize);

    private static string BufferToString(byte[] buffer)
    {
      var handle = GCHandle.Alloc(buffer, GCHandleType.Pinned);
      try
      {
        return Marshal.PtrToStringAnsi(handle.AddrOfPinnedObject());
      }
      finally
      {
        handle.Free();
      }
    }
  }
}