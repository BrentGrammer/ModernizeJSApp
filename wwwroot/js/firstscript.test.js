import { exportedFunc } from './firstscript.js';

describe("testing", () => {
  it("should work", () => {
    expect(true).toBe(true);
  });
});

describe("Native ES Modules", () => {
    it("should work", () => {
        expect(() => exportedFunc).not.toThrow();
    });
})
