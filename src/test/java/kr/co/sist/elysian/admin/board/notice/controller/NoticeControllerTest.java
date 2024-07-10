package kr.co.sist.elysian.admin.board.notice.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.util.HashMap;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeDomain;
import kr.co.sist.elysian.admin.board.notice.model.domain.NoticeListDomain;
import kr.co.sist.elysian.admin.board.notice.model.vo.NoticeVO;
import kr.co.sist.elysian.admin.board.notice.service.NoticeService;


@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
public class NoticeControllerTest {

    private MockMvc mockMvc;

    @Mock
    private NoticeService ns;

    @InjectMocks
    private NoticeController noticeController;

    @Before
    public void setUp() {
        // Mockito 어노테이션 초기화
        MockitoAnnotations.initMocks(this);

        // MockMvc 설정
        mockMvc = MockMvcBuilders.standaloneSetup(noticeController).build();
    }

    @Test
    @Ignore
    public void testSelectNoticeList() throws Exception {
    	
        String dateString1 = "2024-06-10 오후 4:48:51";
        String dateString2 = "2024-06-10 오후 4:49:05";
        
        // 문자열 형식을 지정한 포맷으로 파싱
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
        Date utilDate1 = null;
        Date utilDate2 = null;
        try {
            utilDate1 = dateFormat.parse(dateString1);
            utilDate2 = dateFormat.parse(dateString2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // java.util.Date를 java.sql.Date로 변환
        long utilDateMillis1 = utilDate1.getTime();
        long utilDateMillis2 = utilDate2.getTime();
        java.sql.Date sqlDate1 = new java.sql.Date(utilDateMillis1);
        java.sql.Date sqlDate2 = new java.sql.Date(utilDateMillis2);
        

        
        ///////////////////////////////////////////////////////////
        
        
    	
        List<NoticeListDomain> mockData = new ArrayList<>();
        NoticeListDomain notice1 = new NoticeListDomain();
        notice1.setNoticeNum("NOTICE0001");
        notice1.setNoticeTitle("엘리시안 서울 이용 약관 개정 안내");
        notice1.setNoticeInputDate(sqlDate1);
        notice1.setAdminId("admin1");
        notice1.setNoticeViewCount(5);
        
        NoticeListDomain notice2 = new NoticeListDomain();
        notice1.setNoticeNum("NOTICE0002");
        notice1.setNoticeTitle("엘리시안 서울 객실 가격 안내");
        notice1.setNoticeInputDate(sqlDate2);
        notice1.setAdminId("admin1");
        notice1.setNoticeViewCount(5);
        
        mockData.add(notice1);
        mockData.add(notice2);

        // 서비스의 메서드 동작 설정
        when(ns.selectNoticeList()).thenReturn(mockData);

        // GET 요청을 수행하고 상태를 확인
        mockMvc.perform(get("/admin/notice.do"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/board/notice/notice")) // 예상하는 view의 이름 확인
                .andExpect(model().attributeExists("noticeList")); // 모델 속성 확인
        
    }
    
    @Test
    @Ignore
    public void testSelectNoticeDetail() throws Exception {

        
    	
        // 모의 데이터 준비
        NoticeDomain mockNotice = new NoticeDomain();
        mockNotice.setNoticeNum("NOTICE0001");
        mockNotice.setNoticeInputDate("2024-06-10");
        mockNotice.setNoticeTitle("엘리시안 서울 이용 약관 개정 안내");
        mockNotice.setNoticeContent("공지사항 내용1");

        // 서비스 동작 모의 설정
        String noticeNum = "NOTICE0001"; // 예제 공지 번호
        when(ns.selectNoticeDetail(noticeNum)).thenReturn(mockNotice);

        // 요청 바디 준비 (JSON 형식)
        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("noticeNum", noticeNum);

        // POST 요청 수행 및 검증
        mockMvc.perform(post("/admin/noticeDetail.do")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"noticeNum\": \"NOTICE0001\"}"))
        .andExpect(status().isOk())
        .andExpect(content().contentType("application/json;charset=UTF-8"))
        .andExpect(jsonPath("$.noticeTitle").value("엘리시안 서울 이용 약관 개정 안내"))
        .andExpect(jsonPath("$.noticeContent").value("공지사항 내용1"));
    }

    @Test
    @Ignore
    public void testUpdateNotice() throws Exception {
        // 준비할 NoticeVO 객체
        NoticeVO mockNotice = new NoticeVO();
        mockNotice.setNoticeNum("NOTICE0001");
        mockNotice.setNoticeTitle("엘리시안 서울 이용 약관 수정");
        mockNotice.setNoticeContent("수정된 공지사항 내용");

        // 서비스 동작 설정
        when(ns.updateNotice(mockNotice)).thenReturn(true); // 테스트를 위해 항상 true 반환 설정

        // POST 요청 수행
        mockMvc.perform(post("/admin/updateNotice.do")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"noticeNum\": \"NOTICE0001\", \"noticeTitle\": \"엘리시안 서울 이용 약관 수정\", \"noticeContent\": \"수정된 공지사항 내용\"}")
                )
                .andExpect(status().isOk()); // 상태 코드 200 OK 검증
    }

    
    
    @Test
    public void testSelectNoticeNum() throws Exception {
        // 서비스 동작 설정
        String mockResult = "NOTICE0003"; // 예제로 설정한 가상의 공지 번호
        when(ns.selectNoticeNum()).thenReturn(mockResult);

        // POST 요청 수행
        mockMvc.perform(post("/admin/selectNoticeNum.do")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk()) // 상태 코드 200 OK 검증
                .andExpect(content().contentType("application/json;charset=UTF-8")) // 응답 content type 검증
                .andExpect(jsonPath("$.noticeNum").value(mockResult)); // JSON 응답 내용 검증
    }

    @Test
    public void testInsertNotice() throws Exception {
        // 서비스 동작 설정
        NoticeVO mockNoticeVO = new NoticeVO();
        mockNoticeVO.setNoticeTitle("새로운 공지 제목");
        mockNoticeVO.setNoticeContent("새로운 공지 내용");

        when(ns.insertNotice(mockNoticeVO)).thenReturn(true); // 예제로 true를 반환하도록 설정

        // POST 요청 수행
        mockMvc.perform(post("/admin/insertNotice.do")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"noticeTitle\": \"새로운 공지 제목\", \"noticeContent\": \"새로운 공지 내용\"}")) // 예제 JSON 내용
                .andExpect(status().isOk()) // 상태 코드 200 OK 검증
                .andExpect(content().contentType("application/json;charset=UTF-8")) // 응답 content type 검증
                .andExpect(content().string("true")); // JSON 응답 내용 검증
    }

}
