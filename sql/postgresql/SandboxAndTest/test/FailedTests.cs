using System.Collections.Generic;
using System.IO;
using Antlr4.Runtime.Tree;
using NUnit.Framework;

namespace codeanalyze.test
{
    internal class FailedTests
    {
        bool FoundUparsed = false;

        [TestCaseSource(nameof(GetInvalidParserCases))]
        public void RunFailedParserTests(string fname)
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

        private static IEnumerable<TestCaseData> GetInvalidParserCases()
        {
            var files = Directory.GetFiles(@"parsertest.failed", "*.sql");
            foreach (var file in files)
            {
                yield return new TestCaseData(file) { TestName =  Path.GetFileNameWithoutExtension(file) };
            }
        }

    }
}