const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const sum = add(8999, 2);
    print("Sum: {d}\n", .{sum});
}

fn add(a: i64, b: i64) i64 {
    return a + b;
}
