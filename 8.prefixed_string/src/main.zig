// prefixed string length
// |LLLL|String Value...
// 10ABCDEFGHIL

const std = @import("std");

fn fill_string(allocator: Allocator, len: u8, value: []const u8) *[]u8 {
    var ga = std.heap.GeneralPurposeAllocator(.{}){};
    const malloc = ga.allocator();
}

pub fn main() !void {
    var ga = std.heap.GeneralPurposeAllocator(.{}){};
    const malloc = ga.allocator();
    defer _ = ga.deinit();

    var bytes = try malloc.alloc(u8, 4);
    defer malloc.free(bytes);

    bytes[0] = 'H';
    bytes[1] = 'e';
    bytes[2] = 'l';
    bytes[3] = 'l';
    std.debug.print("{s}", .{bytes});
}
