REM Windows batch script to run Bayes Traits for multiple data sets in a directory
FOR %%s IN (data.*.txt) DO BayesTraits.exe UCNucleotideTreeDistanceHKY.tre %%~ns.txt <commands.txt >> scriptout.txt
