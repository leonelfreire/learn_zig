const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const s = "Leonel";
    const a: [3:false]bool = .{ true, true, true };

    print("{s}\n", .{std.mem.asBytes(s)});
    print("{any}\n", .{std.mem.asBytes(&a)});
}
