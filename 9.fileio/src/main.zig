const std = @import("std");
const fs = std.fs;
const heap = std.heap;
const debug = std.debug;

pub fn main() !void {
    // create allocator
    var arenaAlloc = heap.ArenaAllocator.init(heap.page_allocator);
    var alloc = arenaAlloc.allocator();
    defer arenaAlloc.deinit();

    // open curent dir and open file in default mode (read only)
    const result = fs.cwd().openFile("test.txt", fs.File.OpenFlags{ .mode = .read_write });

    // check union error or File
    if (result) |testFile| {
        // error not managed but returned
        try manageFile(testFile, &alloc);
    } else |err| {
        // check different errors value and react
        switch (err) {
            error.FileNotFound => {
                debug.print("file not found, check name. error: {}\n", .{err});
            },
            else => debug.print("error occours: {}", .{err}),
        }
    }
}

fn manageFile(testFile: fs.File, alloc: *std.mem.Allocator) !void {
    const testFileSize = try testFile.getEndPos();
    const testFileBuf = try alloc.alloc(u8, testFileSize);
    const testFileReadSize = try testFile.readAll(testFileBuf);

    // reverse bytes
    var i = testFileReadSize - 1;
    var rb = try alloc.alloc(u8, testFileReadSize);
    while (i > 0) : (i -= 1) {
        const b = testFileBuf[i - 1];
        const ri = testFileReadSize - i - 1;
        rb[ri] = b;
    }

    try testFile.writeAll(rb);
    return;
}
