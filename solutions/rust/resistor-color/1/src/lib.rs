use int_enum::IntEnum;
use enum_iterator::{all, Sequence};

#[repr(u32)]
#[derive(Clone, Copy, Debug, Eq, PartialEq, IntEnum, Sequence)]
pub enum ResistorColor {
    Black = 0,
    Brown = 1,
    Red = 2,
    Orange = 3,
    Yellow = 4,
    Green = 5,
    Blue = 6,
    Violet = 7,
    Grey = 8,
    White = 9,
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    color.int_value()
}

pub fn value_to_color_string(value: u32) -> String {
    print!("color: {value}");
    match ResistorColor::from_int(value) {
        Ok(ResistorColor::Black) => "Black",
        Ok(ResistorColor::Brown) => "Brown",
        Ok(ResistorColor::Red) => "Red",
        Ok(ResistorColor::Orange) => "Orange",
        Ok(ResistorColor::Yellow) => "Yellow",
        Ok(ResistorColor::Green) => "Green",
        Ok(ResistorColor::Blue) => "Blue",
        Ok(ResistorColor::Violet) => "Violet",
        Ok(ResistorColor::Grey) => "Grey",
        Ok(ResistorColor::White) => "White",
        Err(_) => "value out of range"
    }.to_string()
}

pub fn colors() -> Vec<ResistorColor> {
    all::<ResistorColor>().collect::<Vec<_>>()
}
