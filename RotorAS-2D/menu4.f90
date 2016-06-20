subroutine postDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl4
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log4_CB
    external::log4_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log4, log4)
   
    ! �Ի���ص��ӳ���
    retlog = DLGSETSUB (log4,ID_log4,log4_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
     retlog = DlgSetSub(log4, ID_log4_ok, log4_ok_CB)
  
    ! ��ʾ�Ի���
    results = DLGMODAL (log4) 
   
    ! �ͷŶԻ���ռ�õ���Դ
    call DLGUNINIT (log4)
!
    end subroutine    
    
subroutine postExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM

    !use control_Grid,only:jMax,growthRate,thick,airfoilName
    use postProcess,only:postSolver
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    

    integer( kind=4 )::myType,isSolve
    character(len=500):: msg
    character(len=30)::caption
   
    msg = "Do you want to continue?"
    
    caption = "����"  
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    

    isSolve = MessageBoxQQ(msg,caption,myType)
    
    if( isSolve == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call postSolver
    end if   
    
end subroutine
    