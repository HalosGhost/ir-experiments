; A work-in-progress bf(++) library
declare i32 @putchar (i32) nounwind
declare i32 @getchar ()    nounwind

define i8* @translate (i8 readonly %c, i8* %p) nounwind {
entry:
    switch i8 %c, label %else [ i8 62, label %incptr
                                i8 60, label %decptr
                                i8 43, label %incbyt
                                i8 45, label %decbyt
                                i8 46, label %putbyt
                                i8 44, label %getbyt
                                i8 91, label %lupbeg
                                i8 93, label %lupend ]

incptr:
    %0 = ptrtoint i8* %p to i64
    %1 = add i64 %0, 1
    %2 = inttoptr i64 %1 to i8*
    ret i8* %2

decptr:
    %3 = ptrtoint i8* %p to i64
    %4 = sub i64 %3, 1
    %5 = inttoptr i64 %4 to i8*
    ret i8* %5

incbyt:
    %6 = load i8, i8* %p
    %7 = add i8 %6, 1
    store i8 %7, i8* %p
    ret i8* %p

decbyt:
    %8 = load i8, i8* %p
    %9 = sub i8 %8, 1
    store i8 %9, i8* %p
    ret i8* %p

putbyt:
    %10 = load i8, i8* %p
    %11 = zext i8 %10 to i32
    %12 = call i32 @putchar(i32 %11)
    ret i8* %p

getbyt:
    %13 = call i32 @getchar()
    %14 = trunc i32 %13 to i8
    store i8 %14, i8* %p
    ret i8* %p

lupbeg:
    ret i8* %p

lupend:
    ret i8* %p

else:
    ret i8* %p
}
