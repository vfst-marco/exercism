module BookingUpForBeauty

// The following line is needed to use the DateTime type
open System

let schedule (appointmentDateDescription: string) = DateTime.Parse appointmentDateDescription

let hasPassed (appointmentDate: DateTime): bool = appointmentDate < DateTime.Now

let isAfternoonAppointment (appointmentDate: DateTime): bool = appointmentDate >= DateTime (appointmentDate.Year, appointmentDate.Month, appointmentDate.Day, 12, 0, 0) 
                                                            && appointmentDate < DateTime (appointmentDate.Year, appointmentDate.Month, appointmentDate.Day, 18, 0, 0)
let description (appointmentDate: DateTime): string = sprintf "You have an appointment on %s %s." (appointmentDate.ToShortDateString ()) (appointmentDate.ToLongTimeString ())

let anniversaryDate(): DateTime = DateTime(DateTime.Now.Year, 9, 15)
