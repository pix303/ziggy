const std = @import("std");

pub fn main() !void {
    const i: i32 = 5;
    const small_i: i8 = 5;

    std.debug.print("the pointer of i is {p} and the size of i is {d}\n", .{ &i, @sizeOf(i32) });
    std.debug.print("the int of pointer of i is {d} and the type of i is {}\n", .{ @intFromPtr(&i), @TypeOf(i) });
    std.debug.print("the pointer of small_i is {p} and the size of small_i is {d}\n", .{ &small_i, @sizeOf(i8) });
    std.debug.print("\n\n", .{});

    var num: i32 = 777;
    var pnum: *i32 = undefined;

    std.debug.print("the value of num is: {d}\n", .{num});
    pnum = &num;
    std.debug.print("the pointer address to num is: {p}\n", .{pnum});
    pnum.* = 555;
    std.debug.print("now the new value of num is: {d}\n", .{num});
    std.debug.print("now the new value of pnum is: {d}\n", .{pnum.*});
    std.debug.print("\n\n", .{});

    var b: bool = false;
    var pb: *bool = undefined;
    pb = &b;
    pb.* = true;
    std.debug.print("the value of b is: {any}\n", .{b});
    std.debug.print("\n\n", .{});

    const str: []const u8 = "ciao";
    std.debug.print("the pointer of str is {*} and the length is {} of type {}\n", .{ str.ptr, str.len, @TypeOf(str) });
    std.debug.print("the pointer of str is {*} and the value is {s}\n", .{ str.ptr, str });
    std.debug.print("the pointer of str is {*} and the value is {c}\n", .{ &str.ptr[1], str.ptr[1] });
    std.debug.print("the pointer of str is {*} and the value is {c}\n", .{ &str.ptr[2], str.ptr[2] });
    std.debug.print("the pointer of str is {*} and the value is {c}\n", .{ &str.ptr[3], str.ptr[3] });
}
