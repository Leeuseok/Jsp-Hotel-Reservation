<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Member.MemberBean"%>
<%@ page import="Member.MemberMgr"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 폼에서 업데이트된 회원 정보 가져오기
    String mem_id = request.getParameter("newId");
    String mem_pw = request.getParameter("newPw");
    String mem_name = request.getParameter("newName");
    String mem_phone = request.getParameter("newPhone");
    String mem_addr = request.getParameter("newAddr");
    String mem_birth = request.getParameter("newBirth");

    // 업데이트된 정보를 저장할 MemberBean 객체 생성
    MemberBean updatedMember = new MemberBean();
    updatedMember.setMem_id(mem_id);
    updatedMember.setMem_pw(mem_pw);
    updatedMember.setMem_name(mem_name);
    updatedMember.setMem_phone(mem_phone);
    updatedMember.setMem_addr(mem_addr);
    updatedMember.setMem_birth(mem_birth);
    
    

    // 업데이트를 수행할 MemberMgr 객체 생성
    MemberMgr memberMgr = new MemberMgr();

    // 회원 정보 업데이트
    boolean updateResult = memberMgr.updateMember(updatedMember);

    if (updateResult) {
        // 성공적으로 탈퇴한 경우
        response.getWriter().println("<script>alert('회원 정보 수정이 성공적으로 처리되었습니다.'); window.location.href = 'memberInfo.jsp';</script>");
    } else {
        // 탈퇴 실패한 경우
        response.getWriter().println("<script>alert('회원 정보 수정에 실패했습니다. 다시 시도해주세요.'); window.location.href = 'memeberInfo.jsp';</script>");
    }
%>
