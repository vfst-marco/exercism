export function decodedValue(bands: string[]): number {
  const val1 = colorCode(bands[0]);
  const val2 = colorCode(bands[1]);
  return val1 * 10 + val2;
}


export const colorCode = (name: string) => {
    return COLORS.indexOf(name);
}

export const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']
