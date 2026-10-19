export function find(haystack: number[], needle: number): number | never {
  // implement binary search algorithm
  let low = 0;
  let high = haystack.length - 1;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    if (haystack[mid] === needle) {
      return mid;
    } else if (haystack[mid] < needle) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  throw new Error('Value not in array');
}
