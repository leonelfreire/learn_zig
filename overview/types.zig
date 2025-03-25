const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const a = [_]i32{ 1, 2, 3, 4, 5 };
    var end: usize = 4;
    end += 1;
    const b = a[1..end];

    print("{any}\n", .{@TypeOf(a)});
    print("{any}\n", .{@TypeOf(b)});
}
