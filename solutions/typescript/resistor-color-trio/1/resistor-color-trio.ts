export function decodedResistorValue(bands: string[]) {
  const val1 = decodedValue(bands);
  const zeroes = colorCode(bands[2]);
  const num = val1 * 10**zeroes;
  return decodeUnit(num);
}

function decodeUnit(num: number): string {
  let val = num;
  let zeroes = 0;
  while(val > 0)
  {
    const tmp = val % 10;
    zeroes += (tmp == 0 ? 1 : 0);
    val = val / 10;
  }
  if (zeroes >= 9) return `${num / 10 ** 9} gigaohms`;
  if (zeroes >= 6) return `${num / 10 ** 6} megaohms`;
  if (zeroes >= 3) return `${num / 10 ** 3} kiloohms`;
  return `${num} ohms`;
}

function decodedValue(bands: string[]): number {
  const val1 = colorCode(bands[0]);
  const val2 = colorCode(bands[1]);
  return val1 * 10 + val2;
}


const colorCode = (name: string) => {
    return COLORS.indexOf(name);
}

const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']
