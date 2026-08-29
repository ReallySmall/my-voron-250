; bed.g
; called to perform automatic bed levelling via G32
; Probes near each of the three lead screws and adjusts the Z motors independently
; Probe point order must match the lead screw order in M671 (front-left, front-right, rear-centre)
M561                    ; clear any bed transform
G28                     ; home all axes if not already homed

; First pass
G30 P0 X20 Y20 Z-99999   ; probe near front-left lead screw
G30 P1 X236 Y20 Z-99999  ; probe near front-right lead screw
G30 P2 X128 Y236 Z-99999 S3 ; probe near rear-centre lead screw and calibrate 3 motors

; Second pass to converge
G30 P0 X20 Y20 Z-99999   ; probe near front-left lead screw
G30 P1 X236 Y20 Z-99999  ; probe near front-right lead screw
G30 P2 X128 Y236 Z-99999 S3 ; probe near rear-centre lead screw and calibrate 3 motors

; Re-establish Z=0 at the centre of the bed after adjustment
G1 X128 Y128 F6000
G30

; Probe the mesh grid defined by M557, enable compensation and save it to heightmap.csv
G29
