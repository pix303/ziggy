const std = @import("std");

const string = []const u8;

pub const Item = struct {
    name: string,
    desc: string,
    price: f32,

    pub fn init() Item {
        return Item{
            .name = "",
            .desc = "",
            .price = 0,
        };
    }

    pub fn toString(self: @This(), allocator: std.mem.Allocator) ![]u8 {
        const v = std.fmt.allocPrint(allocator, "{s} ({s}: {d} Eur)", .{ self.name, self.desc, self.price });
        return v;
    }
};

pub fn parseBuffer(buffer: []u8, items: *std.ArrayList(Item), allocator: std.mem.Allocator) !void {
    var splitter = std.mem.splitScalar(u8, buffer, '\n');
    while (splitter.next()) |row| {
        if (row.len > 0) {
            var valuesSplitter = std.mem.splitScalar(u8, row, ';');
            var idx: u8 = 0;
            var item: Item = Item.init();
            while (valuesSplitter.next()) |value| {
                switch (idx) {
                    0 => item.name = value,
                    1 => item.desc = value,
                    2 => item.price = std.fmt.parseFloat(f32, value) catch 0,

                    else => std.debug.print("no value to match", .{}),
                }
                idx += 1;
            }
            try items.append(allocator, item);
        }
    }
}
