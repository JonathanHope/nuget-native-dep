using Xunit;
using HelloSharp;

namespace HelloSharp.Tests;

public class HelloTests
{
    [Fact]
    public void PrintsHelloWorld()
    {
        Assert.Equal("Hello World!", Hello.HelloWorld());
    }
}