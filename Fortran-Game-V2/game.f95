module subprograms
    implicit none
    character(1), dimension(:, :), allocatable :: a
    integer :: columns,rows
    integer :: curcol,currow
    integer :: x, y
    integer :: deficulty=4
    integer :: input
    character :: tokken
    Logical :: on
    contains
    !settings for game 
    subroutine settings
        print *,"for settings change ,Enter 0"
        print *,"for default(7x6), enter any other number"
        read *,input
        if (input==0) then
            print *,"enter no of columns u want"
            read *,columns
            print *,"enter no of rows u want"
            read *,rows
        else
            columns=7
            rows=6
            end if
        end subroutine settings

    !initiate game before start
    subroutine initiate
        on=.TRUE.
        allocate(a(columns, rows));
        a = " "
        end subroutine initiate

    !display screen
    subroutine display
        a(1, 1) = "o"
        do y = rows, 1, -1
            do x = 1, columns
                print '(3a1,$)', '[', a(x, y), ']'
            end do
        print *
        end do
        do x = 1, columns
            print "('[', I0, ']',$)", x
        end do
        print *
        end subroutine display


    subroutine userInput(player)
        Logical,intent(inout) :: player

        if(player) then
            tokken="o"
        else
            tokken="*"
            end if

        print *,"its ", tokken," turn, enter move"
        read *,input

        !vailid input check
        if (input==0) then
            print *,"exit game"
            on=.False.
        else if(input>columns .or. input<1) then
            print *,"invalid move"
        else
            check : do y=rows,1,-1
                if(a(input,rows)/=" ") then
                    print *,"already filled"
                    exit check
                else if(a(input,y)/=" ") then
                    a(input,y+1)=tokken
                    curcol=input
                    currow=y+1
                    player = .NOT. player
                    exit check
                else if(y==1) then
                    a(input,y)=tokken
                    curcol=input
                    currow=y+1
                    player = .NOT. player
                    end if
            end do check
            call display
            end if
        end subroutine userInput

    end module subprograms
program show
    use subprograms
    Logical :: player
    integer :: t
    call settings
    call initiate
    call display
    player = .TRUE.
    kloop: do while(on)
        call userInput(player)
        if(func(curcol,currow)) then
            print *,"Win ",tokken
            exit kloop
        end if
        end do kloop


    contains
    Logical function func(column_,row_)
        integer, intent(in) :: column_,row_
        Logical :: outp
        integer :: count
        count=0
        func = .False.
        !verticle
        do y=row_,row_-4,-1
            if(a(column_,y)==tokken) then
                count=count+1
            end if
        end do

        if(count>=4) then
            func=.TRUE.
        end if

        !horizontle
        count=0
        do x=1,columns
            if(a(x,row_)==tokken) then
                count=count+1
            end if
        end do

        if(count>=4) then
            func=.TRUE.
        end if

        ! slash
        count=0
        x=column_-4
        do y=row_-4,row_+4
            if(a(x,y)==tokken) then
                count=count+1
            end if
            x=x+1
        end do

        if(count>=4) then
            func=.TRUE.
        end if

        ! backslash
        count=0
        x=column_-4
        do y=row_+4,row_-4,-1
            if(a(x,y)==tokken) then
                count=count+1
            end if
            x=x+1
        end do

        if(count>=4) then
            func=.TRUE.
        end if
        end function func

    


    
end program show