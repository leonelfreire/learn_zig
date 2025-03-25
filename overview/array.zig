const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const a = [5]i32{ 1, 2, 3, 4, 5 };
    const b: [5]i32 = .{ 1, 2, 3, 4, 5 };
    const c = [_]i32{ 1, 2, 3, 4, 5 };
    const d = a[1..4];
    const e: []const i32 = a[1..4];

    print("{any} {any} {any}\n", .{ a, b, c });
    print("{any}\n", .{d});
    print("{any}\n", .{e});
}
