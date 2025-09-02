const std = @import("std");

pub fn main() !void {
    const i: i32 = 5;
    const small_i: i8 = 5;

    std.debug.print("the pointer of i is {p} and the size is {d}\n", .{ &i, @sizeOf(i32) });

    std.debug.print("the pointer of i is {p} and the size is {d}\n", .{ &small_i, @sizeOf(i8) });
}
