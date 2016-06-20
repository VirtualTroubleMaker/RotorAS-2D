subroutine solverDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl3
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log3_CB
    external::log3_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log3, log3)
    ! ��ʼ��ѡ��ؼ�
    ! �����ĸ�ѡ�
    retlog = DlgSet (log3, ID_tab3, 4, DLG_NUMITEMS )
    retlog = DlgSet (log3, ID_tab3, "����", 1) ! ��һ��
    retlog = DlgSet (log3, ID_tab3, "״̬", 2) ! �ڶ���
    retlog = DlgSet (log3, ID_tab3, "��ʽ", 3) ! ������
    retlog = DlgSet (log3, ID_tab3, "����", 4) ! ���ĸ�
    ! ��ѡ��ͶԻ����Ӧ
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab1, 1)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab2, 2)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab3, 3)
    retlog = DlgSet (log3, ID_tab3, ID_log3_tab4, 4)
 
    ! ��ʼ���Ի����к�tab��ϵ�ĶԻ��������ûص��ӳ���
    
    call log3_tab1_set
    ! ��ʼ���͵�һ��ѡ���Ӧ�ĶԻ���
    ! retlog = DLGINIT(ID_log3_tab1, log3_tab1)
    ! ���õ�һ���Ի���Ļص��ӳ���
    ! retlog = DLGSETSUB (log3_tab1,ID_log3_tab1,log3_tab1_CB)
    ! retlog = DLGSETSUB (log3_tab1,ID_log3_tab1)
   
    !----------------------------------------------
    call log3_tab2_set
    ! ��ʼ���͵ڶ���ѡ���Ӧ�ĶԻ���
    !retlog = DLGINIT(ID_log3_tab2, log3_tab2)
    ! ���õڶ����Ի���Ļص��ӳ���
    !retlog = DLGSETSUB (log3_tab2,ID_log3_tab2,log3_tab2_CB)
    !retlog = DLGSETSUB (log3_tab2,ID_log3_tab2)
   
    !-----------------------------------------------
    call log3_tab3_set
    ! ��ʼ���͵�����ѡ���Ӧ�ĶԻ���
    !retlog = DLGINIT(ID_log3_tab3, log3_tab3)
    
    call log3_tab4_set
    ! ��ʼ���͵��ĸ�ѡ���Ӧ�ĶԻ���
    !retlog = DLGINIT(ID_log3_tab4, log3_tab4)
    
    ! �Ի���ص��ӳ���������ʼ��TAB�ؼ�
    retlog = DLGSETSUB (log3,ID_log3,log3_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
     retlog = DlgSetSub(log3, ID_log3_ok, log3_ok_CB)
 
    ! ��ʾ�Ի���
    results = DLGMODAL(log3) 
   
    ! �ͷŶԻ���ռ�õ���Դ
    call DLGUNINIT (log3)
    call DLGUNINIT (log3_tab1)
    call DLGUNINIT (log3_tab2)
    call DLGUNINIT (log3_tab3)
    call DLGUNINIT (log3_tab4)
    
    end subroutine 
    
subroutine flowExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM

    !use control_Grid,only:jMax,growthRate,thick,airfoilName
    use FVM,only:solver
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    

    integer( kind=4 )::myType,isSolve
    character(len=500):: msg
    character(len=30)::caption
   
    msg = "---ȷ������������ȷ--"
    
    caption = "���"  
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    

    isSolve = MessageBoxQQ(msg,caption,myType)
    
    if( isSolve == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call solver
    end if
    
end subroutine
    