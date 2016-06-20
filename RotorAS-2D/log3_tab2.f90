subroutine log3_tab2_set
   USE IFWIN
   USE IFLOGM
   USE ctrl3
   implicit none
   integer( kind=4 )::results
   logical( kind=4 )::retlog
   external:: log3_tab2_CB
   external:: log3_tab2_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log3_tab2, log3_tab2)
   ! �Ի���ص�����
    retlog = DLGSETSUB (log3_tab2,ID_log3_tab2,log3_tab2_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
    retlog = DlgSetSub(log3_tab2, ID_log3_tab2_ok, log3_tab2_ok_CB)
    
    !results = DLGMODAL (datadlg)
    
    !call DLGUNINIT (datadlg)
    end subroutine 
    
subroutine log3_tab2_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab2_CB
    Use IFWIN
    USE IFLOGM
    USE ctrl3
    use input,only:isMove,ampl,kr
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype

    if (callbacktype == dlg_init) then
    ! �Ի�����ʾʱִ��
      ! ��ʼ����һ�������б�
        retlog = DlgSet ( log3_tab2, ID_log3_tab2_combo1,2, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab2, ID_log3_tab2_combo1, "Y", 1 )
        retlog = DlgSet ( log3_tab2, ID_log3_tab2_combo1, "N", 2 )
       
        retlog = DlgSet(dlg, ID_log3_tab2_combo1,isMove)
        retlog = DlgSet(dlg, ID_log3_tab2_edit1, ampl)
        retlog = DlgSet(dlg, ID_log3_tab2_edit2, kr)
    else
    !�Ի����˳�ʱִ��
  
    endif
end subroutine 
    
    
subroutine log3_tab2_ok_CB( dlg, id, callbacktype)
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab2_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl3
    use input,only:isMove,ampl,kr
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
  
 
    retlog = DlgGet(dlg, ID_log3_tab2_combo1,isMove)
    retlog = DlgGet(dlg, ID_log3_tab2_edit1, ampl)
    retlog = DlgGet(dlg, ID_log3_tab2_edit2, kr)
   
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------����-------------!"
    write(*,*) "isMove:",isMove
    write(*,*) "ampl:",ampl
    write(*,*) "kr:",kr
    write(*,*) "!---------------------------!"
   
    call motionSet_Flow(isMove,ampl,kr)
    
end subroutine 

