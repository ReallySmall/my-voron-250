; retractprobe.g
; retracts the BLTouch probe
M280 P0 S90
G4 P200 ; give the pin time to physically retract before the next move starts
