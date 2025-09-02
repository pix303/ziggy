// build an array with value repetition
// const a = [_]bool{true} ** 10; // tutti true
// for (a, 0..) |ai, i| {
//     std.debug.print("- {d}: {any}\n", .{ i, ai });
// }

const std = @import("std");
const size = 20;
const Matrix = [size][size]bool;
const Neighbours = [8]bool;
pub fn main() void {
    var matrix = buildMatrix();
    while (true) {
        std.debug.print("\x1B[2J\x1B[H", .{});

        matrix = bringToLife(matrix);
        for (matrix) |row| {
            for (row) |cell| {
                const render: u8 = if (cell) 0x30 else 0x20;
                std.debug.print("{c}", .{render});
            }
            std.debug.print("\n", .{});
        }
        std.time.sleep(0.5 * std.time.ns_per_s);
    }
}

// Any live cell with fewer than two live neighbors:  Dies (underpopulation)
// Any live cell with two or three live neighbors:    Survives to the next generation
// Any live cell with more than three live neighbors: Dies (overpopulation)
// Any dead cell with exactly three live neighbors:   Becomes a live cell (reproduction)

fn bringToLife(matrix: Matrix) Matrix {
    var result = matrix;
    for (0..size) |ridx| {
        for (0..size) |cidx| {
            const ri: isize = @as(isize, @intCast(ridx));
            const ci: isize = @as(isize, @intCast(cidx));
            const ns: Neighbours = getNeighbours(matrix, ri, ci);
            const lns = numLive(ns);

            if (lns < 2) {
                result[ridx][cidx] = false;
            }

            if ((lns == 2 or lns == 3) and result[ridx][cidx]) {
                result[ridx][cidx] = true;
            }

            if (lns == 3 and result[ridx][cidx] == false) {
                result[ridx][cidx] = true;
            }

            if (lns > 3) {
                result[ridx][cidx] = false;
            }
        }
    }
    return result;
}

fn numLive(ns: Neighbours) u8 {
    var c: u8 = 0;
    for (ns) |n| {
        if (n) {
            c += 1;
        }
    }
    return c;
}

fn getNeighbours(matrix: Matrix, ridx: isize, cidx: isize) Neighbours {
    const tl = safeGet(matrix, ridx - 1, cidx - 1);
    const tc = safeGet(matrix, ridx - 1, cidx);
    const tr = safeGet(matrix, ridx - 1, cidx + 1);

    const bl = safeGet(matrix, ridx + 1, cidx - 1);
    const bc = safeGet(matrix, ridx + 1, cidx);
    const br = safeGet(matrix, ridx + 1, cidx + 1);

    const cl = safeGet(matrix, ridx, cidx - 1);
    const cr = safeGet(matrix, ridx, cidx + 1);

    return [8]bool{ tl, tc, tr, cr, br, bc, bl, cl };
}

fn safeGet(matrix: Matrix, ridx: isize, cidx: isize) bool {
    if (ridx < 0 or cidx < 0) return false;
    if (ridx > matrix.len - 1 or cidx > matrix.len - 1) return false;
    const ri = @as(usize, @intCast(ridx));
    const ci = @as(usize, @intCast(cidx));
    return matrix[ri][ci];
}

fn buildMatrix() Matrix {
    var r = Matrix{
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
        [_]bool{false} ** size,
    };
    r[4][5] = true;
    r[5][4] = true;
    r[5][5] = true;
    r[5][6] = true;
    r[6][5] = true;
    r[6][6] = true;
    r[6][7] = true;

    return r;
}
