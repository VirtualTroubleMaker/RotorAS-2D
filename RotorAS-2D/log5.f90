! ���Ի���ص��ӳ���
subroutine log5_CB ( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log1_CB
    use IFWIN
    use IFLOGM
    use ctrl5
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype 
    
    character(len=200):: text
    
    text = "RotorAS-2D\rVersion 1.2.3\rCopyright by ���� ɣ����\rֱ����������ѧ���Ҽ��ص�ʵ����"C
    if (callbacktype == dlg_init) then 
        retlog = DlgSet(dlg, ID_log5_static1, text)
    else
    ! �Ի����˳�ʱִ�еĴ���
    endif
    end subroutine
    
subroutine log5_ok_CB( dlg, id, callbacktype )
    !DEC$ ATTRIBUTES DEFAULT :: log5_ok_CB
    use IFWIN
    use IFLOGM
    use ctrl1
    implicit none
    type(dialog) dlg
    logical(kind=4)::retlog
    integer(kind=4):: id, callbacktype
 
  
    !retlog = DlgGet(dlg, ID_log1_edit1, caseRoute)
    !retlog = DlgGet(dlg, ID_log1_edit2, gridNum)
    !retlog = DlgGet(dlg, ID_log1_edit3, fileNum)
    !    
   
 
end subroutine 
 
    
