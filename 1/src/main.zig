const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const str = "ciao";
    var num: i32 = 45;
    num += 45;

    print("print something but with no values\n", .{});
    print("print something with string value = {s}\n", .{str});
    print("print a value {d}\n", .{num});
    print("print the type {any} and the value {d}\n", .{ @TypeOf(num), num });

    var px: i32 = undefined;
    var py: i32 = undefined;

    const tupla = .{ 23, 43 };
    px, py = tupla;
    print("print point coords: {d} - {d}\n", .{ px, py });

    const coords_array: [2]i32 = [2]i32{ 3, 4 };
    px, py = coords_array;
    print("print point coords: {d} - {d}\n", .{ px, py });

    const coords_vector: @Vector(2, i32) = .{ 33, 33 };
    px, py = coords_vector;
    print("print point coords: {d} - {d}\n", .{ px, py });
}
