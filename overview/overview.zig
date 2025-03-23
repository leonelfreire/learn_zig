const std = @import("std");
const print = std.debug.print;

const _user = @import("user.zig");
const User = _user.User;
const MAX_POWER = _user.MAX_POWER;

pub fn main() void {
    const user = User.init("Goku", 9001);

    print("{s}'s power is {d}\n", .{ user.name, user.power });
    user.diagnose();
    User.diagnose(user);
}
