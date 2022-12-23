.model small
.stack 1024
.data
msg1 db "                                  make your own coffee           ","$"
msg2 db 0ah,0dh,0ah,0dh,"                            please enter any key to get start","$"

first dw ?

second dw ?

third dw ?

forth dw ?

;TO LOAD hot COFFEE ORDER           
FIFTH DW ?

SIXTH DW ?

SEVENTH DW ?

EIGHTH DW ?

var db ?

hot db "    1 - Hot coffee ? ","$"

Ice db ,0ah,0dh,"    2 - Ice coffee ?","$" 

ln  db 0ah,0dh,"$"
scup db " 1- small cup ","$"
mcup db " 2- mediam cup " ,"$"
lcup db " 3- large cup" , "$"

back db ,0ah,0dh,"1- Back ","$"

exit db ,0ah,0dh,"2- Exit ","$"

ingrediants db " choose ingrediant you want to add ","$",0ah,0dh
cup db ,0ah,0dh," choose the size of the cup","$"

STORE dw ?,?,?,?
output db 31h,32h,33h
NUMING DB 31H,32H,33H,34H
numiceing db 31h,32h,33h,34h
invalid db " you have entered invalid number ","$"
yes db "1- yes ","$"
icecoffeeorder DB " ICE COFFE ? ","$"
tryagain db " try again : ","$",0ah ,0dh

;ATTACHED TO ICE COFFE
chocolate db " 1- chocolate ","$"
cream db ,0ah,0dh," 2- cream ","$"
cmilk   db ,0ah,0dh," 3- cold milk ","$" 
cramel db ,0ah,0dh," 4- cramel","$"
ice1 db ,0ah,0dh," 5- ice ","$"

n1 db "chocolate","$"
n2 db "cream ","$"
n3 db "cold milk ","#$"
n4 db "cramel " ,"$"
n5 db "ice ","$"

;ATTACHED TO HOT COFFE

dark db ,0ah,0dh,,0ah,0dh, " 1- dark coffee","$"
light db ,0ah,0dh, " 2- light cofee ","$"
milk db  ,0ah,0dh," 3- hot milk ","$"
marc db  ,0ah,0dh," 4- marchmello ","$"

n6 dB " DARK COFFE","$"
n7 dB " LIGHT COFFE","$"
n8 dB " HOT milk ","$"
n9 dB " MARCHMELLO " ,"$"
HOTY DB 31H
hotcoffeeorder db "HOT COFFE ? ","$"

billhot db ,0ah,0dh,"total bill equal 5 dollars ","$"

ORDER2 DB "your  coffee is ready ","$"
 billice db "total bill equal 10 dollarS ","$"

 ICEORDER DB " ICE COFFEE ? "
chooce db " YOUR ORDER IS :","$" 

  
.code
main proc far

    .startup
    
    lea dx,msg1
    call printmesg 
    call printline
    
    lea dx,msg2
    call printmesg 
    
    call readchar
    MOV HOTY ,AL
    jmp ing
    
    ing:
        call printline
        
        lea dx,hot
       call printmesg 
       
       call printline
       
       lea dx,Ice
       call printmesg 
       
       call printline
       call printline
       
      
       
       call readchar
       MOV HOTY ,AL
       JMP L
       ;here we insure that number that user enter must be 1,or ,2 not other
       
       L:
        
         cmp AL,31H
         JE Q
         CMP AL,32H
         JE Q
         JNE UU
         
         UU: 
            JMP C
        
           
         
        
    ;choose the size of cup
            
   q: 
       lea dx,cup
       call printmesg 
       
       call printline
       
       lea dx,scup
       call printmesg 
       
       call printline
       
       lea dx,mcup
       call printmesg 
       
       call printline
       
       lea dx,lcup
       call printmesg 
      
       call printline
       call printline
    
       jmp dmp
  dmp: 
       mov cx,3
       lea di,output
       
       call readchar
       
       ;here we insure that number you enter must be 1,or ,2 or 3 not other
       
      
   SSS:   
        CMP AL,31h
        JE RR
        cmp Al , 32h
        JE RR
        cmp Al , 33h
        JE RR
    
        JNE cc
     
       
       RR:
         
           cmp HOTY,31H
           JE G
           jne try
       try:
           CMP HOTY,32H
           jne endt
           jmp jj
       endt:
           jmp cc    
         
      JJ:
         
          LEA dx,ingrediants
          call printmesg 
          call printline 
       
          lea dx,chocolate
          call printmesg 
       
          lea dx,cream
          call printmesg 
        
          lea dx,cmilk
          call printmesg 
       
         lea dx,cramel
         call printmesg 
        
         lea dx,ice1
         call printmesg 
        
         JMP KK
       
     g:  
       
         lea dx,ingrediants
         call printmesg 
       
        lea dx,dark
        call printmesg 
       
        lea dx,light
        call printmesg 
        
        lea dx,milk
        call printmesg 
       
        lea dx,marc
        call printmesg 
        call printline
        jmp KK
       
      c:
          call printline
          call  invalid2
          call readchar
          cmp al,31H
          JNE BBB
          jmp ING
          
         
     CC:
          call printline
          call  invalid2
          call readchar
          cmp al,31H
          JNE BBB
          jmP q
          
          BBB:
             JMP N
             
       call readchar
        
        KK:
          LEA BP,NUMING
          mov cx,4
          jmp km
       km:
          
          call readchar
          CMP [BP],al
          JE KKKK
          INC BP
          LOOP Km
       
        
          ;hot coffee order  
        
   KKKK:
        call readchar
        cmp al,31H
        jmp o
        jne next
      o:
        mov BL,n6
        MOV FIRST,BX
        PUSH FIRST

       
 
       
   next:
        call readchar
        cmp al,32H
         jmp p
         jne next2
      p:
         mov BL,n7
       
         MOV SECOND,BX
         PUSH SECOND
        
        
   next2:   
        call readchar
        cmp al,33H
         jmp k
         jne next3
       k:
         mov BL,n8
         
         MOV THIRD,BX
         PUSH THIRD
        
        
   next3:   
        CALL readchar
        cmp AL,34H
        JMP M
      M:
        mov BL,n9
        
        MOV FORTH,BX
        PUSH FORTH
        
       
       
      
     
         call printline
         lea dx,chooce
         call printmesg 
         
         CALL PRINTLINE 
         
       
         CMP HOTY ,31H
         JNE II
         JMP YE
         
      YE:
         LEA DX,HOTCOFFEEORDER
         CALL PRINTMESG 
         CALL PRINTLINE
         lea dx,yes
         call printmesg
         call printline
         call readchar
          cmp al,31h
          jne zz
          jmp E
          
          
          
          
   kkk:  
        call printline
        lea bp,numiceing
         mov cx,5
        jmp go
        
   go:  
      call readchar
      cmp al,31h
      jne next4
      mov dl,n1
      push dx
next4:    
      call readchar
      cmp al,32h
      jne next5
      mov dl,n2
      push dx
      
next5:
      call readchar
      cmp al,33h
      jne next6
      mov dl,n3
      push dx
      
next6:      
      
      call readchar
      cmp al,34h
      jne next7
      mov dl,n4
      push dx
      
next7:
      call readchar
      cmp al,35h
      jne ccc
      mov dl,n5
      push dx
      
      
     
           
       II:  
           
           lea dx,ICECOFFEEORDER
           call printmesg
           call printline
           lea dx,yes
           call printmesg
           call printline
         
           call readchar
           mov var,al
           call printline
           cmp var,31h
           jne ZZ
           jmp EE
     
          zz: 
             lea dx,tryagain
             call printmesg
             jmp ing
          
          E:
            lea dx ,order2
            call printmesg 
            call printline
            lea dx,billhot
            call printmesg
            jmp n
         
            
          
     EE:
        
           lea dx ,order2
            call printmesg       
            call printline
            lea dx,billice
            call printmesg
            jmp n
                
    CCC:  
        
          call printline
          call invalid2
          call readchar
          cmp al,hoty
          JMP G
          CMP AL,32H
          JNE N ;BBB
          JMP JJ
          
         
          
    
    
    
          N:
         
    .exit
    
    endp


printline proc near
       lea dx,ln
       mov ah,9h
       int 21h
       ret
    printline endp
    
  printmesg proc near
    mov ah,9H
     int 21h
     ret
  printmesg endp
  readchar proc near
  mov ah ,1
  int 21h
  ret
  readchar endp
  
  invalid2 proc near
  lea dx,invalid
  call printmesg 
  call printline
         lea dx ,back
          call printmesg
          lea dx ,exit
          call printmesg
          
          ret
   invalid2 endp
   
  
          
    end main