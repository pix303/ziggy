const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const gpaConf = std.heap.GeneralPurposeAllocatorConfig{ .thread_safe = true, .safety = true };
    const gpa = std.heap.GeneralPurposeAllocator(gpaConf){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const pnum = try allocator.alloc(i32, 3);
    defer allocator.free(pnum);

    pnum.* = 56;
    print("da da da .{d}", pnum);
}
