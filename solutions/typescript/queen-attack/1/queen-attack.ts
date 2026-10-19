type Position = readonly [number, number]

type Positions = {
  white: Position
  black: Position
}
export class QueenAttack {
  public readonly black: Position
  public readonly white: Position

  // white: [whiteRow, whiteColumn]
  // black: [blackRow, blackColumn]
  constructor({ white, black }: Partial<Positions> = {}) {
    if (white && (white[0] < 0 || white[0] > 7 || white[1] < 0 || white[1] > 7)) {
      throw new Error('Queen must be placed on the board')
    }
    if (black && (black[0] < 0 || black[0] > 7 || black[1] < 0 || black[1] > 7)) {
      throw new Error('Queen must be placed on the board')
    }
    if (white && black && white[0] === black[0] && white[1] === black[1]) {
      throw new Error('Queens cannot share the same space')
    }

    this.white = white || [7, 3]
    this.black = black || [0, 3]

  }

  toString() {
    return [
      ...Array.from({ length: 8 }, (_, row) =>
        Array.from({ length: 8 }, (_, col) => {
          if (row === this.white[0] && col === this.white[1]) return 'W'
          if (row === this.black[0] && col === this.black[1]) return 'B'
          return '_'
        }).join(' ')
      ),
    ].join('\n')
  }

  get canAttack() {
    const [whiteRow, whiteCol] = this.white
    const [blackRow, blackCol] = this.black

    return (
      whiteRow === blackRow ||
      whiteCol === blackCol ||
      Math.abs(whiteRow - blackRow) === Math.abs(whiteCol - blackCol)
    )
  }
}
