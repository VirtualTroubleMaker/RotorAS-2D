program main
    !use IFQWIN
    !use user32
    implicit none
    !integer( kind=4 ) :: results,color
    !logical(kind=4)::res , status
    !type (qwinfo) :: winfo
    !type (windowconfig) :: wc
    !type(rccoord):: t
    
    !
    !wc%extendfontname = '����'C
    !wc%title = 'RotorAS-2D'C
    !status = SETWINDOWCONFIG(wc)
    !!---------------------------------  
    !color = RGBTOINTEGER(199,237,204)
    !results = SETBKCOLORRGB (color)
    !call CLEARSCREEN($GCLEARSCREEN)
    !color = RGBTOINTEGER(0,0,0)
    !results = SETTEXTCOLORRGB (color)
    !
    !--------------------------------
    !
    !open(12,file="user",title="hello") 
    !
     
    !res = SetWindowText( GetHwndQQ(QWIN$FRAMEWINDOW) , "RotorAS-2D"C )
    !
    !winfo%type = QWIN$MAX 
    !res = GETWINDOWCONFIG(wc)
    !! ����Ӵ���
    !results = SETWSIZEQQ (0, winfo)
    !! ȡ����ʾ��Ϣ
    !results = SETEXITQQ (QWIN$EXITPERSIST) 
    
    call textOut
    do while (.true.)
    enddo
    
end program 
 
logical(4) function INITIALSETTINGS( )
    use IFQWIN
    implicit none
    integer( kind=4 ) :: results
    logical(kind=4)::res
    type (qwinfo) :: winfo
    external::mainPage,fileDlg
    external::gridDlg,gridExe
    external::solverDlg,flowExe
    external::postDlg,postExe
    external::aboutDlg
 
    winfo%w = 800
    winfo%h = 600
    winfo%type = QWIN$SET
    results = SetWSizeQQ( QWIN$FRAMEWINDOW, winfo )
 
    res = appendmenuqq(1, $MENUENABLED, '�ļ�'C, Nul)
    res = appendmenuqq(1, $MENUENABLED, '����'C, fileDlg)
    res = appendmenuqq(1, $MENUENABLED, '��ҳ'C, mainPage)
    
   
    res = appendmenuqq(2, $MENUENABLED, '����'C, Nul)
    res = appendmenuqq(2, $MENUENABLED, '����'C, gridDlg)
    res = appendmenuqq(2, $MENUENABLED, '����'C, gridExe)
   
    res = appendmenuqq(3, $MENUENABLED, '�����'C,Nul)
    res = appendmenuqq(3, $MENUENABLED, '����'C,solverDlg)
    res = appendmenuqq(3, $MENUENABLED, '���'C,flowExe)
    
    res = appendmenuqq(4, $MENUENABLED, '����'C,Nul)
    res = appendmenuqq(4, $MENUENABLED, '����'C,postDlg)
    res = appendmenuqq(4, $MENUENABLED, '����'C,postExe)
    
    res = appendmenuqq(5, $MENUENABLED, '����'C,aboutDlg)
  
    INITIALSETTINGS= .true.
    return
    end function
    


subroutine fileDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl1
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log1_CB
    external::log1_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log1, log1)
   
    ! �Ի���ص��ӳ���
    retlog = DLGSETSUB (log1,ID_log1,log1_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
     retlog = DlgSetSub(log1, ID_log1_ok, log1_ok_CB)
  
    ! ��ʾ�Ի���
    results = DLGMODAL (log1) 
   
    ! �ͷŶԻ���ռ�õ���Դ
    call DLGUNINIT (log1)
!    
end subroutine
    
 subroutine mainPage
     USE IFQWIN
     USE IFPORT
     implicit none
     integer(kind=2) iret
     iret = RUNQQ('Explorer.exe','http://www.cfder.club'C)
 end subroutine    
subroutine aboutDlg!(checked)
    use IFQWin
    use IFLogM
    use ctrl5
    Implicit None
  
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log5_CB
    external::log5_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log5, log5)
   
    ! �Ի���ص��ӳ���
    retlog = DLGSETSUB (log5,ID_log5,log5_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
    ! retlog = DlgSetSub(log1, ID_log1_ok, log1_ok_CB)
  
    ! ��ʾ�Ի���
    results = DLGMODAL (log5) 
   
    ! �ͷŶԻ���ռ�õ���Դ
    call DLGUNINIT (log5)
    
      !integer(kind=4)::dummy
    !logical(kind=4)::checked
    !
    !!Make sure the entire default menu to be displayed
    !write(*,*)
    !!Set the About Box Message
    !dummy = AboutBoxQQ('RotorAS-2D\r Version 1.3\r Copyright by ���� ɣ����'C)
end subroutine
    
     

    

 

 


    
