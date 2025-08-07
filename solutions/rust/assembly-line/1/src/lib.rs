const rate_pre_hour: u32 = 221;

pub fn production_rate_per_hour(speed: u8) -> f64 {
    (speed as u32 * rate_pre_hour) as f64 * success_rate(speed)
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let num = production_rate_per_hour(speed) as f64 / 60.0f64;
    num as u32
}

fn success_rate(speed: u8) -> f64 {
    if speed <= 4 {
        1.0
    } else if speed <= 8 {
        0.9
    } else {
        0.77
    }
}
