const std = @import("std");

pub fn main() !void {
    // literal array explicit len
    const a1: [5]u8 = [5]u8{ 1, 2, 3, 4, 5 };
    std.debug.print("literal array values = {any} - len {d}\n", .{ a1, a1.len });

    // literal array inplicit len
    const a2 = [_]u8{ 1, 2, 3, 4, 5 };
    std.debug.print("literal array values = {any} - len {d}\n", .{ a2, a2.len });

    // init array with repeat **
    const a3 = [1]u8{0} ** 5;
    std.debug.print("array created by repeat values = {any} - len {d}\n", .{ a3, a3.len });

    // init array as undefined: which default falues?
    var a4: [2]u8 = undefined;
    std.debug.print("array created as undefined = {any} - len {d}\n", .{ a4, a4.len });
    a4[0] = 10;
    a4[1] = 22;
    std.debug.print("...then set the values by index = {any} - len {d}\n", .{ a4, a4.len });

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const alloc = gpa.allocator();
    defer _ = gpa.deinit();

    var al1 = try std.ArrayList(u8).initCapacity(alloc, 2);
    defer al1.deinit(alloc);

    try al1.append(alloc, 34);
    try al1.append(alloc, 33);
    try al1.append(alloc, 56);
    try al1.insert(alloc, 1, 66);

    for (al1.items, 0..) |v, i| {
        std.debug.print("arraylist at index {} value is {d}\n", .{ i, v });
    }
}
