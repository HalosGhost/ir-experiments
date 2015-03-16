@fizz = internal constant [6  x i8] c"Fizz \00"
@buzz = internal constant [6  x i8] c"Buzz \00"
@fzbz = internal constant [10 x i8] c"FizzBuzz \00"
@n3n5 = internal constant [6  x i8] c"%hhu \00"
@nl   = internal constant [2  x i8] c"\0A\00"

declare i32 @printf (i8* nocapture readonly, ...) nounwind

define i32 @main () {

    %cntr = alloca i8
    store i8 1, i8* %cntr

    br label %.loop_body

    .loop_body:
        %c     = load i8* %cntr
        %mod15 = urem i8 %c, 15
        switch i8 %mod15, label %.loop_nfnb [ i8  0, label %.loop_fzbz
                                              i8  5, label %.loop_buzz
                                              i8 10, label %.loop_buzz
                                              i8  3, label %.loop_fizz
                                              i8  6, label %.loop_fizz
                                              i8  9, label %.loop_fizz
                                              i8 12, label %.loop_fizz ]

    .loop_update:
        %cn = add nuw nsw i8 1, %c
        store i8 %cn, i8* %cntr
        %again = icmp ule i8 %cn, 100
        br i1 %again, label %.loop_body, label %.loop_end

    .loop_fzbz:
        call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @fzbz, i32 0, i32 0))
        br label %.loop_update

    .loop_fizz:
        call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @fizz, i32 0, i32 0))
        br label %.loop_update

    .loop_buzz:
        call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @buzz, i32 0, i32 0))
        br label %.loop_update

    .loop_nfnb:
        call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @n3n5, i32 0, i32 0), i8 %c)
        br label %.loop_update

    .loop_end:
        call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @nl, i32 0, i32 0))
        ret i32 0
}
