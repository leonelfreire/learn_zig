const std = @import("std");
const print = std.debug.print;

const user = @import("user.zig");
const User = user.User;
const MAX_POWER = user.MAX_POWER;

pub fn main() void {
    const usr = User{
        .power = 9001,
        .name = "Goku",
    };

    print("{s}'s power is {d}\n", .{ usr.name, usr.power });
}
