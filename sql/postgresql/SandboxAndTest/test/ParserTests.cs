using System.Collections.Generic;
using System.IO;
using Antlr4.Runtime.Tree;
using NUnit.Framework;

namespace codeanalyze.test
{
    internal class ParserTests
    {

        bool FoundUparsed = false;

        [TestCaseSource(nameof(GetValidTestCases),Category ="ValidParserTests")]
        public void RunValidParserTests(string fname)
        {
            string text = File.ReadAllText(fname);
            var grammar = PostgreSQLParser.getPostgreSQLParser(text);
            IParseTree tree = grammar.Root;
            Assert.Multiple(() =>
                {
                    foreach (var e in grammar.ParseErrors)
                    {
                        Assert.Fail($"Found unparsed at {e.Line}:{e.Column} {e.Message}");
                    }
                }
            );
        }

        private static IEnumerable<TestCaseData> GetValidTestCases()
        {
            var files = Directory.GetFiles(@"parsertest","*.sql");
            foreach (var file in files)
            {
                yield return new TestCaseData(file) { TestName = Path.GetFileNameWithoutExtension(file)};
            }
        }

    }
}
