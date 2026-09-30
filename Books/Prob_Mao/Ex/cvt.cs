#!/usr/bin/env dotnet

using System.Text;

void cvt(string filePath)
{
    var lines = File.ReadAllLines(filePath);
    var sb = new StringBuilder();
    foreach(var line in lines)
    {
        var trim = line.Trim();
        if(trim.StartsWith("#v(") || trim.StartsWith("#pagebreak"))
        {
            if(trim != "#v(20pt)")
                continue;
        }
        sb.AppendLine(line);
    }
    var outfilePath = filePath + "_compact.typ";
    File.WriteAllText(outfilePath, sb.ToString());
}

cvt("02.typ");