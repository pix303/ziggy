const std = @import("std");
const print = std.debug.print;
const strEql = std.mem.eql;

pub fn main() void {
    print("here we are\n", .{});
    print("check is minor {}\n", .{isMinor(4, 5)});
    const d = "sunday";
    print("check is in weekend: {s} --> {}\n", .{ d, isWeekendDay(d) });
    const d2 = "monday";
    print("check is in weekend: {s} --> {}\n", .{ d2, isWeekendDay(d2) });

    print("you are a {s}\n", .{getAgeEra(5)});
    print("you are a {s}\n", .{getAgeEra(55)});
    print("you are a {s}\n", .{getAgeEra(123)});

    var num: ?i32 = 677;
    print("var num {?}\n", .{num});
    num = 3;
    print("var num {?}\n", .{num});
    num = null;
    print("var num {?}\n", .{num});
}

fn isMinor(a: i32, b: i32) bool {
    if (a < b) {
        return true;
    } else {
        return false;
    }
}

fn isWeekendDay(day: []const u8) bool {
    if (strEql(u8, day, "saturday")) {
        return true;
    } else if (strEql(u8, day, "sunday")) {
        return true;
    } else {
        return false;
    }
}

fn getAgeEra(age: u8) []const u8 {
    switch (age) {
        0...3 => return "baby",
        4...17 => return "teen",
        18 => return "i'm eighteen!",
        19...30 => return "young",
        31...59 => return "adult",
        60...70 => return "the new adults",
        71...99 => return "old",
        else => return "sky is waiting for you",
    }
}
