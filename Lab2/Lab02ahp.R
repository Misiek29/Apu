library(ahp)
library(data.tree)
setwd("F:/MAGAZYN/ATH/MAGISTERKA/Uczenie maszynowe/Repo/Lab02")
treeAhp <- Load("tree_design.yml")

print(treeAhp, filterFun = isNotLeaf)

Calculate(treeAhp)
print(treeAhp, priority = function(x) x$parent$priority["Total", x$name])
Visualize(treeAhp)
Analyze(treeAhp)
AnalyzeTable(treeAhp)