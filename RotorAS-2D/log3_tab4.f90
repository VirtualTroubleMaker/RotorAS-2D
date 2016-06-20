subroutine log3_tab4_set
   USE IFWIN
   USE IFLOGM
   USE ctrl3
   implicit none
   integer( kind=4 )::results
   logical( kind=4 )::retlog
   external:: log3_tab4_CB
   external:: log3_tab4_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log3_tab4, log3_tab4)
    
    ! �Ի���ص�����
    retlog = DLGSETSUB (log3_tab4,ID_log3_tab4,log3_tab4_CB )
    
    ! ���á�ȷ������ť�Ļص��ӳ���
    retlog = DlgSetSub(log3_tab4, ID_log3_tab4_ok, log3_tab4_ok_CB)
    
    !results = DLGMODAL (datadlg)
    !call DLGUNINIT (datadlg)
    
end subroutine 
    
subroutine log3_tab4_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab4_CB
    Use IFWIN
    USE IFLOGM
    USE ctrl3
    use input,only:staticMax,eps,cycleNum,cycleStep,steps,inStep,eps_in,CFL,dt_r
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
    if (callbacktype == dlg_init) then
    ! �Ի�����ʾʱִ��
    ! ��ʼ����һ�������б�
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1,5, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1, "1.0E-4", 1 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1, "1.0E-5", 2 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1, "1.0E-6", 3 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1, "1.0E-7", 4 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo1, "1.0E-8", 5 )
    
        ! ��ʼ����һ�������б�
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo2,3, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo2, "1.0E-2", 1 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo2, "1.0E-3", 2 )
        retlog = DlgSet ( log3_tab4, ID_log3_tab4_combo2, "1.0E-4", 3 )
        
        retlog = DlgSet(dlg, ID_log3_tab4_edit1, staticMax)
        retlog = DlgSet(dlg, ID_log3_tab4_combo1, eps)
        retlog = DlgSet(dlg, ID_log3_tab4_edit2, cycleNum)
        retlog = DlgSet(dlg, ID_log3_tab4_edit3, cycleStep)
        retlog = DlgSet(dlg, ID_log3_tab4_edit4, steps)
        retlog = DlgSet(dlg, ID_log3_tab4_edit5, instep)
        retlog = DlgSet(dlg, ID_log3_tab4_combo2, eps_in)
        retlog = DlgSet(dlg, ID_log3_tab4_edit6, CFL)
        retlog = DlgSet(dlg, ID_log3_tab4_edit7, dt_r)
        
    else
    ! �Ի����˳�ʱִ��
    !    retlog = DlgGet (dlg, ID_log3_tab4_edit2, str)
     !   write(0,*)str
    endif
    end subroutine 

subroutine log3_tab4_ok_CB( dlg, id, callbacktype)
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab4_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl3
    use input,only:staticMax,eps,cycleNum,cycleStep,steps,inStep,eps_in,CFL,dt_r
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
    
    retlog = DlgGet(dlg, ID_log3_tab4_edit1, staticMax)
    retlog = DlgGet(dlg, ID_log3_tab4_combo1, eps)
    retlog = DlgGet(dlg, ID_log3_tab4_edit2, cycleNum)
    retlog = DlgGet(dlg, ID_log3_tab4_edit3, cycleStep)
    retlog = DlgGet(dlg, ID_log3_tab4_edit4, steps)
    retlog = DlgGet(dlg, ID_log3_tab4_edit5, instep)
    retlog = DlgGet(dlg, ID_log3_tab4_combo2, eps_in)
    retlog = DlgGet(dlg, ID_log3_tab4_edit6, CFL)
    retlog = DlgGet(dlg, ID_log3_tab4_edit7, dt_r)
     
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------����-------------!"
    write(*,*)  "staticMax: ",staticMax
    write(*,*)  "eps: ",eps
    write(*,*)  "cycleNum: ",cycleNum
    write(*,*)  "cycleStep: ",cycleStep
    write(*,*)  "steps: ",steps
    write(*,*)  "inStep: ",inStep
    write(*,*)  "eps_in: ",eps_in
    write(*,*)  "CFL: ",CFL
    write(*,*)  "dt_r: ",dt_r
    write(*,*) "!---------------------------!"
    
    call iterSet_Flow(staticMax,eps,cycleNum,cycleStep,steps,inStep,eps_in,CFL,dt_r)
end subroutine 
