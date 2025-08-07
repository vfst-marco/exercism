-module(space_age).

-export([age/2]).

% Mercury: orbital period 0.2408467 Earth years
% Venus: orbital period 0.61519726 Earth years
% Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
% Mars: orbital period 1.8808158 Earth years
% Jupiter: orbital period 11.862615 Earth years
% Saturn: orbital period 29.447498 Earth years
% Uranus: orbital period 84.016846 Earth years
% Neptune: orbital period 164.79132 Earth years

age(earth, Seconds) -> Seconds / 31557600;
age(Planet, Seconds) -> 
  EarthYears = age(earth, Seconds),
  OrbitalPeriod = case Planet of
    mercury -> 0.2408467;
    venus -> 0.61519726;
    mars -> 1.8808158;
    jupiter -> 11.862615;
    saturn -> 29.447498;
    uranus -> 84.016846;
    neptune -> 164.79132
  end,
  EarthYears / OrbitalPeriod.
