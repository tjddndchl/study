
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
        // ���⿡�� �𵨿� �ʿ��� �����͸� �߰��մϴ�.
        model.addAttribute("reportContent", "This is the report content.");

        // JSP ������ �����Ͽ� ������ �����մϴ�.
        return "reportTemplate";
    }

    @RequestMapping("/downloadReport")
    public void downloadReport(Model model, HttpServletResponse response) throws IOException {
        // �ٿ�ε� ��ũ�� Ŭ���� �� ������ �ٿ�ε��� �� �ֵ���
        // Content-Disposition ����� �����մϴ�.
        response.setHeader("Content-Disposition", "attachment; filename=report.html");
        response.setContentType("text/html; charset=UTF-8");

        // JSP ���� ��� ���� ����Ͽ� �����͸� ����մϴ�.
        try (PrintWriter writer = response.getWriter()) {
            writer.println("<html><head><title>Report</title></head><body>");
            writer.println("<h1>Report Content</h1>");
            // �𵨿� �ִ� �����͸� ����մϴ�.
            writer.println("<p>" + model.addAttribute("reportContent") + "</p>");
            writer.println("</body></html>");
        }
    }
}