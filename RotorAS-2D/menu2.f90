subroutine gridDlg(checked)
    USE IFWIN
    USE IFLOGM
    USE ctrl2
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
 
    external::log2_CB
    external::log2_ok_CB

    ! ��ʼ���Ի���
    retlog = DLGINIT(ID_log2, log2)
   
    ! �Ի���ص��ӳ���
    retlog = DLGSETSUB (log2,ID_log2,log2_CB )
  
    ! ���á�ȷ������ť�Ļص��ӳ���
    retlog = DlgSetSub(log2, ID_log2_ok, log2_ok_CB)
 
    ! ��ʾ�Ի���
    results = DLGMODAL(log2) 
   
    ! �ͷŶԻ���ռ�õ���Դ
    call DLGUNINIT (log2)

    end subroutine
    
subroutine gridExe(checked)
    USE IFWIN
    use IFQWIN
    USE IFLOGM
    USE ctrl2
    use control_Grid,only:jMax,growthRate,thick,airfoilName
    use triangleGrid,only:solverUnstructured
    
    implicit none
    integer( kind=4 )::results
    logical( kind=4 )::retlog,checked
    
    character(len=100)::str1
    character(len=100)::str2
    character(len=100)::str3
    character(len=100)::str4
    
    integer( kind=4 )::myType,isGrid
    character(len=500):: msg
    character(len=30)::caption
   
    external::log2_CB
    external::log2_ok_CB
    
    write(str1,*)  jMax
    write(str2,"(F4.1)")  growthRate
    write(str3,"(E6.1E1)")  thick
    write(str4,*)  airfoilName
    
    
    str1 = "�ṹ�������:  "//trim(str1)
    str2 = "������:       "//trim(str2)
    str3=  "��һ�������ȣ�"//trim(str3)
    str4=  "������:       "//trim(str4)//".dat"
    
    !msg =   str1  &
    !    & //str2  &
    !    & //str3  &
    !    & //str4//""C
    
    !msg ="�ṹ���������"//trim(str1) &
    !    &//"\n �����ʣ�"//trim(str2)  &
    !    &//"��һ�������ȣ�"//trim(str3)&
    !    &//"��������"//str4
    
    msg="---ȷ������������ȷ---"
    
    caption = "��������"
    
    myType = MB$ICONQUESTION .or. MB$YESNO .Or. MB$DEFBUTTON1
    
    isGrid = MessageBoxQQ(msg,caption,myType)
    
    if( isGrid == MB$IDYES ) then
        call ClearScreen($GCLEARSCREEN)
        call solverUnstructured
    end if
    
end subroutine
