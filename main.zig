const std = @import("std");

fn getArgv(alloc: std.mem.Allocator) [*][:0]const u8 {
    var args = try std.process.argsWithAllocator(alloc);
    var argsString: [*][:0]const u8 = undefined;
    while (args.next()) |arg| {
        argsString[0] = arg;
    }

    return argsString;
}

pub fn main() !void {

    //Setup allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = arena.allocator();
    defer arena.deinit();

    //Setup stdout
    var stdoutWriter = std.fs.File.stdout().writer(&.{});
    const stdout = &stdoutWriter.interface;

    //Setup stdin
    var stdinBuff: [1024]u8 = undefined;
    var stdinReader = std.fs.File.stdin().reader(&stdinBuff);
    const stdin = &stdinReader.interface;

    //Get args
    const args = getArgv(allocator);

    try stdout.print("I recieved {s}\n", .{args});
    _ = stdin;

    return;
}
