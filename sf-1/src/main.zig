const std = @import("std");
const fmt = std.fmt;
const print = std.debug.print;
const allocator = std.heap.page_allocator;

fn sum(a: i8, b: i8) i8 {
    return a + b;
}

fn println(msg: []u8) void {
    print("{s}\n", .{msg});
}

var i: i8 = 10;
fn increment() void {
    i += 1;
}

// without pointers, pass by value
fn incr1(a: i8) i8 {
    const r = a + 1;
    return r;
}

fn incr2(a: *i8) void {
    a.* += 1;
}

// escape to simulate a command clear for terminal inspected with hex -C
fn cls() void {
    print("\x1B[H\x1B[2J\x1B[3J\n", .{});
}

pub fn main() !void {
    // cls();
    const res = try fmt.allocPrint(allocator, "somma di 1 + 2: {d}", .{sum(1, 2)});
    defer allocator.free(res);
    println(res);

    increment();
    increment();
    increment();
    print("by global  {d}\n", .{i});

    var a: i8 = 10;
    a = incr1(a);
    print("by value   {d}\n", .{a});

    var b: i8 = 10;
    incr2(&b);
    print("by pointer {d}\n", .{b});

    const c: u8 = 'B';
    print("[{c}{c}{c}]\n", .{ c, 65, 66 });

    const ac = [_]u8{ 67, 69, 67, 67, 'h', 'm' };
    print("{s}\n", .{ac});
}
