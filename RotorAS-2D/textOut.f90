subroutine  textOut
    USE IFQWIN
    use user32
    implicit none
    integer( kind = 4 ) :: results, color, i
    type (qwinfo) :: winfo
    type (windowconfig):: wc
    type (rccoord):: t
    type (xycoord):: wt
    logical( kind=4 ):: status
    character(len=300):: text
    
    results= SetWindowText( GetHwndQQ(QWIN$FRAMEWINDOW) , "RotorAS-2D"C )
    !--------------------------
    !�������ı��������
    wc%numxpixels = -1
    wc%numypixels = -1
    wc%numtextcols = -1
    wc%numtextrows = -1
    wc%numcolors = -1
    !wc%fontsize = QWIN$EXTENDFONT
    wc%title = 'version 1.2.3'C
    !wc%extendfontname = '����'C
    !wc%extendfontsize = #000F001F
    !wc%extendfontattributes = ior(QWIN$EXTENDFONT_ITALIC,QWIN$EXTENDFONT_BOLD ) 
    status = SETWINDOWCONFIG(wc)
    if (status == .false.) then
     !  status = MESSAGEBOXQQ('��������ʧ�ܣ�ϵͳ������...'C, 'Error'C,MB$ICONEXCLAMATION .OR.MB$OK )
        status = SETWINDOWCONFIG(wc)
    end if
   
    results = SETTEXTCOLORRGB (000000)
    !---------------------------------------------------

    ! ���ñ�����ɫ
    color = RGBTOINTEGER(199,237,204)
    results = SETBKCOLORRGB (color)
    call CLEARSCREEN($GCLEARSCREEN)
    winfo%type = QWIN$MAX
    ! ���������
    !results = SETWSIZEQQ(QWIN$FRAMEWINDOW, winfo)
    ! ����Ӵ���
    results = SETWSIZEQQ (0, winfo)

    ! SETCOLORRGB����Ӱ��OUTGTEXT������ı�
    
    results = SETCOLORRGB (000000) 
    results = INITIALIZEFONTS()
    results = SETFONT('t''����''h18w9')
    ! �ı�Ϊ��ɫ
    text = "����ʹ�� RotorAS-2D" 
    
    call MOVETO(200,50,wt)
    call OUTGTEXT(text)

    text = "Ŀǰ���������У���ӭһ��ѧϰ����"C
    call MOVETO(140,90,wt) 
    call OUTGTEXT(text)

   
    
    text = "��Ҫ���ܣ�"C
    call MOVETO(140,160,wt)
    call OUTGTEXT(text)
    text = "1. �ṹ���ǽṹ����������ɣ����ɷ��̣������ƽ�����"C
    call MOVETO(180,190,wt)
    call OUTGTEXT(text)
    text = "2. ȫ����������⣨Ԥ������������������"C
    call MOVETO(180,220,wt)
    call OUTGTEXT(text)
    text = "3. ����ѹ���ֲ��������أ����ͻ��ߣ�"C
    call MOVETO(180,250,wt)
  
    call OUTGTEXT(text)
    text = "ѧϰ����: hangzs@nuaa.edu.cn"C
    call MOVETO(140,290,wt)
    
    call OUTGTEXT(text)
    
    ! ȡ����ʾ��Ϣ
    results = SETEXITQQ (QWIN$EXITPERSIST)
    
  
end subroutine
    