@echo off
java.exe -jar antlr-4.9.2-complete.jar -o . PostgreSQLLexer.g4 PostgreSQLParser.g4  2>&1 
rem "C:\Program Files (x86)\Java\jre1.8.0_261\bin\java.exe" -jar antlr-4.8-complete.jar -o . pg_grammar_original.g4 > a 2>&1 
rem gplex.exe /noparser pgplsqllexer.l 2>&1



