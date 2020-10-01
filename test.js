const assert = require('assert');

const add = (a, b) => a +  b;

const sum = (...numbers) => numbers.reduce(add, 0);

it('should add 3 numbers', () => {
   assert.strictEqual(sum(1, 2, 3), 6);
});
