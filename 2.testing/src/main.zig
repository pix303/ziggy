const std = @import("std");
const print = std.debug.print;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn sub(a: i32, b: i32) i32 {
    return a - b;
}

fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

pub fn main() void {
    print("add two number {d} and {d} result {d}", .{ 1, 2, add(1, 2) });
}

test "expect to add two numbers" {
    try std.testing.expect(add(1, 1) == 2);
    try std.testing.expect(add(1, 4) == 5);
}

test "expect to subtract two numbers" {
    try std.testing.expect(sub(1, 1) == 0);
}
test "expect to multiply two numbers" {
    try std.testing.expect(multiply(2, 2) == 4);
}
