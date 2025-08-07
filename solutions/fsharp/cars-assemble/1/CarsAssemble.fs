module CarsAssemble

let carsPerHour = 221

let successRate (speed: int): float =
    if speed = 0 then 0.0
    elif speed <= 4 then 1.0
    elif speed <= 8 then 0.9
    elif speed = 9 then 0.8
    elif speed = 10 then 0.77
    else failwith "Invalid speed!"

let productionRatePerHour (speed: int): float =
    float carsPerHour * float speed * successRate speed

let workingItemsPerMinute (speed: int): int =
    let amount = (productionRatePerHour speed) / 60.0
    int amount
