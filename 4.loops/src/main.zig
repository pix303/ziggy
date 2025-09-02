const std = @import("std");
const print = std.debug.print;

fn looprecursive(source: []const u8, start: u8, end: u8) void {
    if (start > end)
        return;
    print("the char at {d} is {c}\n", .{ start, source[start] });
    looprecursive(source, start + 1, end);
}

pub fn main() void {
    const s: []const u8 = "ciaone";

    print("--- loop all string\n", .{});
    for (s, 0..) |singleChar, idx| {
        print("the char at {d} is {c}\n", .{ idx, singleChar });
    }

    print("--- loop from 0 to 4 of string\n", .{});
    for (0..4) |idx| {
        print("the char at {d} is {c}\n", .{ idx, s[idx] });
    }

    const sl = s.len;
    print("--- loop from 0 to string len of string\n", .{});
    for (0..sl) |idx| {
        print("the char at {d} is {c}\n", .{ idx, s[idx] });
    }

    print("--- loop with while of string\n", .{});
    var i: u8 = 0;
    while (i < s.len) {
        print("the char at {d} is {c}\n", .{ i, s[i] });
        i += 1;
    }

    print("--- loop with condition to break at 'o'\n", .{});
    for (s, 0..) |singleChar, idx| {
        if (singleChar == 'o') {
            break;
        }
        print("the char at {d} is {c}\n", .{ idx, singleChar });
    }

    print("--- print with recursion\n", .{});
    looprecursive(s, 0, s.len - 1);
}
