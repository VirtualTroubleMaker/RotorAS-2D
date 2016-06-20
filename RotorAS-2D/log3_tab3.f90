subroutine log3_tab3_set
    USE IFWIN
    USE IFLOGM
    USE ctrl3
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog
    external::log3_tab3_CB
    external::log3_tab3_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log3_tab3, log3_tab3)
 
    ! �Ի���ص�����
    retlog = DLGSETSUB (log3_tab3,ID_log3_tab3,log3_tab3_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
    retlog = DlgSetSub(log3_tab3, ID_log3_tab3_ok, log3_tab3_ok_CB)
    
    !results = DLGMODAL (datadlg)
    
    !call DLGUNINIT (datadlg)
end subroutine   
    
subroutine log3_tab3_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab3_CB
    Use IFWIN
    USE IFLOGM
    USE ctrl3
    use input,only:conFluxNum,turModelNum
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype

    if (callbacktype == dlg_init) then
    !�Ի�����ʾʱִ��
    ! ��ʼ����һ�������б�
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo1,2, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo1, "JST", 1 )
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo1, "Roe", 2 )

        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo2,3, DLG_NUMITEMS )
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo2, "---", 1 )
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo2, "SA", 2 )
        retlog = DlgSet ( log3_tab3, ID_log3_tab3_combo2, "SST", 3 )  
        
        retlog = DlgSet(dlg, ID_log3_tab3_combo1, conFluxNum)
        retlog = DlgSet(dlg, ID_log3_tab3_combo2, turModelNum)
    
    else
    ! �Ի����˳�ʱִ��
    endif
end subroutine 
    
subroutine log3_tab3_ok_CB( dlg, id, callbacktype)
    !DEC$ ATTRIBUTES DEFAULT :: log3_tab3_ok_CB
    use IFWIN
    use IFQWIN
    use IFLOGM
    use ctrl3
    use input,only:conFluxNum,turModelNum
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
    
    character(len=50)::text
 
    retlog = DlgGet(dlg, ID_log3_tab3_combo1, conFluxNum)
    retlog = DlgGet(dlg, ID_log3_tab3_combo2, turModelNum)
    
  
    
    call ClearScreen($GCLEARSCREEN)
    write(*,*) "!-----------����-------------!"
    write(*,*) "conFluxNum: ",conFluxNum
    write(*,*) "turModelNum: ",turModelNum
    write(*,*) "!---------------------------!"
    
    call schemeSet_Flow(conFluxNum,turModelNum)
end subroutine 

