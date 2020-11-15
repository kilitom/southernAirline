package com.yg.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class userFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        Object object = session.getAttribute("userId");
        //剔除不需要过滤的页面
        String path = req.getRequestURI();
        //当前用户名没有登陆并且url地址包括订单支付
        if (object == null&& path.indexOf("test1")>0){
            PrintWriter writer = resp.getWriter();
            writer.print("<script>alert('请先登录！');window.location='login.jsp'</script>");
            writer.flush();
            writer.close();
            resp.sendRedirect("login.jsp");
        }else {
            filterChain.doFilter(servletRequest,servletResponse);//放行
        }
    }

    @Override
    public void destroy() {

    }
}
