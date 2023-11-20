
package com.me.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class ReportController {

    @RequestMapping("/generateReport")
    public String generateReport(Model model) {
        // 여기에서 모델에 필요한 데이터를 추가합니다.
        model.addAttribute("reportContent", "This is the report content.");

        // JSP 파일을 참조하여 보고서를 생성합니다.
        return "reportTemplate";
    }

    @RequestMapping("/downloadReport")
    public void downloadReport(Model model, HttpServletResponse response) throws IOException {
        // 다운로드 링크를 클릭할 때 보고서를 다운로드할 수 있도록
        // Content-Disposition 헤더를 설정합니다.
        response.setHeader("Content-Disposition", "attachment; filename=report.html");
        response.setContentType("text/html; charset=UTF-8");

        // JSP 파일 대신 모델을 사용하여 데이터를 출력합니다.
        try (PrintWriter writer = response.getWriter()) {
            writer.println("<html><head><title>Report</title></head><body>");
            writer.println("<h1>Report Content</h1>");
            // 모델에 있는 데이터를 사용합니다.
            writer.println("<p>" + model.addAttribute("reportContent") + "</p>");
            writer.println("</body></html>");
        }
    }
}