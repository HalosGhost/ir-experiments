@fs = internal constant [6 x i8] c"%llu \00"

declare i32 @printf (i8* nocapture readonly, ...) nounwind

define  i32 @main () {
    ret i32 0
}
