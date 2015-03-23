@fs = internal constant [6 x i8] c"%llu \00"

declare i32 @printf (i8* nocapture readonly, ...) nounwind

;declare i64 @fibs (i7 nocapture readonly) nounwind

define   i8 @main (i32 %argc, i8** %argv) {

    %a = alloca i64
    %b = alloca i64
    %c = alloca i7

    store i64 1, i64* %a
    store i64 1, i64* %b
    store i7  0, i7*  %c

    br label %.loop_begin

    .loop_begin:
        %d = load i64* %a
        %e = load i64* %b
        %f = add nuw nsw i64 %d, %e
        store i64 %e, i64* %a
        store i64 %f, i64* %b
        %g = load i7* %c
        %h = add nsw nuw i7 %g, 1
        store i7 %h, i7* %c
        %i = icmp ult i7 %h, 98
        br i1 %i, label %.loop_begin, label %.loop_end

    .loop_end:
        ret i8 0
}
