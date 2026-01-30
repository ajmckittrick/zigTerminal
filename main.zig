const std = @import("std");

pub fn main() !void {

    //Setup stdout
    var stdoutWriter = std.fs.File.stdout().writer(&.{});
    const stdout = &stdoutWriter.interface;

    //Setup stdin
    var stdinBuff: [1024]u8 = undefined;
    var stdinReader = std.fs.File.stdin().reader(&stdinBuff);
    const stdin = &stdinReader.interface;

    _ = stdout;
    _ = stdin;

    return;
}
