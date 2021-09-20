using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Antlr4.Runtime.Tree;
using NUnit.Framework;


namespace codeanalyze.test
{
    internal class CommonParserTests
    {

        bool FoundUparsed = false;
        private bool ShowAdditionalInfo = false;

        [TestCaseSource(nameof(GetValidTestCases), Category = "ValidParserTests")]
        public void RunValidParserTests(string path)
        {
            var files = Directory.GetFiles(path, "*.sql").ToArray().OrderBy(file => file);
            var durations = new SortedList<long, string>();
            Assert.Multiple(() =>
            {
                long totalSize = 0;
                long totalPassed = 0;
                int passed = 0, failed = 0;
                //                    ph.Parser.Interpreter.PredictionMode = PredictionMode.SLL;
                foreach (var fname in files)
                {
                    var sw = new Stopwatch();
                    string text = File.ReadAllText(fname);
                    long size = new FileInfo(fname).Length;
                    totalSize += size;
                    var grammar = PostgreSQLParser.getPostgreSQLParser(text);
                    sw.Reset();
                    sw.Start();
                    IParseTree tree = grammar.Root;
                    sw.Stop();
                    totalPassed += sw.ElapsedMilliseconds;
                    Assert.That(grammar.ParseErrors.Count == 0, $"{Path.GetFileName(fname)} Found unparsed");
                    //                        Assert.Warn($"{size*1000.0/sw.ElapsedMilliseconds/1024:0,0.0} {size} Kb/Sec {sw.Elapsed} Duration: {Path.GetFileName(fname)}" );
                    durations[-sw.ElapsedMilliseconds] = Path.GetFileName(fname);
                    if (grammar.ParseErrors.Count == 0)
                    {
                        passed++;
                    }
                    else
                    {
                        failed++;
                    }

                }

                if (ShowAdditionalInfo)
                {
                    for (int i = 0; i < durations.Count && i < 5; i++)
                    {
                        Assert.Warn($"{-durations.Keys[i]:0,0.0}:{durations.Values[i]}");
                    }

                    Assert.Warn($"{totalSize} TotalSize {totalPassed} Duration");
                    Assert.Warn($"{totalSize * 1000.0 / totalPassed / 1024:0,0.0} Kb/sec");
                    Assert.Warn($"{failed} Failed, {passed} Passed");
                }
            }
            );

        }

        private static IEnumerable<TestCaseData> GetValidTestCases()
        {

            var testPath = @"..\..\..\sql";
            var basePath = Path.GetFullPath(testPath);
            var basePathLen = basePath.Length;
            var folders = Directory.GetDirectories(basePath, "*.*", SearchOption.AllDirectories).ToArray().OrderBy(folder => folder.ToUpper());
            foreach (var folder in folders)
            {
                var f = Path.GetFullPath(folder);
                f = f.Substring(basePathLen + 1);
                f = f.Replace(@".", "_");
                f = f.Replace(@"\", ".");
                var tcd = new TestCaseData(folder) { TestName = f.ToLowerInvariant() };
                tcd.SetDescription(f.ToLowerInvariant());
                yield return tcd;
            }
            //var files = Directory.GetFiles(basePath, "*.sql", SearchOption.AllDirectories).ToArray().OrderBy(f => f);
            //foreach (var file in files)
            //{
            //    var f = Path.GetFullPath(file);
            //    f = f.Substring(basePathLen + 1);
            //    f = f.Replace(@"\", ".");
            //    f = f.Substring(0, f.Length - 4);
            //    var tcd = new TestCaseData(file) { TestName = f/*Path.GetFileNameWithoutExtension(file)*/};
            //    //                tcd.SetCategory("ParserTest");
            //    yield return tcd;
            //}
        }

    }
}
