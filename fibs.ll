@fs = internal constant [6 x i8] c"%llu \00"

declare i32 @printf (i8*, ...) nounwind
declare i32 @putchar (i32) nounwind

define   i8 @main (i32 %argc, i8** %argv) {

    call void @fibs_seq(i7 93)
    %a = call i64 @fibs_idx(i7 92)
    %b = getelementptr inbounds [6 x i8]* @fs, i32 0, i32 0
    call i32 (i8*, ...)* @printf(i8* %b, i64 %a)
    call i32 @putchar(i32 10)
    ret i8 0
}

define void @fibs_seq (i7 %n) nounwind {

    %a = alloca i64
    %b = alloca i64
    %c = alloca i7

    store i64 1, i64* %a
    store i64 1, i64* %b
    store i7  0, i7*  %c

    br label %.loop_body

    .loop_body:
        %d = load i64* %a
        %e = getelementptr inbounds [6 x i8]* @fs, i32 0, i32 0
        call i32 (i8*, ...)* @printf(i8* %e, i64 %d)
        %f = load i64* %b
        %g = add nuw nsw i64 %d, %f
        store i64 %f, i64* %a
        store i64 %g, i64* %b
        %h = load i7* %c
        %i = add nsw nuw i7 %h, 1
        store i7 %i, i7* %c
        %j = icmp ult i7 %i, %n
        br i1 %j, label %.loop_body, label %.loop_end

    .loop_end:
        call i32 @putchar(i32 10)
        ret void
}

define i64 @fibs_idx (i7 %n) nounwind {

    %a = alloca i64
    %b = alloca i64
    %c = alloca i7

    store i64 1, i64* %a
    store i64 1, i64* %b
    store i7  0, i7*  %c

    br label %.loop_body

    .loop_body:
        %d = load i64* %a
        %e = load i64* %b
        %f = add nuw nsw i64 %d, %e
        store i64 %e, i64* %a
        store i64 %f, i64* %b
        %g = load i7* %c
        %h = add nsw nuw i7 %g, 1
        store i7 %h, i7* %c
        %i = icmp ult i7 %h, %n
        br i1 %i, label %.loop_body, label %.loop_end

    .loop_end:
        %j = load i64* %a
        ret i64 %j
}
