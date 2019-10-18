import std.stdio : writeln, writefln;
import std.conv : to, ConvException;
import std.algorithm.searching : canFind;

int main(const string[] arg)
{
    if (arg.length != 2) {
    	writeln("USAGE:");
        writefln("%s base", arg[0]);
        return 1;
    }
    int base;
    try {
        base = to!int(arg[1]);
    }
    catch (ConvException e) {
    	writeln("USAGE:");
        writefln("%s base", arg[0]);
        return 1;    	  
    }
    int nb_line = 0;
    string[] lines;
    
    foreach (int i; 0..base) {
        writefln("table for %d", i);
        foreach (int j; 0..base) {
            string line;
            if (i > j)
                line = to!string(j) ~ " * " ~ to!string(i);
            else
                line = to!string(i) ~ " * " ~ to!string(j);
            if (!lines.canFind(line)) {
            	lines ~= line;
            }
            writefln("%d * %d", i, j);
            nb_line += 1;
        }
    }
    writefln("there is %d lines", nb_line);
    writeln();
    foreach (string s; lines) {
        writeln(s);
    }
    writefln("there is %d unique lines", lines.length);
    return 0;
}
