const std = @import("std");
const fs = std.fs;
const heap = std.heap;
const print = std.debug.print;
const csvlib = @import("csvlib");

pub fn main() !void {
    print("start reading csv source\n", .{});

    var arenaAlloc = heap.ArenaAllocator.init(heap.page_allocator);
    var alloc = arenaAlloc.allocator();
    defer arenaAlloc.deinit();

    const csvSource = try fs.cwd().openFile("test.csv", fs.File.OpenFlags{ .mode = .read_only });
    const csvSize = try csvSource.getEndPos();
    const csvBuf = try alloc.alloc(u8, csvSize);
    _ = try csvSource.readAll(csvBuf);
    defer csvSource.close();

    var items = try std.ArrayList(csvlib.Item).initCapacity(alloc, 3);
    defer items.deinit(alloc);

    try csvlib.parseBuffer(csvBuf, &items, alloc);

    for (items.items) |item| {
        const tmp = try item.toString(alloc);
        print("{s}\n", .{tmp});
    }
}
