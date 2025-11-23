const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const gpaConf = std.heap.GeneralPurposeAllocatorConfig{ .thread_safe = true, .safety = true };
    var gpa = std.heap.GeneralPurposeAllocator(gpaConf){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();
    const pnum = try allocator.alloc(i32, 3);
    defer allocator.free(pnum);

    pnum[0] = 56;
    pnum[1] = 256;
    pnum[2] = 156;
    print("da da da {d}\n", .{pnum[0]});
    print("da da da {d}\n", .{pnum[1]});
    print("da da da {d}\n", .{pnum[2]});
}
