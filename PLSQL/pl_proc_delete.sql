-- 사원번호를 입력받아, 사원번호에 해당하는 CP_EMP4테이블에서 사원정보 삭제
create or replace procedure proc_delete(i_empno number, cnt out number,
	msg out varchar2)
is

begin

	delete from cp_emp4 where empno = i_empno;

	cnt := sql%rowcount;

	if cnt = 1 then
		msg := i_empno||'번 사원정보가 삭제 되었습니다.';
		commit;
	else
	  msg := i_empno||'번 사원은 존재하지 않습니다.';
	end if;

	exception
	when others then
		msg := '삭제 중 문제 발생';

end;
/


