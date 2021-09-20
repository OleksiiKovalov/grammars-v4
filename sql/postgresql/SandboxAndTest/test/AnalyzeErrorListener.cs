using System;
using System.IO;
using Antlr4.Runtime;

namespace codeanalyze.test
{
    internal class AnalyzeErrorListener : BaseErrorListener
    {
        public AnalyzeErrorListener()
        {
        }
        public override void SyntaxError(TextWriter output, IRecognizer recognizer, IToken offendingSymbol, int line, int charPositionInLine, string msg, RecognitionException e)
        {
            //if (msg.StartsWith("mismatched input '$'")) return;
            throw new Exception($"{line}:{charPositionInLine} {offendingSymbol} {msg}");
        }
    }
}